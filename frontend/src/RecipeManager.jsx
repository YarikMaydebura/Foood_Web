import { useEffect, useMemo, useState } from "react";
import { Navigate, useNavigate } from "react-router-dom";
import { motion, AnimatePresence } from "framer-motion";
import {
  Book,
  Plus,
  Edit2,
  Trash2,
  X,
  Search,
  Calendar,
  LogOut,
  User,
  ShoppingCart,
  Settings,
  ChevronDown,
  Share2,
  Clock,
  Users,
  Compass,
  Flame,
  ChefHat,
  SlidersHorizontal,
  AlertTriangle,
  Heart,
} from "lucide-react";
import RecipeLibrary from "./components/RecipeLibrary";

// API configuration
const API_BASE_URL = import.meta.env.VITE_API_BASE_URL ?? "http://127.0.0.1:8000";
const APP_URL = import.meta.env.VITE_APP_URL ?? window.location.origin;

// Helper: Get the Monday of the current week as YYYY-MM-DD string
const getWeekStartDate = () => {
  const now = new Date();
  const dayOfWeek = now.getDay();
  const diff = dayOfWeek === 0 ? -6 : 1 - dayOfWeek; // Adjust to Monday
  const monday = new Date(now);
  monday.setDate(now.getDate() + diff);
  return monday.toISOString().split('T')[0];
};

// Helper function to get auth headers for Session 2 authentication
const getAuthHeaders = () => {
  const token = localStorage.getItem("authToken");
  return {
    "Content-Type": "application/json",
    ...(token && { Authorization: `Bearer ${token}` }),
  };
};

const api = {
  login: async (email, password) => {
    try {
      const response = await fetch(`${API_BASE_URL}/auth/login`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, password }),
      });

      const data = await response.json();
      if (!response.ok) return { error: data.detail || "Login failed" };

      // Store auth token for Session 2
      if (data.access_token) {
        localStorage.setItem("authToken", data.access_token);
      }

      return data;
    } catch (err) {
      return { error: "Network error" };
    }
  },

  signup: async (name, email, password) => {
    try {
      const response = await fetch(`${API_BASE_URL}/auth/signup`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ name, email, password }),
      });

      const data = await response.json();
      if (!response.ok) return { error: data.detail || "Signup failed" };

      // Store auth token for Session 2
      if (data.access_token) {
        localStorage.setItem("authToken", data.access_token);
      }

      return data;
    } catch (err) {
      return { error: "Network error" };
    }
  },

  getCurrentUser: async () => {
    try {
      const response = await fetch(`${API_BASE_URL}/auth/me`, {
        headers: getAuthHeaders(),
      });

      if (!response.ok) {
        // Token is invalid or expired
        localStorage.removeItem("authToken");
        return { error: "Session expired" };
      }

      const data = await response.json();
      return data;
    } catch (err) {
      return { error: "Network error" };
    }
  },

  deleteAccount: async () => {
    try {
      const response = await fetch(`${API_BASE_URL}/auth/me`, {
        method: "DELETE",
        headers: getAuthHeaders(),
      });
      if (!response.ok) {
        const data = await response.json().catch(() => ({}));
        return { error: data.detail || "Failed to delete account" };
      }
      return { success: true };
    } catch (err) {
      return { error: "Network error" };
    }
  },

  getRecipes: async () => {
    try {
      const response = await fetch(`${API_BASE_URL}/recipes`, {
        headers: getAuthHeaders(),
      });
      const data = await response.json();
      if (!response.ok) return { error: data.detail || "Failed to fetch recipes" };
      return data;
    } catch (err) {
      return { error: "Network error" };
    }
  },

  getSavedRecipes: async () => {
    try {
      const response = await fetch(`${API_BASE_URL}/library/saved`, {
        headers: getAuthHeaders(),
      });
      const data = await response.json();
      if (!response.ok) return { error: data.detail || "Failed to fetch saved recipes", items: [] };
      return data;
    } catch (err) {
      return { error: "Network error", items: [] };
    }
  },

  getLibraryRecipes: async () => {
    // Page through /library/recipes (public, no auth required) until exhausted.
    const PAGE_SIZE = 100;
    const items = [];
    let offset = 0;
    try {
      while (true) {
        const response = await fetch(
          `${API_BASE_URL}/library/recipes?limit=${PAGE_SIZE}&offset=${offset}`,
          { headers: getAuthHeaders() }
        );
        if (!response.ok) break;
        const data = await response.json();
        const page = data.items || [];
        items.push(...page);
        if (!data.has_more || page.length === 0) break;
        offset += page.length;
        if (offset > 1000) break; // safety stop
      }
      return { items };
    } catch (err) {
      return { error: "Network error", items };
    }
  },

  createRecipe: async (recipe) => {
    try {
      const response = await fetch(`${API_BASE_URL}/recipes`, {
        method: "POST",
        headers: getAuthHeaders(),
        body: JSON.stringify(recipe),
      });

      const data = await response.json();
      if (!response.ok) return { error: data.detail || "Failed to create recipe" };
      return data;
    } catch (err) {
      return { error: "Network error" };
    }
  },

  updateRecipe: async (id, recipe) => {
    try {
      const response = await fetch(`${API_BASE_URL}/recipes/${id}`, {
        method: "PUT",
        headers: getAuthHeaders(),
        body: JSON.stringify(recipe),
      });

      const data = await response.json();
      if (!response.ok) return { error: data.detail || "Failed to update recipe" };
      return data;
    } catch (err) {
      return { error: "Network error" };
    }
  },

  deleteRecipe: async (id) => {
    try {
      const response = await fetch(`${API_BASE_URL}/recipes/${id}`, {
        method: "DELETE",
        headers: getAuthHeaders(),
      });

      if (!response.ok) {
        const data = await response.json();
        return { error: data.detail || "Failed to delete recipe" };
      }
      return { success: true };
    } catch (err) {
      return { error: "Network error" };
    }
  },

  getMealPlan: async () => {
    try {
      const response = await fetch(`${API_BASE_URL}/meal-plan`, {
        headers: getAuthHeaders(),
      });
      const data = await response.json();
      if (!response.ok) return { error: data.detail || "Failed to fetch meal plan" };
      return data;
    } catch (err) {
      return { error: "Network error" };
    }
  },

  updateMealPlan: async (plan) => {
    try {
      const response = await fetch(`${API_BASE_URL}/meal-plan`, {
        method: "PUT",
        headers: getAuthHeaders(),
        body: JSON.stringify(plan),
      });

      const data = await response.json();
      if (!response.ok) return { error: data.detail || "Failed to update meal plan" };
      return data;
    } catch (err) {
      return { error: "Network error" };
    }
  },

  // Shopping List API methods
  generateShoppingList: async (weekStartDate) => {
    try {
      const response = await fetch(`${API_BASE_URL}/shopping-lists/generate`, {
        method: "POST",
        headers: getAuthHeaders(),
        body: JSON.stringify({ week_start_date: weekStartDate }),
      });
      const data = await response.json();
      if (!response.ok) return { error: data.detail || "Failed to generate shopping list" };
      return data;
    } catch (err) {
      return { error: "Network error" };
    }
  },

  getShoppingList: async (weekStartDate) => {
    try {
      const response = await fetch(`${API_BASE_URL}/shopping-lists/week/${weekStartDate}`, {
        headers: getAuthHeaders(),
      });
      if (response.status === 404) return null;
      const data = await response.json();
      if (!response.ok) return { error: data.detail || "Failed to fetch shopping list" };
      return data;
    } catch (err) {
      return { error: "Network error" };
    }
  },

  toggleShoppingItem: async (itemId) => {
    try {
      const response = await fetch(`${API_BASE_URL}/shopping-lists/items/${itemId}/toggle`, {
        method: "POST",
        headers: getAuthHeaders(),
      });
      const data = await response.json();
      if (!response.ok) return { error: data.detail || "Failed to toggle item" };
      return data;
    } catch (err) {
      return { error: "Network error" };
    }
  },
};

// Difficulty Badge Component with gradient styling
function DifficultyBadge({ difficulty }) {
  const styles = {
    easy: {
      bg: 'bg-gradient-to-r from-green-400 to-emerald-500',
      icon: '🌱',
      text: 'Easy'
    },
    medium: {
      bg: 'bg-gradient-to-r from-amber-400 to-orange-500',
      icon: '🔥',
      text: 'Medium'
    },
    hard: {
      bg: 'bg-gradient-to-r from-red-500 to-rose-600',
      icon: '💪',
      text: 'Hard'
    }
  };

  const style = styles[difficulty?.toLowerCase()] || styles.medium;

  return (
    <span className={`${style.bg} text-white text-xs font-bold px-2.5 py-1 rounded-full shadow-sm`}>
      {style.icon} {style.text}
    </span>
  );
}

// Recipe Card Component with animations
function RecipeCard({ recipe, onEdit, onDelete, onShare, onUnsave }) {
  const navigate = useNavigate();
  const totalTime = (recipe.prep_time_minutes || 0) + (recipe.cook_time_minutes || 0);

  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      whileHover={{ y: -4 }}
      className="bg-white rounded-2xl shadow-md hover:shadow-xl transition-all duration-300 overflow-hidden cursor-pointer group"
      onClick={() => recipe.slug ? navigate(`/recipe/${recipe.slug}`) : null}
    >
      {/* Image with overlay */}
      <div className="relative h-48 overflow-hidden">
        {recipe.image_url ? (
          <img
            src={recipe.image_url.includes('unsplash.com')
              ? `${recipe.image_url}?w=400&h=300&q=75&fm=webp&fit=crop`
              : recipe.image_url}
            alt={recipe.title}
            className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
            loading="lazy"
            onError={(e) => {
              e.target.style.display = 'none';
            }}
          />
        ) : (
          <div className="w-full h-full bg-gradient-to-br from-orange-100 to-amber-100 flex items-center justify-center">
            <ChefHat className="w-16 h-16 text-orange-300" />
          </div>
        )}
        <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent" />

        {/* Share button */}
        <button
          onClick={(e) => { e.stopPropagation(); onShare(recipe); }}
          className="absolute top-3 right-3 z-10 bg-white/90 hover:bg-white p-2 rounded-full shadow-lg transition group/share"
          title="Share recipe"
        >
          <Share2 className="w-4 h-4 text-gray-700 group-hover/share:text-orange-500 transition" />
        </button>

        {/* Badges on image */}
        <div className="absolute top-3 left-3 flex flex-wrap gap-2">
          {recipe.isSavedFromLibrary && (
            <span className="bg-orange-500 text-white text-xs font-medium px-2.5 py-1 rounded-full">
              Saved
            </span>
          )}
          {recipe.cuisine && (
            <span className="bg-purple-500 text-white text-xs font-medium px-2.5 py-1 rounded-full">
              {recipe.cuisine}
            </span>
          )}
          {recipe.difficulty && <DifficultyBadge difficulty={recipe.difficulty} />}
        </div>

        {/* Quick info at bottom of image */}
        <div className="absolute bottom-3 left-3 flex gap-2">
          {totalTime > 0 && (
            <span className="flex items-center gap-1 text-white text-xs bg-black/40 px-2 py-1 rounded-full backdrop-blur-sm">
              <Clock className="w-3 h-3" />
              {totalTime}m
            </span>
          )}
          {recipe.servings && (
            <span className="flex items-center gap-1 text-white text-xs bg-black/40 px-2 py-1 rounded-full backdrop-blur-sm">
              <Users className="w-3 h-3" />
              {recipe.servings}
            </span>
          )}
          {recipe.calories && (
            <span className="flex items-center gap-1 text-white text-xs bg-black/40 px-2 py-1 rounded-full backdrop-blur-sm">
              <Flame className="w-3 h-3" />
              {recipe.calories} cal
            </span>
          )}
        </div>
      </div>

      {/* Content */}
      <div className="p-4">
        <h3 className="text-lg font-semibold text-gray-900 group-hover:text-orange-600 transition-colors line-clamp-1 mb-2">
          {recipe.title}
        </h3>

        {recipe.tags && recipe.tags.length > 0 && (
          <div className="flex flex-wrap gap-1 mb-3">
            {(() => {
              const mealTypes = ['Breakfast', 'Lunch', 'Dinner'];
              const tagList = recipe.tags.map(t => typeof t === 'string' ? t : t.name);
              const mealTags = tagList.filter(t => mealTypes.includes(t));
              const otherTags = tagList.filter(t => !mealTypes.includes(t)).sort((a, b) => a.localeCompare(b));
              const sorted = [...mealTags, ...otherTags].slice(0, 4);

              return sorted.map((tag, index) => {
                const isMealType = mealTypes.includes(tag);
                return (
                  <span
                    key={index}
                    className={`px-2 py-0.5 text-xs rounded-full ${
                      isMealType
                        ? 'bg-orange-100 text-orange-700 border border-orange-300'
                        : 'bg-gray-100 text-gray-600'
                    }`}
                  >
                    {tag}
                  </span>
                );
              });
            })()}
          </div>
        )}

        {/* Only show Edit/Delete for user-created recipes, not saved library recipes */}
        {!recipe.isSavedFromLibrary ? (
          <div className="flex gap-2" onClick={(e) => e.stopPropagation()}>
            <button
              onClick={() => onEdit(recipe)}
              className="flex-1 flex items-center justify-center gap-2 bg-sky-50 text-sky-700 border border-sky-200 px-3 py-2 rounded-xl hover:bg-sky-100 transition text-sm font-medium"
            >
              <Edit2 className="w-4 h-4" />
              Edit
            </button>
            <button
              onClick={() => onDelete(recipe.id)}
              className="flex-1 flex items-center justify-center gap-2 bg-red-50 text-red-700 border border-red-200 px-3 py-2 rounded-xl hover:bg-red-100 transition text-sm font-medium"
            >
              <Trash2 className="w-4 h-4" />
              Delete
            </button>
          </div>
        ) : (
          <div className="flex gap-2" onClick={(e) => e.stopPropagation()}>
            <button
              onClick={() => onUnsave && onUnsave(recipe.id)}
              className="flex-1 flex items-center justify-center gap-2 bg-red-50 text-red-700 border border-red-200 px-3 py-2 rounded-xl hover:bg-red-100 transition text-sm font-medium"
            >
              <X className="w-4 h-4" />
              Remove
            </button>
          </div>
        )}
      </div>
    </motion.div>
  );
}

const RecipesView = ({
  recipes,
  loading,
  searchQuery,
  setSearchQuery,
  selectedTags,
  setSelectedTags,
  allTags,
  onAddRecipe,
  onEditRecipe,
  onDeleteRecipe,
  onUnsaveRecipe,
  viewTitle = "My Recipes",
  viewSubtitle = "Your personal recipe collection",
  emptyStateTitle = "No recipes yet",
  emptyStateMessage = "Start building your recipe collection!",
}) => {
  const [currentPage, setCurrentPage] = useState(1);
  const [sortBy, setSortBy] = useState('date-newest');
  const [showTagFilter, setShowTagFilter] = useState(false);
  const [tagSearch, setTagSearch] = useState('');
  const recipesPerPage = 12;

  // Close popover on click-outside
  useEffect(() => {
    if (!showTagFilter) return;
    const handler = (e) => {
      if (!e.target.closest('[data-tag-filter-root]')) {
        setShowTagFilter(false);
        setTagSearch('');
      }
    };
    document.addEventListener('mousedown', handler);
    return () => document.removeEventListener('mousedown', handler);
  }, [showTagFilter]);

  const visibleTags = useMemo(() => {
    if (!tagSearch.trim()) return allTags;
    const q = tagSearch.trim().toLowerCase();
    return allTags.filter((t) => t.toLowerCase().includes(q));
  }, [allTags, tagSearch]);

  // Sort recipes based on selected option
  const sortedRecipes = [...recipes].sort((a, b) => {
    if (sortBy === 'alphabetical') {
      return a.title.localeCompare(b.title);
    } else if (sortBy === 'date-newest') {
      // Sort by date (newest first)
      return new Date(b.created_at) - new Date(a.created_at);
    } else if (sortBy === 'date-oldest') {
      // Sort by date (oldest first)
      return new Date(a.created_at) - new Date(b.created_at);
    }
    return 0;
  });

  // Calculate pagination
  const indexOfLastRecipe = currentPage * recipesPerPage;
  const indexOfFirstRecipe = indexOfLastRecipe - recipesPerPage;
  const currentRecipes = sortedRecipes.slice(indexOfFirstRecipe, indexOfLastRecipe);
  const totalPages = Math.ceil(sortedRecipes.length / recipesPerPage);

  // Reset to page 1 when filters or sort changes
  useEffect(() => {
    setCurrentPage(1);
  }, [searchQuery, selectedTags, recipes.length, sortBy]);

  const goToPage = (page) => {
    setCurrentPage(page);
    window.scrollTo({ top: 0, behavior: 'smooth' });
  };

  const handleShareRecipe = (recipe) => {
    // Create a shareable recipe data object
    const shareableRecipe = {
      title: recipe.title,
      description: recipe.description || '',
      image_url: recipe.image_url || '',
      instructions: recipe.instructions,
      ingredients: recipe.recipe_ingredients?.map(ri => ({
        ingredient_name: `${ri.quantity || ''} ${ri.unit || ''} ${ri.ingredient?.name || ''}`.trim(),
      })) || [],
      tags: recipe.tags?.map(t => typeof t === 'string' ? t : t.name) || []
    };

    // Encode recipe data as base64 JSON for sharing
    const encodedRecipe = btoa(JSON.stringify(shareableRecipe));
    const shareUrl = `${APP_URL}/import?recipe=${encodedRecipe}`;

    // Try Web Share API first (works on mobile)
    if (navigator.share) {
      navigator.share({
        title: `Recipe: ${recipe.title}`,
        text: `Check out this recipe: ${recipe.title}`,
        url: shareUrl
      }).catch(err => {
        // If share was cancelled or failed, try clipboard
        if (err.name !== 'AbortError') {
          copyShareUrl(shareUrl);
        }
      });
    } else {
      // Fallback to copying to clipboard
      copyShareUrl(shareUrl);
    }
  };

  const copyShareUrl = (url) => {
    // Try clipboard API first
    if (navigator.clipboard && navigator.clipboard.writeText) {
      navigator.clipboard.writeText(url).then(() => {
        alert('Share link copied to clipboard! Send this link to someone to add the recipe to their account.');
      }).catch(() => {
        // Clipboard failed, show URL in alert to manually copy
        prompt('Copy this share link:', url);
      });
    } else {
      // No clipboard API, use prompt as fallback
      prompt('Copy this share link:', url);
    }
  };

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h2 className="text-2xl sm:text-3xl font-bold text-gray-900">{viewTitle}</h2>
          <p className="text-gray-500 text-sm mt-1">{viewSubtitle}</p>
        </div>
        {onAddRecipe && (
          <button
            onClick={onAddRecipe}
            className="flex items-center gap-2 bg-gradient-to-r from-orange-500 to-orange-600 text-white px-4 sm:px-6 py-2.5 sm:py-3 rounded-xl hover:from-orange-600 hover:to-orange-700 transition-all shadow-md hover:shadow-lg font-medium"
          >
            <Plus className="w-5 h-5" />
            <span className="hidden sm:inline">Add Recipe</span>
          </button>
        )}
      </div>

      <div className="mb-6 space-y-4">
        <div className="flex gap-3">
          <div className="relative flex-1">
            <Search className="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-400 w-5 h-5" />
            <input
              type="text"
              placeholder="Search recipes or ingredients..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              className="w-full pl-12 pr-4 py-3 bg-white border-0 rounded-xl shadow-sm focus:ring-2 focus:ring-orange-500 transition-all"
            />
          </div>
          <select
            value={sortBy}
            onChange={(e) => setSortBy(e.target.value)}
            className="px-4 py-3 bg-white border-0 rounded-xl shadow-sm focus:ring-2 focus:ring-orange-500 cursor-pointer font-medium text-gray-700"
          >
            <option value="date-newest">Newest</option>
            <option value="date-oldest">Oldest</option>
            <option value="alphabetical">A-Z</option>
          </select>
        </div>

        {allTags.length > 0 && (
          <div className="relative flex flex-wrap items-center gap-2" data-tag-filter-root>
            <button
              type="button"
              onClick={() => setShowTagFilter((v) => !v)}
              className={`flex items-center gap-2 px-4 py-2 rounded-full text-sm font-medium transition-all border ${
                showTagFilter
                  ? 'bg-white border-orange-400 text-orange-600 shadow-sm'
                  : 'bg-white border-transparent text-gray-700 shadow-sm hover:shadow-md'
              }`}
            >
              <SlidersHorizontal className="w-4 h-4" />
              <span>Filter</span>
              {selectedTags.length > 0 && (
                <span className="inline-flex items-center justify-center w-5 h-5 text-xs font-semibold text-white bg-orange-500 rounded-full">
                  {selectedTags.length}
                </span>
              )}
            </button>

            {selectedTags.map((tag) => (
              <span
                key={tag}
                className="inline-flex items-center gap-1.5 pl-3 pr-2 py-1.5 rounded-full text-sm font-medium bg-orange-100 text-orange-700"
              >
                {tag}
                <button
                  type="button"
                  onClick={() =>
                    setSelectedTags(selectedTags.filter((t) => t !== tag))
                  }
                  className="text-orange-500 hover:text-orange-700"
                  aria-label={`Remove ${tag} filter`}
                >
                  <X className="w-3.5 h-3.5" />
                </button>
              </span>
            ))}

            {showTagFilter && (
              <motion.div
                initial={{ opacity: 0, y: -4 }}
                animate={{ opacity: 1, y: 0 }}
                className="absolute top-full mt-2 left-0 z-30 w-80 max-w-[calc(100vw-2rem)] bg-white rounded-2xl shadow-2xl border border-gray-100 overflow-hidden"
              >
                <div className="p-3 border-b border-gray-100">
                  <div className="relative">
                    <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
                    <input
                      type="text"
                      autoFocus
                      placeholder="Search tags..."
                      value={tagSearch}
                      onChange={(e) => setTagSearch(e.target.value)}
                      className="w-full pl-9 pr-3 py-2 text-sm bg-gray-50 border-0 rounded-lg focus:ring-2 focus:ring-orange-500"
                    />
                  </div>
                </div>
                <div className="max-h-72 overflow-y-auto p-3">
                  {visibleTags.length === 0 ? (
                    <p className="text-sm text-gray-500 text-center py-4">
                      No matching tags
                    </p>
                  ) : (
                    <div className="flex flex-wrap gap-1.5">
                      {visibleTags.map((tag) => {
                        const active = selectedTags.includes(tag);
                        return (
                          <button
                            key={tag}
                            type="button"
                            onClick={() =>
                              setSelectedTags(
                                active
                                  ? selectedTags.filter((t) => t !== tag)
                                  : [...selectedTags, tag]
                              )
                            }
                            className={`px-3 py-1.5 rounded-full text-xs font-medium transition-colors border ${
                              active
                                ? 'bg-orange-500 text-white border-orange-500'
                                : 'bg-white text-gray-700 border-gray-200 hover:border-orange-300'
                            }`}
                          >
                            {tag}
                          </button>
                        );
                      })}
                    </div>
                  )}
                </div>
                {selectedTags.length > 0 && (
                  <div className="px-3 py-2 border-t border-gray-100 flex items-center justify-between">
                    <span className="text-xs text-gray-500">
                      {selectedTags.length} selected
                    </span>
                    <button
                      type="button"
                      onClick={() => setSelectedTags([])}
                      className="text-xs font-medium text-orange-600 hover:text-orange-700"
                    >
                      Clear all
                    </button>
                  </div>
                )}
              </motion.div>
            )}
          </div>
        )}

        {(searchQuery || selectedTags.length > 0) && (
          <div className="flex items-center gap-2 text-sm text-gray-600">
            <span>
              Showing {recipes.length} result{recipes.length !== 1 ? "s" : ""}
            </span>
            <button
              onClick={() => {
                setSearchQuery("");
                setSelectedTags([]);
              }}
              className="text-orange-600 hover:text-orange-700 font-medium"
            >
              Clear all filters
            </button>
          </div>
        )}
      </div>

      {loading ? (
        <div className="flex items-center justify-center py-20">
          <div className="text-center">
            <div className="w-12 h-12 border-4 border-orange-500/30 border-t-orange-500 rounded-full animate-spin mx-auto" />
            <p className="mt-4 text-gray-600">Loading recipes...</p>
          </div>
        </div>
      ) : recipes.length === 0 ? (
        <motion.div
          initial={{ opacity: 0, scale: 0.95 }}
          animate={{ opacity: 1, scale: 1 }}
          className="bg-white rounded-2xl shadow-lg p-12 text-center"
        >
          <div className="w-20 h-20 bg-gradient-to-br from-orange-100 to-amber-100 rounded-full flex items-center justify-center mx-auto mb-6">
            <ChefHat className="w-10 h-10 text-orange-400" />
          </div>
          {searchQuery || selectedTags.length > 0 ? (
            <>
              <h3 className="text-xl font-semibold text-gray-800 mb-2">No recipes found</h3>
              <p className="text-gray-500 mb-6">Try adjusting your search or filters</p>
              <button
                onClick={() => {
                  setSearchQuery("");
                  setSelectedTags([]);
                }}
                className="bg-gradient-to-r from-orange-500 to-orange-600 text-white px-6 py-3 rounded-xl hover:from-orange-600 hover:to-orange-700 transition-all shadow-md font-medium"
              >
                Clear Filters
              </button>
            </>
          ) : (
            <>
              <h3 className="text-xl font-semibold text-gray-800 mb-2">{emptyStateTitle}</h3>
              <p className="text-gray-500 mb-6">{emptyStateMessage}</p>
              {onAddRecipe && (
                <button
                  onClick={onAddRecipe}
                  className="bg-gradient-to-r from-orange-500 to-orange-600 text-white px-6 py-3 rounded-xl hover:from-orange-600 hover:to-orange-700 transition-all shadow-md font-medium"
                >
                  Add Your First Recipe
                </button>
              )}
            </>
          )}
        </motion.div>
      ) : (
        <>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
            <AnimatePresence>
              {currentRecipes.map((recipe) => (
                <RecipeCard
                  key={recipe.id}
                  recipe={recipe}
                  onEdit={onEditRecipe}
                  onDelete={onDeleteRecipe}
                  onShare={handleShareRecipe}
                  onUnsave={onUnsaveRecipe}
                />
              ))}
            </AnimatePresence>
          </div>

          {/* Pagination Controls */}
          {totalPages > 1 && (
            <div className="flex justify-center items-center gap-2 mt-8">
              <button
                onClick={() => goToPage(currentPage - 1)}
                disabled={currentPage === 1}
                className="px-4 py-2 rounded-xl bg-white shadow-sm hover:shadow-md disabled:opacity-50 disabled:cursor-not-allowed transition-all font-medium text-gray-700"
              >
                Previous
              </button>

              <div className="flex gap-1">
                {[...Array(totalPages)].map((_, index) => {
                  const page = index + 1;
                  if (
                    page === 1 ||
                    page === totalPages ||
                    (page >= currentPage - 1 && page <= currentPage + 1)
                  ) {
                    return (
                      <button
                        key={page}
                        onClick={() => goToPage(page)}
                        className={`w-10 h-10 rounded-xl transition-all font-medium ${
                          currentPage === page
                            ? 'bg-gradient-to-r from-orange-500 to-orange-600 text-white shadow-md'
                            : 'bg-white shadow-sm hover:shadow-md text-gray-700'
                        }`}
                      >
                        {page}
                      </button>
                    );
                  } else if (page === currentPage - 2 || page === currentPage + 2) {
                    return <span key={page} className="px-2 py-2 text-gray-400">...</span>;
                  }
                  return null;
                })}
              </div>

              <button
                onClick={() => goToPage(currentPage + 1)}
                disabled={currentPage === totalPages}
                className="px-4 py-2 rounded-xl bg-white shadow-sm hover:shadow-md disabled:opacity-50 disabled:cursor-not-allowed transition-all font-medium text-gray-700"
              >
                Next
              </button>
            </div>
          )}
        </>
      )}
    </div>
  );
};

// Lightweight metric -> imperial conversion table for the units shown on the
// shopping list. We only convert common cases; anything we don't know about
// passes through unchanged.
const METRIC_TO_IMPERIAL = {
  g: { factor: 0.03527396, unit: "oz" },
  kg: { factor: 2.20462262, unit: "lb" },
  ml: { factor: 0.03381402, unit: "fl oz" },
  l: { factor: 4.22675284, unit: "cups" },
};

const formatShoppingQuantity = (qty, unit) => {
  if (qty == null || qty === 0) return unit || "";
  const units = localStorage.getItem("measurementUnits") || "metric";
  const normalizedUnit = (unit || "").trim().toLowerCase();
  let displayQty = qty;
  let displayUnit = unit || "";
  if (units === "imperial" && METRIC_TO_IMPERIAL[normalizedUnit]) {
    const conv = METRIC_TO_IMPERIAL[normalizedUnit];
    displayQty = qty * conv.factor;
    displayUnit = conv.unit;
  }
  const rounded = Math.round(displayQty * 100) / 100;
  return `${rounded}${displayUnit ? ` ${displayUnit}` : ""}`;
};

const ShoppingListView = ({ backendShoppingList, setBackendShoppingList, isGenerating }) => {
  const items = backendShoppingList?.items || [];
  const totalCount = items.length;
  const checkedCount = items.filter((it) => it.purchased).length;
  const progressPercent = totalCount > 0 ? (checkedCount / totalCount) * 100 : 0;

  const toggleItem = async (itemId) => {
    if (!backendShoppingList) return;
    // Optimistic update.
    setBackendShoppingList({
      ...backendShoppingList,
      items: backendShoppingList.items.map((it) =>
        it.id === itemId ? { ...it, purchased: !it.purchased } : it
      ),
    });
    const result = await api.toggleShoppingItem(itemId);
    if (result.error) {
      // Roll back.
      setBackendShoppingList({
        ...backendShoppingList,
        items: backendShoppingList.items.map((it) =>
          it.id === itemId ? { ...it, purchased: !it.purchased } : it
        ),
      });
    }
  };

  const setAll = async (purchased) => {
    if (!backendShoppingList) return;
    const targets = items.filter((it) => it.purchased !== purchased);
    if (targets.length === 0) return;
    setBackendShoppingList({
      ...backendShoppingList,
      items: items.map((it) => ({ ...it, purchased })),
    });
    await Promise.all(targets.map((it) => api.toggleShoppingItem(it.id)));
  };

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h2 className="text-2xl sm:text-3xl font-bold text-gray-900 flex items-center gap-2">
            Shopping List
            {isGenerating && (
              <span className="w-5 h-5 border-2 border-orange-500/30 border-t-orange-500 rounded-full animate-spin" />
            )}
          </h2>
          <p className="text-gray-500 text-sm mt-1">Auto-generated from your meal plan</p>
        </div>
        {totalCount > 0 && (
          <div className="text-right">
            <div className="text-sm font-medium text-gray-700">
              {checkedCount} of {totalCount} items
            </div>
            <div className="w-32 h-2 bg-gray-200 rounded-full mt-1 overflow-hidden">
              <div
                className="h-full bg-gradient-to-r from-green-400 to-emerald-500 rounded-full transition-all duration-300"
                style={{ width: `${progressPercent}%` }}
              />
            </div>
          </div>
        )}
      </div>

      <div className="bg-white rounded-2xl shadow-lg p-4 sm:p-6">
        {totalCount === 0 ? (
          <div className="text-center py-12">
            <div className="w-20 h-20 bg-gradient-to-br from-orange-100 to-amber-100 rounded-full flex items-center justify-center mx-auto mb-6">
              <ShoppingCart className="w-10 h-10 text-orange-400" />
            </div>
            <h3 className="text-xl font-semibold text-gray-800 mb-2">No items in your list</h3>
            <p className="text-gray-500">Add recipes to your meal planner to generate a shopping list</p>
          </div>
        ) : (
          <>
            <div className="space-y-1">
              {items.map((item) => (
                <div
                  key={item.id}
                  className={`flex items-center gap-3 p-3 rounded-xl transition-all cursor-pointer ${
                    item.purchased ? 'bg-gray-50' : 'hover:bg-orange-50'
                  }`}
                  onClick={() => toggleItem(item.id)}
                >
                  <div className={`w-5 h-5 rounded-full border-2 flex items-center justify-center transition-all flex-shrink-0 ${
                    item.purchased
                      ? 'bg-gradient-to-r from-green-400 to-emerald-500 border-transparent'
                      : 'border-gray-300 hover:border-orange-400'
                  }`}>
                    {item.purchased && (
                      <svg className="w-3 h-3 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={3} d="M5 13l4 4L19 7" />
                      </svg>
                    )}
                  </div>
                  <span
                    className={`flex-1 transition-all ${
                      item.purchased ? "line-through text-gray-400" : "text-gray-800"
                    }`}
                  >
                    {item.total_quantity ? (
                      <span className="text-gray-500 font-normal">
                        {formatShoppingQuantity(item.total_quantity, item.unit)}{' '}
                      </span>
                    ) : null}
                    <span className="font-medium">{item.ingredient?.name}</span>
                  </span>
                </div>
              ))}
            </div>

            {totalCount > 0 && (
              <div className="mt-6 pt-6 border-t border-gray-100">
                <div className="flex flex-col sm:flex-row gap-3">
                  <button
                    onClick={() => setAll(true)}
                    className="flex-1 px-4 py-2.5 bg-white border border-gray-200 rounded-xl hover:bg-gray-50 transition text-gray-700 font-medium shadow-sm"
                  >
                    Check All
                  </button>
                  <button
                    onClick={() => setAll(false)}
                    className="flex-1 px-4 py-2.5 bg-white border border-gray-200 rounded-xl hover:bg-gray-50 transition text-gray-700 font-medium shadow-sm"
                  >
                    Uncheck All
                  </button>
                </div>
              </div>
            )}
          </>
        )}
      </div>
    </div>
  );
};

const SettingsModal = ({ user, recipes = [], onClose, randomizerMode, setRandomizerMode }) => {
  const [name, setName] = useState(user?.name || "");
  const [email, setEmail] = useState(user?.email || "");
  const [currentPassword, setCurrentPassword] = useState("");
  const [newPassword, setNewPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");
  const [tempRandomizerMode, setTempRandomizerMode] = useState(randomizerMode);

  const [defaultDietTags, setDefaultDietTags] = useState(() => {
    try {
      const stored = JSON.parse(localStorage.getItem("defaultDietTags") || "[]");
      return Array.isArray(stored) ? stored : [];
    } catch {
      return [];
    }
  });
  const [measurementUnits, setMeasurementUnits] = useState(
    () => localStorage.getItem("measurementUnits") || "metric"
  );
  const [showDeleteConfirm, setShowDeleteConfirm] = useState(false);
  const [deleteEmail, setDeleteEmail] = useState("");
  const [isDeleting, setIsDeleting] = useState(false);

  const ownedRecipesCount = recipes.filter((r) => r.source !== "library").length;
  const favoritesCount = recipes.filter((r) => r.isSavedFromLibrary === true).length;
  const memberSince = user?.created_at
    ? new Date(user.created_at).toLocaleDateString(undefined, { year: "numeric", month: "long", day: "numeric" })
    : "—";

  const toggleDietTag = (tag) => {
    setDefaultDietTags((prev) =>
      prev.includes(tag) ? prev.filter((t) => t !== tag) : [...prev, tag]
    );
  };

  const handleCancel = () => {
    onClose();
  };

  const handleSaveAndClose = () => {
    setRandomizerMode(tempRandomizerMode);
    localStorage.setItem('randomizerMode', tempRandomizerMode);
    localStorage.setItem('defaultDietTags', JSON.stringify(defaultDietTags));
    localStorage.setItem('measurementUnits', measurementUnits);
    onClose();
  };

  const handleDeleteAccount = async () => {
    if (deleteEmail.trim().toLowerCase() !== (user?.email || "").toLowerCase()) {
      setError("Email doesn't match — type it exactly to confirm.");
      return;
    }
    setIsDeleting(true);
    setError("");
    const result = await api.deleteAccount();
    setIsDeleting(false);
    if (result.error) {
      setError(result.error);
      return;
    }
    localStorage.clear();
    window.location.href = "/auth/login";
  };

  const handleSaveProfile = async () => {
    setError("");
    setSuccess("");

    // Validation
    if (!name.trim() || !email.trim()) {
      setError("Name and email are required");
      return;
    }

    // TODO: Add API call to update user profile
    setSuccess("Profile updated successfully!");
  };

  const handleChangePassword = async () => {
    setError("");
    setSuccess("");

    if (!currentPassword || !newPassword || !confirmPassword) {
      setError("All password fields are required");
      return;
    }

    if (newPassword !== confirmPassword) {
      setError("New passwords don't match");
      return;
    }

    if (newPassword.length < 6) {
      setError("Password must be at least 6 characters");
      return;
    }

    // TODO: Add API call to change password
    setSuccess("Password changed successfully!");
    setCurrentPassword("");
    setNewPassword("");
    setConfirmPassword("");
  };

  const handleRandomizerModeChange = (mode) => {
    setTempRandomizerMode(mode);
  };

  return (
    <motion.div
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0 }}
      className="fixed inset-0 flex items-center justify-center p-2 sm:p-4 z-50 bg-black/50 backdrop-blur-sm"
    >
      <motion.div
        initial={{ opacity: 0, scale: 0.95, y: 20 }}
        animate={{ opacity: 1, scale: 1, y: 0 }}
        exit={{ opacity: 0, scale: 0.95, y: 20 }}
        className="bg-white rounded-2xl shadow-2xl w-full max-w-md sm:max-w-2xl max-h-[90vh] overflow-y-auto"
      >
        <div className="sticky top-0 bg-white border-b border-gray-100 p-4 sm:p-6 flex items-center justify-between rounded-t-2xl">
          <h2 className="text-xl sm:text-2xl font-bold text-gray-900">Settings</h2>
          <button onClick={onClose} className="p-2 text-gray-400 hover:text-gray-600 hover:bg-gray-100 rounded-full transition">
            <X className="w-5 h-5" />
          </button>
        </div>

        <div className="p-4 sm:p-6 space-y-6 sm:space-y-8">
          {error && (
            <div className="p-3 bg-red-100 border border-red-400 text-red-700 rounded-lg">
              {error}
            </div>
          )}
          {success && (
            <div className="p-3 bg-green-100 border border-green-400 text-green-700 rounded-lg">
              {success}
            </div>
          )}

          {/* Profile Section */}
          <div>
            <h3 className="text-lg font-semibold text-gray-900 mb-4">Profile Information</h3>
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Name</label>
                <input
                  type="text"
                  value={name}
                  onChange={(e) => setName(e.target.value)}
                  className="w-full px-4 py-3 bg-gray-50 border-0 rounded-xl focus:ring-2 focus:ring-orange-500 focus:bg-white transition-all"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Email</label>
                <input
                  type="email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  className="w-full px-4 py-3 bg-gray-50 border-0 rounded-xl focus:ring-2 focus:ring-orange-500 focus:bg-white transition-all"
                />
              </div>
              <button
                onClick={handleSaveProfile}
                className="px-6 py-2.5 bg-gradient-to-r from-orange-500 to-orange-600 text-white rounded-xl hover:from-orange-600 hover:to-orange-700 transition-all font-medium shadow-sm"
              >
                Save Profile
              </button>
            </div>
          </div>

          {/* Password Section */}
          <div>
            <h3 className="text-lg font-semibold text-gray-900 mb-4">Change Password</h3>
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Current Password</label>
                <input
                  type="password"
                  value={currentPassword}
                  onChange={(e) => setCurrentPassword(e.target.value)}
                  className="w-full px-4 py-3 bg-gray-50 border-0 rounded-xl focus:ring-2 focus:ring-orange-500 focus:bg-white transition-all"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">New Password</label>
                <input
                  type="password"
                  value={newPassword}
                  onChange={(e) => setNewPassword(e.target.value)}
                  className="w-full px-4 py-3 bg-gray-50 border-0 rounded-xl focus:ring-2 focus:ring-orange-500 focus:bg-white transition-all"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Confirm New Password</label>
                <input
                  type="password"
                  value={confirmPassword}
                  onChange={(e) => setConfirmPassword(e.target.value)}
                  className="w-full px-4 py-3 bg-gray-50 border-0 rounded-xl focus:ring-2 focus:ring-orange-500 focus:bg-white transition-all"
                />
              </div>
              <button
                onClick={handleChangePassword}
                className="px-6 py-2.5 bg-gradient-to-r from-orange-500 to-orange-600 text-white rounded-xl hover:from-orange-600 hover:to-orange-700 transition-all font-medium shadow-sm"
              >
                Change Password
              </button>
            </div>
          </div>

          {/* Dietary Preferences */}
          <div>
            <h3 className="text-lg font-semibold text-gray-900 mb-2">Dietary preferences</h3>
            <p className="text-sm text-gray-500 mb-4">
              These pre-fill the planner's filter every time you open it. Change them anytime in the planner.
            </p>
            <div className="flex flex-wrap gap-2">
              {DIET_TAG_OPTIONS.map((tag) => {
                const active = defaultDietTags.includes(tag);
                return (
                  <button
                    key={tag}
                    type="button"
                    onClick={() => toggleDietTag(tag)}
                    className={`px-3 py-1.5 text-sm rounded-full border transition-colors ${
                      active
                        ? 'bg-emerald-500 text-white border-emerald-500'
                        : 'bg-white text-gray-700 border-gray-200 hover:border-emerald-300'
                    }`}
                  >
                    {tag}
                  </button>
                );
              })}
            </div>
          </div>

          {/* Measurement units */}
          <div>
            <h3 className="text-lg font-semibold text-gray-900 mb-2">Measurement units</h3>
            <p className="text-sm text-gray-500 mb-4">Switch how quantities show in your shopping list.</p>
            <div className="flex gap-3">
              {[
                { value: 'metric', label: 'Metric', sub: 'g, ml, kg' },
                { value: 'imperial', label: 'Imperial', sub: 'oz, cups, lbs' },
              ].map((opt) => {
                const active = measurementUnits === opt.value;
                return (
                  <button
                    key={opt.value}
                    type="button"
                    onClick={() => setMeasurementUnits(opt.value)}
                    className={`flex-1 p-4 rounded-xl text-left transition-all border-2 ${
                      active
                        ? 'bg-orange-50 border-orange-400'
                        : 'bg-white border-gray-200 hover:border-orange-300'
                    }`}
                  >
                    <div className="font-semibold text-gray-900">{opt.label}</div>
                    <div className="text-xs text-gray-500 mt-0.5">{opt.sub}</div>
                  </button>
                );
              })}
            </div>
          </div>

          {/* Meal Planner Settings */}
          <div>
            <h3 className="text-lg font-semibold text-gray-900 mb-2">Meal Planner Randomizer</h3>
            <p className="text-sm text-gray-500 mb-4">Choose how the Randomize button fills your meal plan</p>
            <div className="space-y-3">
              <label className={`flex items-start gap-3 p-4 rounded-xl cursor-pointer transition-all ${
                tempRandomizerMode === 'smart'
                  ? 'bg-orange-50 border-2 border-orange-400'
                  : 'bg-gray-50 border-2 border-transparent hover:bg-gray-100'
              }`}>
                <input
                  type="radio"
                  name="randomizer"
                  checked={tempRandomizerMode === 'smart'}
                  onChange={() => handleRandomizerModeChange('smart')}
                  className="mt-1 text-orange-500 focus:ring-orange-500"
                />
                <div>
                  <div className="font-semibold text-gray-900">Smart Match (Default)</div>
                  <div className="text-sm text-gray-500">Matches recipes by tags: Breakfast → Lunch → Dinner → Dessert/Snack</div>
                </div>
              </label>
              <label className={`flex items-start gap-3 p-4 rounded-xl cursor-pointer transition-all ${
                tempRandomizerMode === 'full-random'
                  ? 'bg-orange-50 border-2 border-orange-400'
                  : 'bg-gray-50 border-2 border-transparent hover:bg-gray-100'
              }`}>
                <input
                  type="radio"
                  name="randomizer"
                  checked={tempRandomizerMode === 'full-random'}
                  onChange={() => handleRandomizerModeChange('full-random')}
                  className="mt-1 text-orange-500 focus:ring-orange-500"
                />
                <div>
                  <div className="font-semibold text-gray-900">Full Random</div>
                  <div className="text-sm text-gray-500">Randomly selects any recipe for any meal slot</div>
                </div>
              </label>
            </div>
          </div>

          {/* Account stats */}
          <div>
            <h3 className="text-lg font-semibold text-gray-900 mb-4">Account</h3>
            <div className="grid grid-cols-3 gap-3">
              <div className="bg-gray-50 rounded-xl p-3 text-center">
                <div className="text-xs uppercase tracking-wide text-gray-500 mb-1">Recipes</div>
                <div className="text-2xl font-bold text-gray-900">{ownedRecipesCount}</div>
              </div>
              <div className="bg-gray-50 rounded-xl p-3 text-center">
                <div className="text-xs uppercase tracking-wide text-gray-500 mb-1">Favorites</div>
                <div className="text-2xl font-bold text-gray-900">{favoritesCount}</div>
              </div>
              <div className="bg-gray-50 rounded-xl p-3 text-center">
                <div className="text-xs uppercase tracking-wide text-gray-500 mb-1">Member since</div>
                <div className="text-sm font-semibold text-gray-900 mt-1.5">{memberSince}</div>
              </div>
            </div>
          </div>

          {/* Danger zone */}
          <div className="border-2 border-red-200 rounded-xl p-4 sm:p-5 bg-red-50/30">
            <h3 className="text-lg font-semibold text-red-700 mb-2">Danger zone</h3>
            <p className="text-sm text-gray-600 mb-4">
              Deleting your account permanently removes your recipes, meal plan, favorites,
              and shopping list. This can't be undone.
            </p>
            {!showDeleteConfirm ? (
              <button
                type="button"
                onClick={() => setShowDeleteConfirm(true)}
                className="px-4 py-2 bg-white border border-red-300 text-red-600 rounded-xl hover:bg-red-100 transition font-medium"
              >
                Delete account
              </button>
            ) : (
              <div className="space-y-3">
                <p className="text-sm text-gray-700">
                  Type your email <span className="font-mono font-semibold">{user?.email}</span> to confirm.
                </p>
                <input
                  type="email"
                  value={deleteEmail}
                  onChange={(e) => setDeleteEmail(e.target.value)}
                  placeholder="Type your email"
                  className="w-full px-4 py-2.5 bg-white border border-red-200 rounded-xl focus:ring-2 focus:ring-red-500 focus:border-red-500"
                />
                <div className="flex flex-col sm:flex-row gap-2">
                  <button
                    type="button"
                    onClick={() => {
                      setShowDeleteConfirm(false);
                      setDeleteEmail("");
                      setError("");
                    }}
                    className="flex-1 px-4 py-2.5 bg-gray-100 text-gray-700 rounded-xl hover:bg-gray-200 transition font-medium"
                  >
                    Cancel
                  </button>
                  <button
                    type="button"
                    onClick={handleDeleteAccount}
                    disabled={isDeleting}
                    className="flex-1 px-4 py-2.5 bg-red-600 text-white rounded-xl hover:bg-red-700 disabled:opacity-60 transition font-semibold"
                  >
                    {isDeleting ? "Deleting..." : "Delete forever"}
                  </button>
                </div>
              </div>
            )}
          </div>

          {/* Action Buttons */}
          <div className="flex flex-col sm:flex-row gap-3 justify-end pt-4 border-t border-gray-100">
            <button
              onClick={handleCancel}
              className="px-6 py-3 bg-gray-100 text-gray-700 rounded-xl hover:bg-gray-200 transition font-medium"
            >
              Cancel
            </button>
            <button
              onClick={handleSaveAndClose}
              className="px-6 py-3 bg-gradient-to-r from-orange-500 to-orange-600 text-white rounded-xl hover:from-orange-600 hover:to-orange-700 transition-all font-semibold shadow-md"
            >
              Save & Close
            </button>
          </div>
        </div>
      </motion.div>
    </motion.div>
  );
};

// Updated to match wireframe design
// Set opacity to 50%
// Updated input and button styling
// Improved spacing and form layout
const CATEGORY_OPTIONS = ["meal", "dessert", "snack", "drink"];
const DIFFICULTY_OPTIONS = ["easy", "medium", "hard"];

const RecipeFormModal = ({ recipe, onClose, onSave }) => {
  const [title, setTitle] = useState(recipe?.title || "");
  const [description, setDescription] = useState(recipe?.description || "");
  const [image, setImage] = useState(recipe?.image_url || "");
  const [tags, setTags] = useState(
    recipe?.tags?.map(t => typeof t === 'string' ? t : t.name).join(", ") || ""
  );
  const [cuisine, setCuisine] = useState(recipe?.cuisine || "");
  const [category, setCategory] = useState(recipe?.category || "meal");
  const [difficulty, setDifficulty] = useState(recipe?.difficulty || "");
  const [prepTime, setPrepTime] = useState(recipe?.prep_time_minutes ?? "");
  const [cookTime, setCookTime] = useState(recipe?.cook_time_minutes ?? "");
  const [servings, setServings] = useState(recipe?.servings ?? 4);
  const [calories, setCalories] = useState(recipe?.calories ?? "");
  const [protein, setProtein] = useState(recipe?.protein_g ?? "");
  const [carbs, setCarbs] = useState(recipe?.carbs_g ?? "");
  const [fat, setFat] = useState(recipe?.fat_g ?? "");
  const [fiber, setFiber] = useState(recipe?.fiber_g ?? "");
  const [sugar, setSugar] = useState(recipe?.sugar_g ?? "");
  const [sodium, setSodium] = useState(recipe?.sodium_mg ?? "");
  const [cholesterol, setCholesterol] = useState(recipe?.cholesterol_mg ?? "");
  const [showNutrition, setShowNutrition] = useState(false);
  const [ingredients, setIngredients] = useState(
    recipe?.recipe_ingredients?.map(ri => ri.ingredient?.name || ri.ingredient_name).join("\n") || ""
  );
  const [instructions, setInstructions] = useState(recipe?.instructions || "");
  const [error, setError] = useState("");
  const [cuisineSuggestions, setCuisineSuggestions] = useState([]);

  useEffect(() => {
    fetch(`${API_BASE_URL}/library/cuisines`)
      .then((r) => (r.ok ? r.json() : { cuisines: [] }))
      .then((data) => setCuisineSuggestions(data.cuisines || []))
      .catch(() => {});
  }, []);

  const handleImageUpload = (e) => {
    const file = e.target.files[0];
    if (file) {
      // Compress and convert image to base64
      const reader = new FileReader();
      reader.onloadend = () => {
        const img = new Image();
        img.onload = () => {
          // Create canvas for compression
          const canvas = document.createElement('canvas');
          const ctx = canvas.getContext('2d');

          // Calculate new dimensions (max 800x600)
          let width = img.width;
          let height = img.height;
          const maxWidth = 800;
          const maxHeight = 600;

          if (width > maxWidth || height > maxHeight) {
            const ratio = Math.min(maxWidth / width, maxHeight / height);
            width = width * ratio;
            height = height * ratio;
          }

          canvas.width = width;
          canvas.height = height;

          // Draw and compress (quality 0.8)
          ctx.drawImage(img, 0, 0, width, height);
          const compressedDataUrl = canvas.toDataURL('image/jpeg', 0.8);

          setImage(compressedDataUrl);
        };
        img.src = reader.result;
      };
      reader.readAsDataURL(file);
    }
  };

  const capitalizeTag = (tag) => {
    // Standardize common tags
    const standardTags = {
      'breakfast': 'Breakfast',
      'lunch': 'Lunch',
      'dinner': 'Dinner',
      'dessert': 'Dessert',
      'snack': 'Snack',
      'quick': 'Quick',
      'healthy': 'Healthy',
      'vegetarian': 'Vegetarian',
      'vegan': 'Vegan',
      'italian': 'Italian',
      'mexican': 'Mexican',
      'asian': 'Asian',
      'indian': 'Indian',
      'chinese': 'Chinese',
      'japanese': 'Japanese',
      'mediterranean': 'Mediterranean',
      'american': 'American',
      'comfort food': 'Comfort Food',
      'seafood': 'Seafood',
      'sweet': 'Sweet',
      'savory': 'Savory',
      'spicy': 'Spicy',
      'baking': 'Baking',
      'salad': 'Salad',
    };

    const lowerTag = tag.toLowerCase();

    // Return standardized version if exists
    if (standardTags[lowerTag]) {
      return standardTags[lowerTag];
    }

    // Otherwise, capitalize first letter of each word
    return tag
      .split(' ')
      .map(word => word.charAt(0).toUpperCase() + word.slice(1).toLowerCase())
      .join(' ');
  };

  const handleSave = () => {
    setError("");

    if (!title.trim()) return setError("Recipe title is required");
    if (!ingredients.trim()) return setError("Ingredients are required");
    if (!instructions.trim()) return setError("Instructions are required");

    const toIntOrNull = (v) => {
      if (v === "" || v == null) return null;
      const n = parseInt(v, 10);
      return Number.isFinite(n) ? n : null;
    };
    const toFloatOrNull = (v) => {
      if (v === "" || v == null) return null;
      const n = parseFloat(v);
      return Number.isFinite(n) ? n : null;
    };

    onSave({
      title: title.trim(),
      image_url: image.trim(),
      description: description.trim() || null,
      cuisine: cuisine.trim() || null,
      category: category || null,
      difficulty: difficulty || null,
      prep_time_minutes: toIntOrNull(prepTime),
      cook_time_minutes: toIntOrNull(cookTime),
      servings: toIntOrNull(servings) ?? 4,
      calories: toIntOrNull(calories),
      protein_g: toFloatOrNull(protein),
      carbs_g: toFloatOrNull(carbs),
      fat_g: toFloatOrNull(fat),
      fiber_g: toFloatOrNull(fiber),
      sugar_g: toFloatOrNull(sugar),
      sodium_mg: toFloatOrNull(sodium),
      cholesterol_mg: toFloatOrNull(cholesterol),
      tags: tags
        .split(",")
        .map((t) => capitalizeTag(t.trim()))
        .filter(Boolean),
      ingredients: ingredients
        .split("\n")
        .map((i) => i.trim())
        .filter(Boolean)
        .map((ingredientText) => ({
          ingredient_name: ingredientText,
          quantity: null,
          unit: null,
          note: null,
        })),
      tag_ids: [],
      instructions: instructions.trim(),
    });
  };

  return (
    <motion.div
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0 }}
      className="fixed inset-0 flex items-center justify-center p-2 sm:p-4 z-50 bg-black/50 backdrop-blur-sm"
    >
      <motion.div
        initial={{ opacity: 0, scale: 0.95, y: 20 }}
        animate={{ opacity: 1, scale: 1, y: 0 }}
        exit={{ opacity: 0, scale: 0.95, y: 20 }}
        className="bg-white rounded-2xl shadow-2xl w-full max-w-md sm:max-w-3xl max-h-[90vh] overflow-y-auto"
      >
        <div className="p-4 sm:p-8">
          <div className="flex items-center justify-between mb-6">
            <h2 className="text-xl sm:text-2xl font-bold text-gray-900">
              {recipe ? "Edit Recipe" : "Add New Recipe"}
            </h2>
            <button onClick={onClose} className="p-2 text-gray-400 hover:text-gray-600 hover:bg-gray-100 rounded-full transition">
              <X className="w-5 h-5" />
            </button>
          </div>

          {error && (
            <div className="mb-4 p-3 bg-red-100 border border-red-400 text-red-700 rounded-lg">
              {error}
            </div>
          )}

          <div className="space-y-6">
            {/* Basics */}
            <section className="bg-gray-50/60 rounded-xl p-4 sm:p-5">
              <h3 className="text-sm font-semibold text-gray-500 uppercase tracking-wide mb-3">Basics</h3>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div className="md:col-span-2">
                  <label className="block text-sm font-medium text-gray-700 mb-1.5">Recipe Title *</label>
                  <input
                    type="text"
                    value={title}
                    onChange={(e) => setTitle(e.target.value)}
                    placeholder="e.g., Spaghetti Carbonara"
                    className="w-full px-4 py-2.5 bg-white border border-gray-200 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-orange-500 transition-all"
                  />
                </div>
                <div className="md:col-span-2">
                  <label className="block text-sm font-medium text-gray-700 mb-1.5">Description</label>
                  <input
                    type="text"
                    value={description}
                    onChange={(e) => setDescription(e.target.value)}
                    placeholder="Short summary that shows on the card"
                    className="w-full px-4 py-2.5 bg-white border border-gray-200 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-orange-500 transition-all"
                  />
                </div>
                <div className="md:col-span-2">
                  <label className="block text-sm font-medium text-gray-700 mb-1.5">Image</label>
                  {image && (
                    <div className="mb-3">
                      <img src={image} alt="Preview" className="w-full h-40 object-cover rounded-xl shadow-sm" />
                    </div>
                  )}
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                    <input
                      type="file"
                      accept="image/*"
                      onChange={handleImageUpload}
                      className="w-full px-3 py-2 bg-white border border-gray-200 rounded-xl text-sm file:mr-3 file:py-1.5 file:px-3 file:rounded-lg file:border-0 file:text-sm file:font-semibold file:bg-orange-100 file:text-orange-700 hover:file:bg-orange-200 cursor-pointer"
                    />
                    <input
                      type="url"
                      value={image}
                      onChange={(e) => setImage(e.target.value)}
                      placeholder="or paste image URL"
                      className="w-full px-3 py-2 bg-white border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-orange-500 focus:border-orange-500 transition-all"
                    />
                  </div>
                </div>
              </div>
            </section>

            {/* Classification */}
            <section className="bg-gray-50/60 rounded-xl p-4 sm:p-5">
              <h3 className="text-sm font-semibold text-gray-500 uppercase tracking-wide mb-3">Classification</h3>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1.5">Cuisine</label>
                  <input
                    list="cuisine-suggestions"
                    type="text"
                    value={cuisine}
                    onChange={(e) => setCuisine(e.target.value)}
                    placeholder="e.g., Italian"
                    className="w-full px-4 py-2.5 bg-white border border-gray-200 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-orange-500 transition-all"
                  />
                  <datalist id="cuisine-suggestions">
                    {cuisineSuggestions.map((c) => (
                      <option key={c} value={c} />
                    ))}
                  </datalist>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1.5">Category</label>
                  <select
                    value={category}
                    onChange={(e) => setCategory(e.target.value)}
                    className="w-full px-4 py-2.5 bg-white border border-gray-200 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-orange-500 transition-all"
                  >
                    {CATEGORY_OPTIONS.map((c) => (
                      <option key={c} value={c}>{c.charAt(0).toUpperCase() + c.slice(1)}</option>
                    ))}
                  </select>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1.5">Difficulty</label>
                  <div className="flex gap-2">
                    {DIFFICULTY_OPTIONS.map((d) => {
                      const active = difficulty === d;
                      return (
                        <button
                          key={d}
                          type="button"
                          onClick={() => setDifficulty(active ? "" : d)}
                          className={`flex-1 px-3 py-2.5 rounded-xl text-sm font-medium capitalize transition-colors border ${
                            active
                              ? 'bg-orange-500 text-white border-orange-500'
                              : 'bg-white text-gray-700 border-gray-200 hover:border-orange-300'
                          }`}
                        >
                          {d}
                        </button>
                      );
                    })}
                  </div>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1.5">Tags</label>
                  <input
                    type="text"
                    value={tags}
                    onChange={(e) => setTags(e.target.value)}
                    placeholder="comma-separated: Italian, Dinner, Quick"
                    className="w-full px-4 py-2.5 bg-white border border-gray-200 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-orange-500 transition-all"
                  />
                </div>
              </div>
            </section>

            {/* Time & Servings */}
            <section className="bg-gray-50/60 rounded-xl p-4 sm:p-5">
              <h3 className="text-sm font-semibold text-gray-500 uppercase tracking-wide mb-3">Time & Servings</h3>
              <div className="grid grid-cols-3 gap-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1.5">Prep (min)</label>
                  <input
                    type="number" min="0"
                    value={prepTime}
                    onChange={(e) => setPrepTime(e.target.value)}
                    className="w-full px-4 py-2.5 bg-white border border-gray-200 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-orange-500 transition-all"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1.5">Cook (min)</label>
                  <input
                    type="number" min="0"
                    value={cookTime}
                    onChange={(e) => setCookTime(e.target.value)}
                    className="w-full px-4 py-2.5 bg-white border border-gray-200 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-orange-500 transition-all"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1.5">Servings</label>
                  <input
                    type="number" min="1"
                    value={servings}
                    onChange={(e) => setServings(e.target.value)}
                    className="w-full px-4 py-2.5 bg-white border border-gray-200 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-orange-500 transition-all"
                  />
                </div>
              </div>
            </section>

            {/* Nutrition (collapsible) */}
            <section className="bg-gray-50/60 rounded-xl">
              <button
                type="button"
                onClick={() => setShowNutrition((v) => !v)}
                className="w-full flex items-center justify-between p-4 sm:p-5 text-left"
              >
                <h3 className="text-sm font-semibold text-gray-500 uppercase tracking-wide">Nutrition per serving</h3>
                <ChevronDown className={`w-5 h-5 text-gray-400 transition-transform ${showNutrition ? 'rotate-180' : ''}`} />
              </button>
              {showNutrition && (
                <div className="px-4 pb-5 sm:px-5 grid grid-cols-2 md:grid-cols-4 gap-4">
                  {[
                    ["Calories (kcal)", calories, setCalories],
                    ["Protein (g)", protein, setProtein],
                    ["Carbs (g)", carbs, setCarbs],
                    ["Fat (g)", fat, setFat],
                    ["Fiber (g)", fiber, setFiber],
                    ["Sugar (g)", sugar, setSugar],
                    ["Sodium (mg)", sodium, setSodium],
                    ["Cholesterol (mg)", cholesterol, setCholesterol],
                  ].map(([label, val, setter]) => (
                    <div key={label}>
                      <label className="block text-xs font-medium text-gray-600 mb-1">{label}</label>
                      <input
                        type="number" min="0" step="0.1"
                        value={val}
                        onChange={(e) => setter(e.target.value)}
                        className="w-full px-3 py-2 bg-white border border-gray-200 rounded-lg text-sm focus:ring-2 focus:ring-orange-500 focus:border-orange-500 transition-all"
                      />
                    </div>
                  ))}
                </div>
              )}
            </section>

            {/* Ingredients & Instructions */}
            <section className="bg-gray-50/60 rounded-xl p-4 sm:p-5">
              <h3 className="text-sm font-semibold text-gray-500 uppercase tracking-wide mb-3">Ingredients & Instructions</h3>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1.5">Ingredients (one per line) *</label>
                  <textarea
                    value={ingredients}
                    onChange={(e) => setIngredients(e.target.value)}
                    rows={8}
                    placeholder="200g pasta&#10;2 eggs&#10;100g pancetta"
                    className="w-full px-4 py-3 bg-white border border-gray-200 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-orange-500 transition-all resize-none"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1.5">Instructions *</label>
                  <textarea
                    value={instructions}
                    onChange={(e) => setInstructions(e.target.value)}
                    rows={8}
                    placeholder="Step-by-step cooking instructions..."
                    className="w-full px-4 py-3 bg-white border border-gray-200 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-orange-500 transition-all resize-none"
                  />
                </div>
              </div>
            </section>

            <div className="flex gap-4 pt-2">
              <button
                onClick={onClose}
                className="flex-1 px-6 py-3 bg-gray-100 text-gray-700 rounded-xl hover:bg-gray-200 transition font-medium"
              >
                Cancel
              </button>
              <button
                onClick={handleSave}
                className="flex-1 bg-gradient-to-r from-orange-500 to-orange-600 text-white px-6 py-3 rounded-xl hover:from-orange-600 hover:to-orange-700 transition-all font-semibold shadow-md"
              >
                {recipe ? "Update Recipe" : "Create Recipe"}
              </button>
            </div>
          </div>
        </div>
      </motion.div>
    </motion.div>
  );
};

const SLOT_CAP = 5;

const DIET_TAG_OPTIONS = ["Vegan", "Vegetarian", "Healthy", "Keto", "Gluten-Free"];
const DEFAULT_DAILY_TARGET = 2000;

const MealPlannerView = ({ recipes, mealPlan, setMealPlan, onSavePlan, randomizerMode }) => {
  const days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
  const meals = ["Breakfast", "Lunch", "Dinner", "Dessert/Snacking"];

  const [showFilters, setShowFilters] = useState(false);
  // Pending = bound to inputs. Applied = used by cells + randomize.
  // The split lets the user adjust filters, see a live count preview,
  // then commit them all at once via Apply.
  const EMPTY_FILTERS = {
    selectedDietTags: [],
    minCalories: "",
    maxCalories: "",
    minProtein: "",
    maxCarbs: "",
    maxTotalTime: "",
  };
  const initialFilters = (() => {
    try {
      const stored = JSON.parse(localStorage.getItem("defaultDietTags") || "[]");
      if (Array.isArray(stored) && stored.length > 0) {
        return { ...EMPTY_FILTERS, selectedDietTags: stored };
      }
    } catch {
      /* fall through */
    }
    return EMPTY_FILTERS;
  })();
  const [pendingFilters, setPendingFilters] = useState(initialFilters);
  const [appliedFilters, setAppliedFilters] = useState(initialFilters);

  const setPendingField = (key, value) =>
    setPendingFilters((prev) => ({ ...prev, [key]: value }));

  const togglePendingDietTag = (tag) =>
    setPendingFilters((prev) => ({
      ...prev,
      selectedDietTags: prev.selectedDietTags.includes(tag)
        ? prev.selectedDietTags.filter((t) => t !== tag)
        : [...prev.selectedDietTags, tag],
    }));

  const filtersDiffer = useMemo(() => {
    return JSON.stringify(pendingFilters) !== JSON.stringify(appliedFilters);
  }, [pendingFilters, appliedFilters]);

  const applyFilters = () => setAppliedFilters(pendingFilters);
  const resetFilters = () => {
    setPendingFilters(EMPTY_FILTERS);
    setAppliedFilters(EMPTY_FILTERS);
  };

  const [dailyTarget, setDailyTarget] = useState(() => {
    const stored = parseInt(localStorage.getItem("dailyCalorieTarget"), 10);
    return Number.isFinite(stored) && stored > 0 ? stored : DEFAULT_DAILY_TARGET;
  });

  useEffect(() => {
    localStorage.setItem("dailyCalorieTarget", String(dailyTarget));
  }, [dailyTarget]);

  const recipeTagNames = (recipe) =>
    (recipe.tags || []).map((t) =>
      typeof t === "string" ? t.toLowerCase() : (t.name || "").toLowerCase()
    );

  const applyFilterToRecipes = (filters) => {
    const minCal = filters.minCalories === "" ? null : Number(filters.minCalories);
    const maxCal = filters.maxCalories === "" ? null : Number(filters.maxCalories);
    const minPro = filters.minProtein === "" ? null : Number(filters.minProtein);
    const maxCar = filters.maxCarbs === "" ? null : Number(filters.maxCarbs);
    const maxTime = filters.maxTotalTime === "" ? null : Number(filters.maxTotalTime);
    const wantedTags = filters.selectedDietTags.map((t) => t.toLowerCase());

    return recipes.filter((r) => {
      if (wantedTags.length > 0) {
        const names = recipeTagNames(r);
        if (!wantedTags.some((t) => names.includes(t))) return false;
      }
      if (minCal != null && r.calories != null && r.calories < minCal) return false;
      if (maxCal != null && r.calories != null && r.calories > maxCal) return false;
      if (minPro != null && r.protein_g != null && r.protein_g < minPro) return false;
      if (maxCar != null && r.carbs_g != null && r.carbs_g > maxCar) return false;
      if (maxTime != null) {
        const total = (r.prep_time_minutes || 0) + (r.cook_time_minutes || 0);
        if (total > maxTime) return false;
      }
      return true;
    });
  };

  // Live preview: count and panel display.
  const pendingFilteredRecipes = useMemo(
    () => applyFilterToRecipes(pendingFilters),
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [recipes, pendingFilters]
  );
  // Stable: drives cell dropdowns + randomize.
  const filteredRecipes = useMemo(
    () => applyFilterToRecipes(appliedFilters),
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [recipes, appliedFilters]
  );

  const recipesById = useMemo(() => {
    const map = new Map();
    for (const r of recipes) map.set(r.id, r);
    return map;
  }, [recipes]);

  const dayTotalCalories = (day) => {
    const dayPlan = mealPlan[day] || {};
    let total = 0;
    for (const meal of meals) {
      const raw = dayPlan[meal];
      const ids = Array.isArray(raw) ? raw : raw != null ? [raw] : [];
      for (const id of ids) {
        const recipe = recipesById.get(id);
        if (recipe?.calories != null) total += recipe.calories;
      }
    }
    return total;
  };

  const budgetColorClass = (total, target) => {
    if (total === 0) return "text-gray-400";
    if (total <= target) return "text-emerald-600";
    if (total <= target * 1.1) return "text-amber-600";
    return "text-red-600";
  };

  const activeAppliedFilterCount =
    appliedFilters.selectedDietTags.length +
    [
      appliedFilters.minCalories,
      appliedFilters.maxCalories,
      appliedFilters.minProtein,
      appliedFilters.maxCarbs,
      appliedFilters.maxTotalTime,
    ].filter((v) => v !== "").length;

  // Slots are arrays of recipe IDs. Normalize legacy single-int values to a 1-element array.
  const slotIds = (day, meal) => {
    const raw = mealPlan[day]?.[meal];
    if (raw == null) return [];
    return Array.isArray(raw) ? raw : [raw];
  };

  const setSlot = (plan, day, meal, ids) => {
    const next = { ...plan, [day]: { ...(plan[day] || {}) } };
    if (ids.length === 0) {
      delete next[day][meal];
      if (Object.keys(next[day]).length === 0) delete next[day];
    } else {
      next[day][meal] = ids;
    }
    return next;
  };

  const addRecipeToMeal = (day, meal, recipeId) => {
    const current = slotIds(day, meal);
    if (current.length >= SLOT_CAP) return;
    const newPlan = setSlot(mealPlan, day, meal, [...current, recipeId]);
    setMealPlan(newPlan);
    onSavePlan(newPlan);
  };

  const removeRecipeAt = (day, meal, index) => {
    const current = slotIds(day, meal);
    const newPlan = setSlot(mealPlan, day, meal, current.filter((_, i) => i !== index));
    setMealPlan(newPlan);
    onSavePlan(newPlan);
  };

  // Drag-and-drop state
  const [dragOverCell, setDragOverCell] = useState(null); // { day, meal } | null
  const [dndToast, setDndToast] = useState("");

  useEffect(() => {
    if (!dndToast) return;
    const t = setTimeout(() => setDndToast(""), 2000);
    return () => clearTimeout(t);
  }, [dndToast]);

  const moveDish = (srcDay, srcMeal, srcIndex, tgtDay, tgtMeal) => {
    if (srcDay === tgtDay && srcMeal === tgtMeal) return; // same slot, no-op
    const srcIds = slotIds(srcDay, srcMeal);
    const tgtIds = slotIds(tgtDay, tgtMeal);
    if (tgtIds.length >= SLOT_CAP) {
      setDndToast(`${tgtDay} ${tgtMeal} is full (${SLOT_CAP}/${SLOT_CAP})`);
      return;
    }
    const moved = srcIds[srcIndex];
    if (moved == null) return;
    let plan = setSlot(mealPlan, srcDay, srcMeal, srcIds.filter((_, i) => i !== srcIndex));
    plan = setSlot(plan, tgtDay, tgtMeal, [...tgtIds, moved]);
    setMealPlan(plan);
    onSavePlan(plan);
  };

  const clearAllMeals = () => {
    if (window.confirm("Are you sure you want to clear all meals from this week's plan?")) {
      setMealPlan({});
      onSavePlan({});
    }
  };

  const randomizeMealPlan = () => {
    // Preserve any slot that already has at least one recipe; only fill empty slots.
    let newPlan = mealPlan;

    const pool = filteredRecipes;
    // Track which recipe IDs are already used so we don't repeat across the week.
    // Seed with existing entries so manually-placed dishes count too.
    const used = new Set();
    days.forEach((day) => {
      meals.forEach((meal) => {
        const raw = newPlan[day]?.[meal];
        const ids = Array.isArray(raw) ? raw : raw != null ? [raw] : [];
        ids.forEach((id) => used.add(id));
      });
    });

    const pickUnused = (candidates) => {
      const remaining = candidates.filter((r) => !used.has(r.id));
      const source = remaining.length > 0 ? remaining : candidates;
      if (source.length === 0) return null;
      return source[Math.floor(Math.random() * source.length)].id;
    };

    const matchingForMeal = (mealType) => {
      if (randomizerMode === 'full-random') return pool;
      const tagMapping = {
        'Breakfast': ['breakfast'],
        'Lunch': ['lunch'],
        'Dinner': ['dinner'],
        'Dessert/Snacking': ['dessert', 'sweet', 'snack'],
      };
      const keywords = tagMapping[mealType] || [];
      const matching = pool.filter((r) => {
        if (!r.tags || r.tags.length === 0) return false;
        return r.tags.some((tag) => {
          const tagName = typeof tag === 'string' ? tag.toLowerCase() : tag.name.toLowerCase();
          return keywords.some((kw) => tagName.includes(kw));
        });
      });
      return matching.length > 0 ? matching : pool;
    };

    let filledUnique = 0;
    let filledTotal = 0;

    days.forEach((day) => {
      meals.forEach((meal) => {
        const raw = newPlan[day]?.[meal];
        const existing = Array.isArray(raw) ? raw : raw != null ? [raw] : [];
        if (existing.length > 0) return;
        const candidates = matchingForMeal(meal);
        const remainingUnused = candidates.filter((r) => !used.has(r.id));
        const id = pickUnused(candidates);
        if (id == null) return;
        if (remainingUnused.length > 0) filledUnique += 1;
        filledTotal += 1;
        used.add(id);
        newPlan = setSlot(newPlan, day, meal, [id]);
      });
    });

    setMealPlan(newPlan);
    onSavePlan(newPlan);

    if (filledTotal > filledUnique && filledTotal > 0) {
      setDndToast(`Filled ${filledTotal} slots — only ${filledUnique} unique recipes available, some repeats`);
    }
  };

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h2 className="text-2xl sm:text-3xl font-bold text-gray-900">Weekly Meal Planner</h2>
          <p className="text-gray-500 text-sm mt-1">Plan your meals for the week</p>
        </div>
        <div className="flex gap-2 sm:gap-3">
          <button
            onClick={randomizeMealPlan}
            className="relative flex items-center gap-2 bg-gradient-to-r from-emerald-500 to-teal-500 text-white px-4 sm:px-6 py-2.5 sm:py-3 rounded-xl hover:from-emerald-600 hover:to-teal-600 transition-all shadow-md hover:shadow-lg font-medium group"
          >
            <span className="text-sm sm:text-base">Randomize</span>
            <div className="absolute bottom-full left-1/2 transform -translate-x-1/2 mb-2 px-3 py-2 bg-gray-900 text-white text-sm rounded-lg opacity-0 group-hover:opacity-100 transition-opacity pointer-events-none whitespace-nowrap z-50">
              {randomizerMode === 'full-random'
                ? 'Randomly fills all slots with any recipe'
                : 'Matches recipes by tags: Breakfast → Lunch → Dinner → Dessert/Snack'}
            </div>
          </button>
          <button
            onClick={clearAllMeals}
            className="flex items-center gap-2 bg-white text-red-600 border border-red-200 px-4 sm:px-6 py-2.5 sm:py-3 rounded-xl hover:bg-red-50 transition-all shadow-sm font-medium"
          >
            <Trash2 className="w-4 h-4" />
            <span className="hidden sm:inline text-sm sm:text-base">Clear</span>
          </button>
        </div>
      </div>

      {/* Filters + daily calorie budget */}
      <div className="bg-white rounded-2xl shadow-sm border border-gray-100 mb-4 sm:mb-6">
        <div className="flex flex-wrap items-center justify-between gap-3 p-3 sm:p-4">
          <button
            type="button"
            onClick={() => setShowFilters((v) => !v)}
            className="flex items-center gap-2 text-sm font-medium text-gray-700 hover:text-orange-600 transition-colors"
          >
            <SlidersHorizontal className="w-4 h-4" />
            <span>Filters</span>
            {activeAppliedFilterCount > 0 && (
              <span className="ml-1 inline-flex items-center justify-center w-5 h-5 text-xs font-semibold text-white bg-orange-500 rounded-full">
                {activeAppliedFilterCount}
              </span>
            )}
            {filtersDiffer && (
              <span className="ml-1 w-2 h-2 rounded-full bg-amber-500" title="Unsaved filter changes" />
            )}
          </button>
          <label className="flex items-center gap-2 text-sm text-gray-700">
            <Flame className="w-4 h-4 text-orange-500" />
            <span className="font-medium">Daily target</span>
            <input
              type="number"
              min="0"
              step="50"
              value={dailyTarget}
              onChange={(e) => {
                const v = parseInt(e.target.value, 10);
                if (Number.isFinite(v) && v >= 0) setDailyTarget(v);
              }}
              className="w-24 px-2 py-1 text-sm border border-gray-200 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-orange-500"
            />
            <span className="text-gray-500">kcal</span>
          </label>
        </div>

        {showFilters && (
          <div className="border-t border-gray-100 p-3 sm:p-4 space-y-4">
            <div>
              <p className="text-xs font-semibold text-gray-500 uppercase tracking-wide mb-2">Diet</p>
              <div className="flex flex-wrap gap-2">
                {DIET_TAG_OPTIONS.map((tag) => {
                  const active = pendingFilters.selectedDietTags.includes(tag);
                  return (
                    <button
                      key={tag}
                      type="button"
                      onClick={() => togglePendingDietTag(tag)}
                      className={`px-3 py-1.5 text-sm rounded-full border transition-colors ${
                        active
                          ? 'bg-emerald-500 text-white border-emerald-500'
                          : 'bg-white text-gray-700 border-gray-200 hover:border-emerald-300'
                      }`}
                    >
                      {tag}
                    </button>
                  );
                })}
              </div>
            </div>
            <div className="grid grid-cols-2 sm:grid-cols-5 gap-3">
              <div>
                <label className="block text-xs font-semibold text-gray-500 uppercase tracking-wide mb-1">Min kcal</label>
                <input
                  type="number" min="0" step="50"
                  value={pendingFilters.minCalories}
                  onChange={(e) => setPendingField("minCalories", e.target.value)}
                  className="w-full px-2 py-1.5 text-sm border border-gray-200 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-orange-500"
                />
              </div>
              <div>
                <label className="block text-xs font-semibold text-gray-500 uppercase tracking-wide mb-1">Max kcal</label>
                <input
                  type="number" min="0" step="50"
                  value={pendingFilters.maxCalories}
                  onChange={(e) => setPendingField("maxCalories", e.target.value)}
                  className="w-full px-2 py-1.5 text-sm border border-gray-200 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-orange-500"
                />
              </div>
              <div>
                <label className="block text-xs font-semibold text-gray-500 uppercase tracking-wide mb-1">Min protein (g)</label>
                <input
                  type="number" min="0" step="5"
                  value={pendingFilters.minProtein}
                  onChange={(e) => setPendingField("minProtein", e.target.value)}
                  className="w-full px-2 py-1.5 text-sm border border-gray-200 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-orange-500"
                />
              </div>
              <div>
                <label className="block text-xs font-semibold text-gray-500 uppercase tracking-wide mb-1">Max carbs (g)</label>
                <input
                  type="number" min="0" step="5"
                  value={pendingFilters.maxCarbs}
                  onChange={(e) => setPendingField("maxCarbs", e.target.value)}
                  className="w-full px-2 py-1.5 text-sm border border-gray-200 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-orange-500"
                />
              </div>
              <div>
                <label className="block text-xs font-semibold text-gray-500 uppercase tracking-wide mb-1">Max total time (min)</label>
                <input
                  type="number" min="0" step="5"
                  value={pendingFilters.maxTotalTime}
                  onChange={(e) => setPendingField("maxTotalTime", e.target.value)}
                  className="w-full px-2 py-1.5 text-sm border border-gray-200 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-orange-500"
                />
              </div>
            </div>
            <div className="flex items-center justify-between gap-3 flex-wrap pt-2">
              <span className="text-xs text-gray-500">
                Preview: <span className="font-semibold text-gray-700">{pendingFilteredRecipes.length}</span> of {recipes.length} recipes
                {filtersDiffer && (
                  <span className="ml-2 text-amber-600">— click Apply to use these filters</span>
                )}
              </span>
              <div className="flex items-center gap-2">
                <button
                  type="button"
                  onClick={resetFilters}
                  className="px-3 py-1.5 text-sm rounded-lg border border-gray-200 text-gray-700 hover:bg-gray-50 transition-colors"
                >
                  Reset
                </button>
                <button
                  type="button"
                  onClick={applyFilters}
                  disabled={!filtersDiffer}
                  className={`px-4 py-1.5 text-sm font-medium rounded-lg transition-colors ${
                    filtersDiffer
                      ? 'bg-orange-500 text-white hover:bg-orange-600'
                      : 'bg-gray-100 text-gray-400 cursor-not-allowed'
                  }`}
                >
                  Apply
                </button>
              </div>
            </div>
          </div>
        )}
      </div>

      {recipes.length === 0 ? (
        <div className="bg-white rounded-2xl shadow-lg p-12 text-center">
          <div className="w-20 h-20 bg-gradient-to-br from-orange-100 to-amber-100 rounded-full flex items-center justify-center mx-auto mb-6">
            <Calendar className="w-10 h-10 text-orange-400" />
          </div>
          <h3 className="text-xl font-semibold text-gray-800 mb-2">No recipes available</h3>
          <p className="text-gray-500">Add some recipes first to start planning your meals</p>
        </div>
      ) : (
        <div className="bg-white rounded-2xl shadow-lg p-3 sm:p-6 overflow-x-auto">
          <table className="w-full min-w-[550px] sm:min-w-[800px]">
            <thead>
              <tr>
                <th className="p-2 sm:p-3 text-left text-xs sm:text-sm font-semibold text-gray-500 uppercase tracking-wide border-b-2 border-orange-200">
                  Day
                </th>
                {meals.map((meal) => (
                  <th
                    key={meal}
                    className="p-2 sm:p-3 text-left text-xs sm:text-sm font-semibold text-gray-500 uppercase tracking-wide border-b-2 border-orange-200"
                  >
                    {meal}
                  </th>
                ))}
              </tr>
            </thead>
            <tbody>
              {days.map((day, dayIndex) => {
                const dayTotal = dayTotalCalories(day);
                const overBudget = dayTotal > dailyTarget * 1.1;
                return (
                <tr key={day} className={`border-b border-gray-100 hover:bg-orange-50/50 transition-colors ${dayIndex % 2 === 0 ? 'bg-white' : 'bg-gray-50/30'}`}>
                  <td className="p-2 sm:p-3 align-top">
                    <div className="text-xs sm:text-sm font-semibold text-gray-800">{day}</div>
                    {dayTotal > 0 && (
                      <div className={`mt-1 inline-flex items-center gap-1 text-[10px] sm:text-xs font-medium ${budgetColorClass(dayTotal, dailyTarget)}`}>
                        {overBudget && <AlertTriangle className="w-3 h-3" />}
                        <span>{dayTotal.toLocaleString()} / {dailyTarget.toLocaleString()} kcal</span>
                      </div>
                    )}
                  </td>
                  {meals.map((meal) => {
                    const ids = slotIds(day, meal);
                    const atCap = ids.length >= SLOT_CAP;
                    const isDropTarget = dragOverCell?.day === day && dragOverCell?.meal === meal;

                    return (
                      <td
                        key={meal}
                        className={`p-2 sm:p-3 align-top transition-shadow ${
                          isDropTarget ? 'ring-2 ring-emerald-400 rounded-xl' : ''
                        }`}
                        onDragOver={(e) => {
                          e.preventDefault();
                          e.dataTransfer.dropEffect = 'move';
                        }}
                        onDragEnter={(e) => {
                          e.preventDefault();
                          setDragOverCell({ day, meal });
                        }}
                        onDragLeave={(e) => {
                          // Only clear if leaving the <td> itself, not bubbling from children
                          if (e.currentTarget.contains(e.relatedTarget)) return;
                          setDragOverCell((prev) =>
                            prev?.day === day && prev?.meal === meal ? null : prev
                          );
                        }}
                        onDrop={(e) => {
                          e.preventDefault();
                          setDragOverCell(null);
                          try {
                            const data = JSON.parse(e.dataTransfer.getData('application/json'));
                            if (!data || data.srcDay == null) return;
                            moveDish(data.srcDay, data.srcMeal, data.srcIndex, day, meal);
                          } catch {
                            /* ignore non-JSON drops */
                          }
                        }}
                      >
                        <div className="space-y-1.5">
                          {ids.map((recipeId, index) => {
                            const recipe = recipes.find((r) => r.id === recipeId);
                            if (!recipe) return null;
                            return (
                              <div
                                key={`${recipeId}-${index}`}
                                draggable
                                onDragStart={(e) => {
                                  e.dataTransfer.effectAllowed = 'move';
                                  e.dataTransfer.setData(
                                    'application/json',
                                    JSON.stringify({ srcDay: day, srcMeal: meal, srcIndex: index, recipeId })
                                  );
                                }}
                                className="bg-gradient-to-r from-orange-100 to-amber-100 rounded-xl p-2 sm:p-3 relative group cursor-grab active:cursor-grabbing"
                                title="Drag to move to another slot"
                              >
                                <p className="text-xs sm:text-sm font-medium text-gray-800 pr-6 line-clamp-2">
                                  {recipe.title}
                                </p>
                                {recipe.difficulty && (
                                  <div className="mt-1">
                                    <span className={`text-xs px-2 py-0.5 rounded-full ${
                                      recipe.difficulty === 'easy' ? 'bg-green-100 text-green-700' :
                                      recipe.difficulty === 'medium' ? 'bg-amber-100 text-amber-700' :
                                      'bg-red-100 text-red-700'
                                    }`}>
                                      {recipe.difficulty}
                                    </span>
                                  </div>
                                )}
                                <button
                                  onClick={() => removeRecipeAt(day, meal, index)}
                                  className="absolute top-2 right-2 text-gray-400 hover:text-red-500 transition opacity-0 group-hover:opacity-100"
                                  aria-label="Remove recipe"
                                >
                                  <X className="w-4 h-4" />
                                </button>
                              </div>
                            );
                          })}
                          {!atCap && (
                            <select
                              value=""
                              onChange={(e) => {
                                if (e.target.value) {
                                  addRecipeToMeal(day, meal, parseInt(e.target.value, 10));
                                  e.target.value = "";
                                }
                              }}
                              className="w-full px-2 sm:px-3 py-1.5 sm:py-2 text-xs sm:text-sm border border-dashed border-gray-300 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-orange-500 bg-white/50 hover:border-orange-400 hover:bg-white transition-all cursor-pointer"
                            >
                              <option value="">
                                {ids.length === 0 ? '+ Add recipe' : `+ Add (${ids.length}/${SLOT_CAP})`}
                              </option>
                              {filteredRecipes.map((r) => (
                                <option key={r.id} value={r.id}>
                                  {r.title}
                                </option>
                              ))}
                            </select>
                          )}
                          {atCap && (
                            <p className="text-[10px] sm:text-xs text-gray-400 text-center">
                              Slot full ({SLOT_CAP}/{SLOT_CAP})
                            </p>
                          )}
                        </div>
                      </td>
                    );
                  })}
                </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      )}

      {dndToast && (
        <motion.div
          initial={{ opacity: 0, y: -10 }}
          animate={{ opacity: 1, y: 0 }}
          exit={{ opacity: 0, y: -10 }}
          className="fixed top-4 left-1/2 -translate-x-1/2 z-50 px-4 py-2 bg-gray-900 text-white text-sm font-medium rounded-full shadow-lg"
        >
          {dndToast}
        </motion.div>
      )}
    </div>
  );
};

const RecipeManager = () => {
  const [user, setUser] = useState(null);
  const [authChecked, setAuthChecked] = useState(false);

  const [recipes, setRecipes] = useState([]);
  const [mealPlan, setMealPlan] = useState({});
  const [backendShoppingList, setBackendShoppingList] = useState(null);
  const [isGeneratingShoppingList, setIsGeneratingShoppingList] = useState(false);

  const [currentView, setCurrentView] = useState(localStorage.getItem('currentView') || "recipes");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const [showRecipeForm, setShowRecipeForm] = useState(false);
  const [editingRecipe, setEditingRecipe] = useState(null);

  const [searchQuery, setSearchQuery] = useState("");
  const [selectedTags, setSelectedTags] = useState([]);

  const [showSettings, setShowSettings] = useState(false);
  const [showUserDropdown, setShowUserDropdown] = useState(false);
  const [randomizerMode, setRandomizerMode] = useState(localStorage.getItem('randomizerMode') || 'smart'); // 'smart' or 'full-random'

  // Close user dropdown when clicking outside
  useEffect(() => {
    const handleClickOutside = (event) => {
      if (showUserDropdown && !event.target.closest('.user-dropdown-container')) {
        setShowUserDropdown(false);
      }
    };

    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, [showUserDropdown]);

  // Check for existing auth token on mount
  useEffect(() => {
    const checkAuth = async () => {
      const token = localStorage.getItem("authToken");
      if (token) {
        const result = await api.getCurrentUser();
        if (!result.error && result.user) {
          setUser(result.user);
        }
      }
      setAuthChecked(true);
    };
    checkAuth();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // Save current view to localStorage whenever it changes
  useEffect(() => {
    localStorage.setItem('currentView', currentView);
  }, [currentView]);

  useEffect(() => {
    if (user) {
      loadRecipes();
      loadMealPlan();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [user]);

  // Debounced backend regeneration whenever the meal plan changes.
  // The server joins recipes -> recipe_ingredients itself, so we don't need
  // the recipes array to have ingredients on the client.
  useEffect(() => {
    if (!user) return;
    if (Object.keys(mealPlan).length === 0) {
      setBackendShoppingList(null);
      return;
    }
    const handle = setTimeout(async () => {
      setIsGeneratingShoppingList(true);
      try {
        const weekStart = getWeekStartDate();
        const result = await api.generateShoppingList(weekStart);
        if (!result.error) setBackendShoppingList(result);
      } finally {
        setIsGeneratingShoppingList(false);
      }
    }, 500);
    return () => clearTimeout(handle);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [mealPlan, user]);

  // Handle recipe import from shared link
  useEffect(() => {
    if (user) {
      const urlParams = new URLSearchParams(window.location.search);
      const encodedRecipe = urlParams.get('recipe');

      if (encodedRecipe) {
        try {
          const recipeData = JSON.parse(atob(encodedRecipe));

          // Show confirmation dialog
          const confirmImport = window.confirm(
            `Do you want to add "${recipeData.title}" to your recipes?`
          );

          if (confirmImport) {
            // Add the recipe
            handleImportRecipe(recipeData);
          }

          // Clear the URL parameter
          window.history.replaceState({}, document.title, window.location.pathname);
        } catch (err) {
          console.error('Failed to import recipe:', err);
          alert('Invalid recipe link');
          window.history.replaceState({}, document.title, window.location.pathname);
        }
      }
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [user]);

  const handleImportRecipe = async (recipeData) => {
    const result = await api.createRecipe(recipeData);
    if (result.error) {
      alert('Failed to import recipe: ' + result.error);
    } else {
      alert(`Recipe "${recipeData.title}" has been added to your recipes!`);
      loadRecipes(); // Reload recipes to show the new one
      setCurrentView('recipes'); // Switch to recipes view
    }
  };

  const loadRecipes = async () => {
    setLoading(true);
    setError("");

    try {
      // Fetch user's own recipes, saved library recipes, and the full public library in parallel.
      const [userResult, savedResult, libraryResult] = await Promise.all([
        api.getRecipes(),
        api.getSavedRecipes(),
        api.getLibraryRecipes(),
      ]);

      const userRecipes = (userResult.items || userResult.recipes || []).map(r => ({
        ...r,
        source: r.source || 'user',
      }));

      const savedRecipes = (savedResult.items || []).map(r => ({
        ...r,
        source: 'library',
        isSavedFromLibrary: true,
      }));

      const libraryRecipes = (libraryResult.items || []).map(r => ({
        ...r,
        source: 'library',
        isSavedFromLibrary: r.is_saved === true,
      }));

      // Merge with dedupe by id. Saved entries win over plain library entries
      // (they carry recipe_ingredients + the saved flag), and user-owned recipes
      // always take precedence over both.
      const byId = new Map();
      for (const r of libraryRecipes) byId.set(r.id, r);
      for (const r of savedRecipes) byId.set(r.id, { ...byId.get(r.id), ...r });
      for (const r of userRecipes) byId.set(r.id, r);

      setRecipes([...byId.values()]);

      // Only surface an error if every source failed and we have nothing to show.
      if (
        userResult.error &&
        savedResult.error &&
        libraryResult.error &&
        byId.size === 0
      ) {
        setError("Unable to load recipes");
      }
    } catch (err) {
      console.error('Error loading recipes:', err);
      setError("");
      setRecipes([]);
    }

    setLoading(false);
  };

  // Unsave a library recipe
  const handleUnsaveRecipe = async (recipeId) => {
    const token = localStorage.getItem('authToken');
    if (!token) return;

    try {
      const response = await fetch(`${API_BASE_URL}/library/recipes/${recipeId}/unsave`, {
        method: 'DELETE',
        headers: { 'Authorization': `Bearer ${token}` }
      });
      if (response.ok) {
        loadRecipes(); // Refresh the list
      }
    } catch (err) {
      console.error('Error unsaving recipe:', err);
    }
  };

  const loadMealPlan = async () => {
    const result = await api.getMealPlan();
    if (!result.error) setMealPlan(result.plan || result);
  };


  const handleAddRecipe = () => {
    setEditingRecipe(null);
    setShowRecipeForm(true);
  };

  const handleEditRecipe = (recipe) => {
    setEditingRecipe(recipe);
    setShowRecipeForm(true);
  };

  const handleDeleteRecipe = async (id) => {
    if (!window.confirm("Are you sure you want to delete this recipe?")) return;

    const result = await api.deleteRecipe(id);
    if (result.error) setError(result.error);
    else setRecipes(recipes.filter((r) => r.id !== id));
  };

  const handleSaveRecipe = async (recipe) => {
    setError("");

    if (editingRecipe) {
      const result = await api.updateRecipe(editingRecipe.id, recipe);
      if (result.error) {
        // Handle validation errors from FastAPI
        const errorMsg = typeof result.error === 'string'
          ? result.error
          : Array.isArray(result.error)
            ? result.error.map(e => e.msg || JSON.stringify(e)).join(', ')
            : JSON.stringify(result.error);
        setError(errorMsg);
      } else {
        setRecipes(recipes.map((r) => (r.id === editingRecipe.id ? result : r)));
        setShowRecipeForm(false);
      }
    } else {
      const result = await api.createRecipe(recipe);
      if (result.error) {
        // Handle validation errors from FastAPI
        const errorMsg = typeof result.error === 'string'
          ? result.error
          : Array.isArray(result.error)
            ? result.error.map(e => e.msg || JSON.stringify(e)).join(', ')
            : JSON.stringify(result.error);
        setError(errorMsg);
      } else {
        setRecipes([...recipes, result]);
        setShowRecipeForm(false);
      }
    }
  };

  const filteredRecipes = recipes.filter((recipe) => {
    const matchesSearch =
      searchQuery === "" ||
      recipe.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
      recipe.recipe_ingredients?.some((ri) => {
        const ingName = (ri.ingredient?.name || ri.ingredient_name || "").toLowerCase();
        return ingName.includes(searchQuery.toLowerCase());
      });

    const matchesTags =
      selectedTags.length === 0 ||
      selectedTags.every((tag) =>
        recipe.tags?.some(t => (typeof t === 'string' ? t : t.name) === tag)
      );

    return matchesSearch && matchesTags;
  });

  const allTags = [...new Set(recipes.flatMap((r) =>
    (r.tags || []).map(t => typeof t === 'string' ? t : t.name)
  ))].sort((a, b) => {
    // Priority order: Breakfast, Lunch, Dinner first, then alphabetical
    const mealTypes = ['Breakfast', 'Lunch', 'Dinner'];
    const aIsMeal = mealTypes.indexOf(a);
    const bIsMeal = mealTypes.indexOf(b);

    if (aIsMeal !== -1 && bIsMeal !== -1) {
      // Both are meal types, sort by priority order
      return aIsMeal - bIsMeal;
    } else if (aIsMeal !== -1) {
      // Only a is a meal type, it comes first
      return -1;
    } else if (bIsMeal !== -1) {
      // Only b is a meal type, it comes first
      return 1;
    } else {
      // Neither are meal types, sort alphabetically
      return a.localeCompare(b);
    }
  });

  // Show loading while checking auth
  if (!authChecked) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-orange-50 to-amber-50 flex items-center justify-center">
        <div className="text-center">
          <div className="w-12 h-12 border-4 border-orange-500/30 border-t-orange-500 rounded-full animate-spin mx-auto mb-4" />
          <p className="text-gray-600 font-medium">Loading...</p>
        </div>
      </div>
    );
  }

  // Redirect to auth flow if not authenticated
  if (!user) return <Navigate to="/auth/login" replace />;

  // Layout updated with gradient styling matching auth pages
  return (
    <div className="min-h-screen bg-gradient-to-br from-orange-50 to-amber-50 overflow-x-hidden">
      <nav className="bg-gradient-to-r from-orange-500 to-orange-600 shadow-lg">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 py-3">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-2 sm:gap-3">
              <Book className="w-8 h-8 sm:w-8 sm:h-8 text-white flex-shrink-0" />
              <h1 className="text-base sm:text-2xl font-bold text-white whitespace-nowrap">Recipe Manager</h1>
            </div>

            {/* Navigation buttons - responsive with icons only on mobile */}
            <div className="flex items-center gap-1 sm:gap-2">
              <button
                onClick={() => setCurrentView("recipes")}
                className={`flex items-center gap-1 sm:gap-2 p-2 sm:px-4 sm:py-2 rounded-xl transition font-medium ${
                  currentView === "recipes"
                    ? "bg-white/25 text-white shadow-inner"
                    : "text-white/80 hover:bg-white/15 hover:text-white"
                }`}
              >
                <Book className="w-5 h-5" />
                <span className="hidden md:inline">My Recipes</span>
              </button>

              <button
                onClick={() => setCurrentView("favorites")}
                className={`flex items-center gap-1 sm:gap-2 p-2 sm:px-4 sm:py-2 rounded-xl transition font-medium ${
                  currentView === "favorites"
                    ? "bg-white/25 text-white shadow-inner"
                    : "text-white/80 hover:bg-white/15 hover:text-white"
                }`}
              >
                <Heart className="w-5 h-5" />
                <span className="hidden md:inline">Favorites</span>
              </button>

              <button
                onClick={() => setCurrentView("library")}
                className={`flex items-center gap-1 sm:gap-2 p-2 sm:px-4 sm:py-2 rounded-xl transition font-medium ${
                  currentView === "library"
                    ? "bg-white/25 text-white shadow-inner"
                    : "text-white/80 hover:bg-white/15 hover:text-white"
                }`}
              >
                <Compass className="w-5 h-5" />
                <span className="hidden md:inline">Browse</span>
              </button>

              <button
                onClick={() => setCurrentView("planner")}
                className={`flex items-center gap-1 sm:gap-2 p-2 sm:px-4 sm:py-2 rounded-xl transition font-medium ${
                  currentView === "planner"
                    ? "bg-white/25 text-white shadow-inner"
                    : "text-white/80 hover:bg-white/15 hover:text-white"
                }`}
              >
                <Calendar className="w-5 h-5" />
                <span className="hidden md:inline">Meal Plan</span>
              </button>

              <button
                onClick={() => setCurrentView("shopping")}
                className={`flex items-center gap-1 sm:gap-2 p-2 sm:px-4 sm:py-2 rounded-xl transition font-medium ${
                  currentView === "shopping"
                    ? "bg-white/25 text-white shadow-inner"
                    : "text-white/80 hover:bg-white/15 hover:text-white"
                }`}
              >
                <ShoppingCart className="w-5 h-5" />
                <span className="hidden md:inline">Shopping</span>
              </button>

              <div className="relative user-dropdown-container ml-2">
                <button
                  onClick={() => setShowUserDropdown(!showUserDropdown)}
                  className="flex items-center gap-1 sm:gap-2 text-white/90 hover:text-white px-2 sm:px-3 py-2 rounded-xl hover:bg-white/15 transition"
                >
                  <div className="w-8 h-8 rounded-full bg-white/25 flex items-center justify-center">
                    <User className="w-4 h-4 text-white" />
                  </div>
                  <span className="hidden sm:inline font-medium">{user?.name ?? "User"}</span>
                  <ChevronDown className="w-4 h-4" />
                </button>

                {showUserDropdown && (
                  <div className="absolute right-0 mt-2 w-48 bg-white rounded-xl shadow-xl border border-gray-100 py-2 z-50">
                    <button
                      onClick={() => {
                        setShowSettings(true);
                        setShowUserDropdown(false);
                      }}
                      className="w-full flex items-center gap-2 px-4 py-2.5 text-left text-gray-700 hover:bg-gray-50 transition"
                    >
                      <Settings className="w-4 h-4" />
                      <span>Settings</span>
                    </button>
                    <button
                      onClick={() => {
                        localStorage.removeItem("authToken");
                        setUser(null);
                      }}
                      className="w-full flex items-center gap-2 px-4 py-2.5 text-left text-red-600 hover:bg-red-50 transition"
                    >
                      <LogOut className="w-4 h-4" />
                      <span>Logout</span>
                    </button>
                  </div>
                )}
              </div>
            </div>
          </div>
        </div>
      </nav>

      <main className="max-w-7xl mx-auto px-4 sm:px-6 py-6 sm:py-8">
        {error && (
          <div className="mb-4 p-3 bg-red-100 border border-red-400 text-red-700 rounded-lg">
            {error}
          </div>
        )}

        <AnimatePresence mode="wait">
          {currentView === "recipes" && (
            <motion.div
              key="recipes"
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -10 }}
              transition={{ duration: 0.2 }}
            >
              <RecipesView
                recipes={filteredRecipes.filter((r) => r.source !== 'library')}
                loading={loading}
                searchQuery={searchQuery}
                setSearchQuery={setSearchQuery}
                selectedTags={selectedTags}
                setSelectedTags={setSelectedTags}
                allTags={allTags}
                onAddRecipe={handleAddRecipe}
                onEditRecipe={handleEditRecipe}
                onDeleteRecipe={handleDeleteRecipe}
                onUnsaveRecipe={handleUnsaveRecipe}
              />
            </motion.div>
          )}

          {currentView === "favorites" && (
            <motion.div
              key="favorites"
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -10 }}
              transition={{ duration: 0.2 }}
            >
              <RecipesView
                recipes={filteredRecipes.filter((r) => r.isSavedFromLibrary === true)}
                loading={loading}
                searchQuery={searchQuery}
                setSearchQuery={setSearchQuery}
                selectedTags={selectedTags}
                setSelectedTags={setSelectedTags}
                allTags={allTags}
                onAddRecipe={null}
                onEditRecipe={handleEditRecipe}
                onDeleteRecipe={handleDeleteRecipe}
                onUnsaveRecipe={handleUnsaveRecipe}
                emptyStateTitle="No favorites yet"
                emptyStateMessage="Tap the heart on any recipe to save it here."
                viewTitle="Favorites"
                viewSubtitle="Recipes you've saved from the library"
              />
            </motion.div>
          )}

          {currentView === "library" && (
            <motion.div
              key="library"
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -10 }}
              transition={{ duration: 0.2 }}
            >
              <RecipeLibrary onSavedChange={loadRecipes} />
            </motion.div>
          )}
        </AnimatePresence>

        {currentView === "planner" && (
          <MealPlannerView
            recipes={recipes}
            mealPlan={mealPlan}
            setMealPlan={setMealPlan}
            onSavePlan={async (plan) => {
              const result = await api.updateMealPlan(plan);
              if (result.error) setError(result.error);
            }}
            randomizerMode={randomizerMode}
          />
        )}

        {currentView === "shopping" && (
          <ShoppingListView
            backendShoppingList={backendShoppingList}
            setBackendShoppingList={setBackendShoppingList}
            isGenerating={isGeneratingShoppingList}
          />
        )}
      </main>

      {showRecipeForm && (
        <RecipeFormModal
          recipe={editingRecipe}
          onClose={() => setShowRecipeForm(false)}
          onSave={handleSaveRecipe}
        />
      )}

      {showSettings && (
        <SettingsModal
          user={user}
          recipes={recipes}
          onClose={() => setShowSettings(false)}
          randomizerMode={randomizerMode}
          setRandomizerMode={setRandomizerMode}
        />
      )}
    </div>
  );
};

export default RecipeManager;
