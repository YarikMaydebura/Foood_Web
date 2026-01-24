import { useEffect, useState } from "react";
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
} from "lucide-react";
import RecipeLibrary from "./components/RecipeLibrary";

// API configuration
const API_BASE_URL = import.meta.env.VITE_API_BASE_URL ?? "http://127.0.0.1:8000";
const APP_URL = import.meta.env.VITE_APP_URL ?? window.location.origin;

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
}) => {
  const [currentPage, setCurrentPage] = useState(1);
  const [sortBy, setSortBy] = useState('date-newest');
  const recipesPerPage = 12;

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
          <h2 className="text-2xl sm:text-3xl font-bold text-gray-900">My Recipes</h2>
          <p className="text-gray-500 text-sm mt-1">Your personal recipe collection</p>
        </div>
        <button
          onClick={onAddRecipe}
          className="flex items-center gap-2 bg-gradient-to-r from-orange-500 to-orange-600 text-white px-4 sm:px-6 py-2.5 sm:py-3 rounded-xl hover:from-orange-600 hover:to-orange-700 transition-all shadow-md hover:shadow-lg font-medium"
        >
          <Plus className="w-5 h-5" />
          <span className="hidden sm:inline">Add Recipe</span>
        </button>
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
          <div className="flex flex-wrap gap-2">
            {allTags.map((tag) => (
              <button
                key={tag}
                onClick={() =>
                  setSelectedTags(
                    selectedTags.includes(tag)
                      ? selectedTags.filter((t) => t !== tag)
                      : [...selectedTags, tag]
                  )
                }
                className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                  selectedTags.includes(tag)
                    ? "bg-gradient-to-r from-orange-500 to-orange-600 text-white shadow-md"
                    : "bg-white text-gray-700 shadow-sm hover:shadow-md"
                }`}
              >
                {tag}
              </button>
            ))}
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
              <h3 className="text-xl font-semibold text-gray-800 mb-2">No recipes yet</h3>
              <p className="text-gray-500 mb-6">Start building your recipe collection!</p>
              <button
                onClick={onAddRecipe}
                className="bg-gradient-to-r from-orange-500 to-orange-600 text-white px-6 py-3 rounded-xl hover:from-orange-600 hover:to-orange-700 transition-all shadow-md font-medium"
              >
                Add Your First Recipe
              </button>
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

const ShoppingListView = ({ shoppingList, setShoppingList }) => {
  const toggleItem = (index) => {
    setShoppingList(
      shoppingList.map((item, i) => (i === index ? { ...item, checked: !item.checked } : item))
    );
  };

  const uncheckedCount = shoppingList.filter((item) => !item.isHeader && !item.checked).length;
  const totalCount = shoppingList.filter((item) => !item.isHeader).length;
  const progressPercent = totalCount > 0 ? ((totalCount - uncheckedCount) / totalCount) * 100 : 0;

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h2 className="text-2xl sm:text-3xl font-bold text-gray-900">Shopping List</h2>
          <p className="text-gray-500 text-sm mt-1">Items from your meal plan</p>
        </div>
        {totalCount > 0 && (
          <div className="text-right">
            <div className="text-sm font-medium text-gray-700">
              {totalCount - uncheckedCount} of {totalCount} items
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
        {shoppingList.length === 0 ? (
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
              {shoppingList.map((item, index) => (
                item.isHeader ? (
                  <div
                    key={index}
                    className="flex items-center gap-3 pt-6 pb-2 mt-4 first:mt-0 first:pt-0"
                  >
                    <div className="flex-1 flex items-center gap-3">
                      <h3 className="text-sm font-bold text-orange-600 uppercase tracking-wider">
                        {item.item}
                      </h3>
                      <div className="flex-1 h-px bg-gradient-to-r from-orange-200 to-transparent" />
                    </div>
                  </div>
                ) : (
                  <div
                    key={index}
                    className={`flex items-center gap-3 p-3 rounded-xl transition-all cursor-pointer ${
                      item.checked ? 'bg-gray-50' : 'hover:bg-orange-50'
                    }`}
                    onClick={() => toggleItem(index)}
                  >
                    <div className={`w-5 h-5 rounded-full border-2 flex items-center justify-center transition-all flex-shrink-0 ${
                      item.checked
                        ? 'bg-gradient-to-r from-green-400 to-emerald-500 border-transparent'
                        : 'border-gray-300 hover:border-orange-400'
                    }`}>
                      {item.checked && (
                        <svg className="w-3 h-3 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={3} d="M5 13l4 4L19 7" />
                        </svg>
                      )}
                    </div>
                    <span
                      className={`flex-1 transition-all ${
                        item.checked ? "line-through text-gray-400" : "text-gray-800"
                      }`}
                    >
                      {item.displayQuantity && (
                        <span className="text-gray-500 font-normal">
                          {item.displayQuantity}{' '}
                        </span>
                      )}
                      <span className="font-medium">{item.ingredient}</span>
                      {item.hint && (
                        <span className={`ml-2 text-sm ${item.checked ? "text-gray-400" : "text-orange-500"}`}>
                          ({item.hint})
                        </span>
                      )}
                    </span>
                  </div>
                )
              ))}
            </div>

            {totalCount > 0 && (
              <div className="mt-6 pt-6 border-t border-gray-100">
                <div className="flex flex-col sm:flex-row gap-3">
                  <button
                    onClick={() =>
                      setShoppingList(shoppingList.map((item) => ({ ...item, checked: true })))
                    }
                    className="flex-1 px-4 py-2.5 bg-white border border-gray-200 rounded-xl hover:bg-gray-50 transition text-gray-700 font-medium shadow-sm"
                  >
                    Check All
                  </button>
                  <button
                    onClick={() =>
                      setShoppingList(shoppingList.map((item) => ({ ...item, checked: false })))
                    }
                    className="flex-1 px-4 py-2.5 bg-white border border-gray-200 rounded-xl hover:bg-gray-50 transition text-gray-700 font-medium shadow-sm"
                  >
                    Uncheck All
                  </button>
                  <button
                    onClick={() => setShoppingList(shoppingList.filter((item) => !item.checked))}
                    className="flex-1 px-4 py-2.5 bg-red-50 text-red-600 border border-red-200 rounded-xl hover:bg-red-100 transition font-medium"
                  >
                    Clear Checked
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

const SettingsModal = ({ user, onClose, randomizerMode, setRandomizerMode }) => {
  const [name, setName] = useState(user?.name || "");
  const [email, setEmail] = useState(user?.email || "");
  const [currentPassword, setCurrentPassword] = useState("");
  const [newPassword, setNewPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");
  const [tempRandomizerMode, setTempRandomizerMode] = useState(randomizerMode);

  const handleCancel = () => {
    // Don't save any changes, just close
    onClose();
  };

  const handleSaveAndClose = () => {
    // Apply the temporary randomizer mode
    setRandomizerMode(tempRandomizerMode);
    localStorage.setItem('randomizerMode', tempRandomizerMode);
    onClose();
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
const RecipeFormModal = ({ recipe, onClose, onSave }) => {
  // Debug: Log recipe data to console
  console.log("Recipe data:", recipe);
  console.log("Recipe ingredients:", recipe?.recipe_ingredients);
  console.log("Recipe tags:", recipe?.tags);

  const [title, setTitle] = useState(recipe?.title || "");
  const [image, setImage] = useState(recipe?.image_url || "");
  const [imageFile, setImageFile] = useState(null);
  const [tags, setTags] = useState(
    recipe?.tags?.map(t => typeof t === 'string' ? t : t.name).join(", ") || ""
  );
  const [ingredients, setIngredients] = useState(
    recipe?.recipe_ingredients?.map(ri => ri.ingredient?.name || ri.ingredient_name).join("\n") || ""
  );
  const [instructions, setInstructions] = useState(recipe?.instructions || "");
  const [error, setError] = useState("");

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
          setImageFile(file);
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

    onSave({
      title: title.trim(),
      image_url: image.trim(),
      description: "",
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
        className="bg-white rounded-2xl shadow-2xl w-full max-w-md sm:max-w-2xl max-h-[90vh] overflow-y-auto"
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

          <div className="space-y-5">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Recipe Title *</label>
              <input
                type="text"
                value={title}
                onChange={(e) => setTitle(e.target.value)}
                placeholder="e.g., Spaghetti Carbonara"
                className="w-full px-4 py-3 bg-gray-50 border-0 rounded-xl focus:ring-2 focus:ring-orange-500 focus:bg-white transition-all"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Image</label>
              <div className="space-y-3">
                <div>
                  <input
                    type="file"
                    accept="image/*"
                    onChange={handleImageUpload}
                    className="w-full px-4 py-3 bg-gray-50 border-0 rounded-xl focus:ring-2 focus:ring-orange-500 transition-all file:mr-4 file:py-2 file:px-4 file:rounded-lg file:border-0 file:text-sm file:font-semibold file:bg-orange-100 file:text-orange-700 hover:file:bg-orange-200 cursor-pointer"
                  />
                </div>
                <div className="text-center text-sm text-gray-400">or enter URL</div>
                <div>
                  <input
                    type="url"
                    value={image}
                    onChange={(e) => setImage(e.target.value)}
                    placeholder="https://example.com/image.jpg"
                    className="w-full px-4 py-3 bg-gray-50 border-0 rounded-xl focus:ring-2 focus:ring-orange-500 focus:bg-white transition-all"
                  />
                </div>
                {image && (
                  <div className="mt-2">
                    <img src={image} alt="Preview" className="w-32 h-32 object-cover rounded-xl shadow-sm" />
                  </div>
                )}
              </div>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Tags (comma-separated)
              </label>
              <input
                type="text"
                value={tags}
                onChange={(e) => setTags(e.target.value)}
                placeholder="e.g., Italian, Dinner, Quick"
                className="w-full px-4 py-3 bg-gray-50 border-0 rounded-xl focus:ring-2 focus:ring-orange-500 focus:bg-white transition-all"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Ingredients (one per line) *
              </label>
              <textarea
                value={ingredients}
                onChange={(e) => setIngredients(e.target.value)}
                rows={4}
                placeholder="e.g., 200g pasta&#10;2 eggs&#10;100g pancetta"
                className="w-full px-4 py-3 bg-gray-50 border-0 rounded-xl focus:ring-2 focus:ring-orange-500 focus:bg-white transition-all resize-none"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Instructions *</label>
              <textarea
                value={instructions}
                onChange={(e) => setInstructions(e.target.value)}
                rows={4}
                placeholder="Step-by-step cooking instructions..."
                className="w-full px-4 py-3 bg-gray-50 border-0 rounded-xl focus:ring-2 focus:ring-orange-500 focus:bg-white transition-all resize-none"
              />
            </div>

            <div className="flex gap-4 pt-4">
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

const MealPlannerView = ({ recipes, mealPlan, setMealPlan, onSavePlan, randomizerMode }) => {
  const days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
  const meals = ["Breakfast", "Lunch", "Dinner", "Dessert/Snacking"];

  const addRecipeToMeal = (day, meal, recipeId) => {
    const newPlan = {
      ...mealPlan,
      [day]: {
        ...(mealPlan[day] || {}),
        [meal]: recipeId,
      },
    };
    setMealPlan(newPlan);
    onSavePlan(newPlan);
  };

  const removeRecipeFromMeal = (day, meal) => {
    const newPlan = { ...mealPlan };
    if (newPlan[day]) {
      delete newPlan[day][meal];
      if (Object.keys(newPlan[day]).length === 0) delete newPlan[day];
    }
    setMealPlan(newPlan);
    onSavePlan(newPlan);
  };

  const clearAllMeals = () => {
    if (window.confirm("Are you sure you want to clear all meals from this week's plan?")) {
      setMealPlan({});
      onSavePlan({});
    }
  };

  const randomizeMealPlan = () => {
    const newPlan = {};

    if (randomizerMode === 'full-random') {
      // Full random mode: pick any recipe for any slot
      days.forEach(day => {
        newPlan[day] = {};
        meals.forEach(meal => {
          if (recipes.length > 0) {
            const randomRecipe = recipes[Math.floor(Math.random() * recipes.length)];
            newPlan[day][meal] = randomRecipe.id;
          }
        });
      });
    } else {
      // Smart mode: match recipes by tags
      // Helper function to get random recipe with matching tag
      const getRandomRecipeForMeal = (mealType) => {
        // Map meal types to tag keywords
        const tagMapping = {
          'Breakfast': ['breakfast'],
          'Lunch': ['lunch'],
          'Dinner': ['dinner'],
          'Dessert/Snacking': ['dessert', 'sweet', 'snack']
        };

        const matchingKeywords = tagMapping[mealType] || [];

        // Filter recipes that have tags matching this meal type
        const matchingRecipes = recipes.filter(recipe => {
          if (!recipe.tags || recipe.tags.length === 0) return false;
          return recipe.tags.some(tag => {
            const tagName = typeof tag === 'string' ? tag.toLowerCase() : tag.name.toLowerCase();
            return matchingKeywords.some(keyword => tagName.includes(keyword));
          });
        });

        // If no matching recipes, return null
        if (matchingRecipes.length === 0) return null;

        // Return random recipe from matching ones
        return matchingRecipes[Math.floor(Math.random() * matchingRecipes.length)].id;
      };

      // Fill each day and meal slot
      days.forEach(day => {
        newPlan[day] = {};
        meals.forEach(meal => {
          const recipeId = getRandomRecipeForMeal(meal);
          if (recipeId) {
            newPlan[day][meal] = recipeId;
          }
        });
      });
    }

    setMealPlan(newPlan);
    onSavePlan(newPlan);
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
              {days.map((day, dayIndex) => (
                <tr key={day} className={`border-b border-gray-100 hover:bg-orange-50/50 transition-colors ${dayIndex % 2 === 0 ? 'bg-white' : 'bg-gray-50/30'}`}>
                  <td className="p-2 sm:p-3 text-xs sm:text-sm font-semibold text-gray-800">{day}</td>
                  {meals.map((meal) => {
                    const recipeId = mealPlan[day]?.[meal];
                    const recipe = recipes.find((r) => r.id === recipeId);

                    return (
                      <td key={meal} className="p-2 sm:p-3">
                        {recipe ? (
                          <div className="bg-gradient-to-r from-orange-100 to-amber-100 rounded-xl p-2 sm:p-3 relative group">
                            <p className="text-xs sm:text-sm font-medium text-gray-800 pr-6 line-clamp-2">{recipe.title}</p>
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
                              onClick={() => removeRecipeFromMeal(day, meal)}
                              className="absolute top-2 right-2 text-gray-400 hover:text-red-500 transition opacity-0 group-hover:opacity-100"
                            >
                              <X className="w-4 h-4" />
                            </button>
                          </div>
                        ) : (
                          <select
                            onChange={(e) => {
                              if (e.target.value) {
                                addRecipeToMeal(day, meal, parseInt(e.target.value, 10));
                                e.target.value = "";
                              }
                            }}
                            className="w-full px-2 sm:px-3 py-1.5 sm:py-2 text-xs sm:text-sm border border-dashed border-gray-300 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-orange-500 bg-white/50 hover:border-orange-400 hover:bg-white transition-all cursor-pointer"
                          >
                            <option value="">+ Add recipe</option>
                            {recipes.map((r) => (
                              <option key={r.id} value={r.id}>
                                {r.title}
                              </option>
                            ))}
                          </select>
                        )}
                      </td>
                    );
                  })}
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
};

const RecipeManager = () => {
  const [user, setUser] = useState(null);
  const [authChecked, setAuthChecked] = useState(false);

  const [recipes, setRecipes] = useState([]);
  const [mealPlan, setMealPlan] = useState({});
  const [shoppingList, setShoppingList] = useState([]);

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

  useEffect(() => {
    generateShoppingList();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [mealPlan, recipes]);

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
      // Fetch both user's own recipes and saved library recipes
      const [userResult, savedResult] = await Promise.all([
        api.getRecipes(),
        api.getSavedRecipes()
      ]);

      // Handle errors gracefully - show whatever data we have
      const userRecipes = (userResult.items || userResult.recipes || []).map(r => ({
        ...r,
        source: r.source || 'user'
      }));

      const savedRecipes = (savedResult.items || []).map(r => ({
        ...r,
        source: 'library',
        isSavedFromLibrary: true
      }));

      // Combine both lists
      setRecipes([...userRecipes, ...savedRecipes]);

      // Only show error if BOTH failed and no data
      if (userResult.error && savedResult.error && userRecipes.length === 0 && savedRecipes.length === 0) {
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

  const generateShoppingList = () => {
    const ingredientsMap = {};

    // Average weights for common countable ingredients (grams per piece)
    const ingredientWeights = {
      'egg': 50,
      'tomato': 150,
      'onion': 110,
      'garlic': 5,      // per clove
      'banana': 120,
      'apple': 180,
      'potato': 150,
      'carrot': 60,
      'lemon': 60,
      'lime': 45,
      'orange': 130,
      'avocado': 150,
      'chicken breast': 175,
      'bell pepper': 150,
      'pepper': 150,
      'cucumber': 300,
      'zucchini': 200,
      'mushroom': 20,
      'strawberry': 12,
      'cherry tomato': 15,
      'shallot': 30,
      'clove': 5,
    };

    // Unit type classification
    const unitTypes = {
      // Countable
      'piece': 'count', 'pcs': 'count', 'pc': 'count', '': 'count',
      'clove': 'count', 'slice': 'count', 'head': 'count', 'packet': 'count',
      // Weight
      'g': 'weight', 'gram': 'weight', 'kg': 'weight',
      'oz': 'weight', 'lb': 'weight', 'pound': 'weight',
      // Volume
      'ml': 'volume', 'l': 'volume', 'liter': 'volume',
      'cup': 'volume', 'tbsp': 'volume', 'tsp': 'volume',
      'fl oz': 'volume',
    };

    // Helper: convert to grams
    const toGrams = (quantity, unit) => {
      const conversions = { 'g': 1, 'kg': 1000, 'oz': 28.35, 'lb': 453.6 };
      return quantity * (conversions[unit] || 0);
    };

    // Helper: convert to ml
    const toMl = (quantity, unit) => {
      const conversions = {
        'ml': 1, 'l': 1000, 'cup': 240,
        'tbsp': 15, 'tsp': 5, 'fl oz': 30
      };
      return quantity * (conversions[unit] || 0);
    };

    // Helper: format weight for display
    const formatWeight = (grams) => {
      if (grams >= 1000) return `${(grams / 1000).toFixed(1)}kg`;
      return `${Math.round(grams)}g`;
    };

    // Helper: format volume for display
    const formatVolume = (ml) => {
      if (ml >= 1000) return `${(ml / 1000).toFixed(1)}L`;
      return `${Math.round(ml)}ml`;
    };

    Object.values(mealPlan).forEach((dayPlan) => {
      Object.values(dayPlan).forEach((recipeId) => {
        const recipe = recipes.find((r) => r.id === recipeId);
        if (recipe?.recipe_ingredients) {
          recipe.recipe_ingredients.forEach((ri) => {
            const fullText = (ri.ingredient?.name || ri.ingredient_name).trim();

            // Skip "to taste" items
            if (fullText.toLowerCase().match(/^(to\s+taste|salt\s+and\s+pepper\s+to\s+taste)$/i)) {
              return;
            }

            // Parse "quantity unit ingredient" format
            // Improved regex to handle numbers with fractions, decimals, and various units
            const match = fullText.match(/^([\d.\/]+)?\s*(cups?|tbsps?|tablespoons?|tsps?|teaspoons?|g|kg|oz|lbs?|ml|cloves?|slices?|packets?|heads?)?\s*(.+)$/i);

            if (match) {
              let [, qtyStr, unit, ingredient] = match;

              // Parse quantity
              let quantity = 1;
              if (qtyStr) {
                qtyStr = qtyStr.trim();
                if (qtyStr.includes('/')) {
                  const parts = qtyStr.split('/');
                  quantity = parseFloat(parts[0]) / parseFloat(parts[1]);
                } else {
                  quantity = parseFloat(qtyStr);
                }
              }

              // Normalize unit
              let normalizedUnit = '';
              if (unit) {
                unit = unit.toLowerCase().trim();
                if (unit.match(/^cups?$/i)) normalizedUnit = 'cup';
                else if (unit.match(/^(tablespoons?|tbsps?)$/i)) normalizedUnit = 'tbsp';
                else if (unit.match(/^(teaspoons?|tsps?)$/i)) normalizedUnit = 'tsp';
                else if (unit.match(/^cloves?$/i)) normalizedUnit = 'clove';
                else if (unit.match(/^slices?$/i)) normalizedUnit = 'slice';
                else if (unit.match(/^packets?$/i)) normalizedUnit = 'packet';
                else if (unit.match(/^heads?$/i)) normalizedUnit = 'head';
                else if (unit.match(/^lbs?$/i)) normalizedUnit = 'lb';
                else normalizedUnit = unit;
              }

              // Clean ingredient name and normalize spaces
              ingredient = ingredient.trim()
                .replace(/^(fresh|dried|ground|chopped|sliced|diced|minced|crushed)\s+/i, '')
                .replace(/\s+to\s+taste$/i, '')
                .replace(/\s*\([^)]*\)/g, '')
                .replace(/\s+/g, ' ') // Normalize multiple spaces to single space
                .trim();

              // Normalize to singular form for combining
              let singularIngredient = ingredient.toLowerCase();

              // Singularize ingredient name for combining similar items
              if (singularIngredient.endsWith('olives')) {
                singularIngredient = singularIngredient.slice(0, -1); // olives -> olive
              } else if (singularIngredient.endsWith('ves')) {
                singularIngredient = singularIngredient.slice(0, -3) + 'f'; // leaves -> leaf
              } else if (singularIngredient.endsWith('ies')) {
                singularIngredient = singularIngredient.slice(0, -3) + 'y'; // berries -> berry
              } else if (singularIngredient.endsWith('oes')) {
                singularIngredient = singularIngredient.slice(0, -2); // tomatoes -> tomato
              } else if (singularIngredient.endsWith('sses')) {
                // Keep as is (grasses -> grasses)
              } else if (singularIngredient.endsWith('s') && !singularIngredient.endsWith('ss')) {
                singularIngredient = singularIngredient.slice(0, -1); // eggs -> egg
              }

              // Create unique key for combining - GROUP BY INGREDIENT NAME ONLY (not unit)
              const key = singularIngredient;

              if (!ingredientsMap[key]) {
                ingredientsMap[key] = { ingredient: singularIngredient, entries: [] };
              }
              ingredientsMap[key].entries.push({ quantity, unit: normalizedUnit });
            } else if (fullText.trim()) {
              // Fallback for unparseable items
              const lower = fullText.toLowerCase();
              if (!ingredientsMap[lower]) {
                ingredientsMap[lower] = { ingredient: lower, entries: [] };
              }
              ingredientsMap[lower].entries.push({ quantity: 1, unit: '' });
            }
          });
        }
      });
    });

    // Helper: combine entries and generate smart display
    const combineEntries = (ingredient, entries) => {
      // Separate by unit type
      const countEntries = entries.filter(e => !e.unit || unitTypes[e.unit] === 'count');
      const weightEntries = entries.filter(e => unitTypes[e.unit] === 'weight');
      const volumeEntries = entries.filter(e => unitTypes[e.unit] === 'volume');

      // Sum within same unit type
      const countTotal = countEntries.reduce((sum, e) => sum + (e.quantity || 1), 0);
      const weightTotal = weightEntries.reduce((sum, e) => sum + toGrams(e.quantity, e.unit), 0);
      const volumeTotal = volumeEntries.reduce((sum, e) => sum + toMl(e.quantity, e.unit), 0);

      // Generate hint based on ingredient weight data
      let hint = null;
      const avgWeight = ingredientWeights[ingredient.toLowerCase()];

      if (countTotal > 0 && weightTotal > 0 && avgWeight) {
        // Both count and weight exist - provide conversion hint
        const estimatedFromWeight = Math.ceil(weightTotal / avgWeight);
        const totalEstimate = Math.round(countTotal) + estimatedFromWeight;
        hint = `≈${totalEstimate} total`;
      } else if (weightTotal > 0 && avgWeight && countTotal === 0) {
        // Only weight - convert to pieces
        const estimated = Math.ceil(weightTotal / avgWeight);
        hint = `≈${estimated} pcs`;
      }

      return {
        ingredient,
        countTotal: Math.round(countTotal * 100) / 100,
        weightTotal,
        volumeTotal,
        hint
      };
    };

    // Process all ingredients through combineEntries
    const processedIngredients = {};
    Object.entries(ingredientsMap).forEach(([key, data]) => {
      processedIngredients[key] = combineEntries(data.ingredient, data.entries);
    });

    // Comprehensive ingredient categorization
    const categories = {
      'Produce': [
        // Vegetables
        'tomato', 'onion', 'garlic', 'lettuce', 'cucumber', 'carrot', 'celery', 'bell pepper', 'pepper',
        'potato', 'sweet potato', 'broccoli', 'cauliflower', 'cabbage', 'spinach', 'kale', 'arugula',
        'zucchini', 'squash', 'eggplant', 'mushroom', 'corn', 'pea', 'bean', 'asparagus', 'avocado',
        'radish', 'beet', 'turnip', 'leek', 'shallot', 'scallion', 'spring onion', 'green onion',
        'cherry tomato', 'roma tomato', 'red onion', 'white onion', 'yellow onion', 'romaine lettuce',
        'iceberg lettuce', 'mixed green', 'mixed vegetable', 'kalamata olive', 'olive', 'jalapeño',
        'chili', 'habanero', 'serrano', 'poblano', 'green bean', 'snap pea', 'edamame',
        // Fruits
        'banana', 'apple', 'orange', 'lemon', 'lime', 'strawberry', 'blueberry', 'raspberry',
        'blackberry', 'grape', 'watermelon', 'melon', 'cantaloupe', 'pineapple', 'mango', 'papaya',
        'peach', 'plum', 'pear', 'cherry', 'kiwi', 'coconut', 'pomegranate', 'fig', 'date',
        // Herbs
        'cilantro', 'parsley', 'basil', 'mint', 'oregano', 'thyme', 'rosemary', 'sage', 'dill',
        'chive', 'tarragon', 'bay leaf', 'coriander leaf', 'ginger', 'lemongrass', 'bay'
      ],
      'Proteins': [
        // Poultry
        'chicken', 'chicken breast', 'chicken thigh', 'chicken wing', 'chicken leg', 'turkey',
        'duck', 'quail',
        // Meat
        'beef', 'pork', 'lamb', 'veal', 'bacon', 'sausage', 'ham', 'ground beef', 'ground pork',
        'steak', 'ribeye', 'sirloin', 'brisket', 'short rib', 'pork chop', 'pork belly',
        // Seafood
        'fish', 'salmon', 'tuna', 'cod', 'tilapia', 'halibut', 'trout', 'sardine', 'anchovy',
        'anchovy fillet', 'shrimp', 'prawn', 'lobster', 'crab', 'scallop', 'mussel', 'clam', 'oyster',
        'squid', 'octopus', 'calamari',
        // Eggs & Plant-Based
        'egg', 'tofu', 'tempeh', 'seitan', 'edamame'
      ],
      'Dairy': [
        'milk', 'whole milk', 'skim milk', '2% milk', 'almond milk', 'soy milk', 'oat milk',
        'coconut milk', 'heavy cream', 'whipping cream', 'half and half', 'cream',
        'butter', 'unsalted butter', 'salted butter', 'ghee', 'margarine', 'melted butter',
        'cheese', 'cheddar cheese', 'mozzarella', 'parmesan cheese', 'feta cheese', 'goat cheese',
        'cream cheese', 'ricotta', 'cottage cheese', 'swiss cheese', 'provolone', 'brie',
        'blue cheese', 'gorgonzola', 'gouda', 'monterey jack', 'pepper jack', 'shredded cheese',
        'yogurt', 'greek yogurt', 'sour cream', 'crème fraîche', 'mascarpone'
      ],
      'Pantry Staples': [
        // Grains & Flour
        'flour', 'all-purpose flour', 'bread flour', 'cake flour', 'whole wheat flour', 'almond flour',
        'coconut flour', 'cornmeal', 'cornstarch', 'rice', 'white rice', 'brown rice', 'basmati rice',
        'jasmine rice', 'wild rice', 'arborio rice', 'quinoa', 'couscous', 'bulgur', 'farro', 'barley',
        'oat', 'rolled oat', 'steel cut oat', 'oatmeal',
        // Pasta & Noodles
        'pasta', 'spaghetti', 'penne', 'rigatoni', 'macaroni', 'linguine', 'fettuccine', 'lasagna',
        'angel hair', 'ravioli', 'tortellini', 'noodle', 'ramen', 'udon', 'soba', 'rice noodle',
        'vermicelli',
        // Beans & Legumes
        'black bean', 'kidney bean', 'pinto bean', 'chickpea', 'garbanzo bean', 'lentil',
        'split pea', 'navy bean', 'cannellini bean', 'lima bean',
        // Sugar & Sweeteners
        'sugar', 'granulated sugar', 'white sugar', 'brown sugar', 'powdered sugar', 'confectioner sugar',
        'honey', 'maple syrup', 'agave', 'molasses', 'corn syrup',
        // Baking
        'baking powder', 'baking soda', 'yeast', 'active dry yeast', 'instant yeast', 'vanilla extract',
        'almond extract', 'cocoa powder', 'chocolate chip', 'chocolate', 'dark chocolate',
        'milk chocolate', 'white chocolate', 'baking chocolate',
        // Nuts & Seeds
        'almond', 'walnut', 'pecan', 'cashew', 'peanut', 'pistachio', 'hazelnut', 'macadamia',
        'pine nut', 'sesame seed', 'sunflower seed', 'pumpkin seed', 'chia seed', 'flax seed',
        'poppy seed', 'peanut butter', 'almond butter', 'tahini',
        // Canned Goods
        'tomato sauce', 'tomato paste', 'crushed tomato', 'diced tomato', 'tomato puree',
        'chicken broth', 'beef broth', 'vegetable broth', 'stock', 'coconut cream'
      ],
      'Oils & Vinegars': [
        'oil', 'olive oil', 'extra virgin olive oil', 'vegetable oil', 'canola oil', 'coconut oil',
        'sesame oil', 'peanut oil', 'avocado oil', 'grapeseed oil', 'sunflower oil', 'corn oil',
        'vinegar', 'white vinegar', 'apple cider vinegar', 'balsamic vinegar', 'red wine vinegar',
        'white wine vinegar', 'rice vinegar', 'sherry vinegar'
      ],
      'Condiments & Sauces': [
        'ketchup', 'mustard', 'mayonnaise', 'mayo', 'relish', 'pickle', 'hot sauce', 'tabasco',
        'sriracha', 'salsa', 'guacamole', 'hummus', 'pesto', 'marinara', 'alfredo',
        'soy sauce', 'tamari', 'teriyaki sauce', 'worcestershire sauce', 'fish sauce', 'oyster sauce',
        'hoisin sauce', 'bbq sauce', 'ranch', 'caesar dressing', 'italian dressing', 'vinaigrette',
        'blue cheese dressing', 'thousand island', 'honey mustard', 'tahini sauce'
      ],
      'Spices & Seasonings': [
        'salt', 'sea salt', 'kosher salt', 'pepper', 'black pepper', 'white pepper', 'cayenne',
        'paprika', 'cumin', 'coriander', 'turmeric', 'curry powder', 'garam masala', 'chili powder',
        'red pepper flake', 'crushed red pepper', 'garlic powder', 'onion powder', 'ginger powder',
        'cinnamon', 'nutmeg', 'clove', 'allspice', 'cardamom', 'star anise', 'fennel seed',
        'mustard seed', 'celery seed', 'caraway seed', 'italian seasoning', 'herbs de provence',
        'taco seasoning', 'fajita seasoning', 'cajun seasoning', 'old bay', 'everything bagel seasoning'
      ],
      'Bread & Bakery': [
        'bread', 'white bread', 'wheat bread', 'whole grain bread', 'sourdough', 'baguette',
        'ciabatta', 'pita', 'naan', 'tortilla', 'flour tortilla', 'corn tortilla', 'taco shell',
        'tortilla chip', 'bagel', 'english muffin', 'croissant', 'roll', 'dinner roll', 'bun',
        'hamburger bun', 'hot dog bun', 'slider bun', 'crouton', 'breadcrumb', 'panko'
      ],
      'Frozen Foods': [
        'ice cream', 'frozen yogurt', 'sorbet', 'ice', 'ice cube', 'frozen vegetable',
        'frozen fruit', 'frozen berry', 'frozen pea', 'frozen corn', 'frozen pizza', 'frozen waffle'
      ],
      'Beverages': [
        'water', 'sparkling water', 'soda', 'juice', 'orange juice', 'apple juice', 'cranberry juice',
        'coffee', 'tea', 'green tea', 'black tea', 'herbal tea', 'wine', 'red wine', 'white wine',
        'beer', 'sake', 'rum', 'vodka', 'whiskey', 'bourbon', 'gin', 'tequila', 'brandy'
      ],
      'Other': []
    };

    const categorizedList = {};
    Object.keys(categories).forEach(cat => categorizedList[cat] = []);

    // Format and categorize items using processedIngredients
    Object.entries(processedIngredients).forEach(([key, data]) => {
      const ing = data.ingredient;

      // Pluralize ingredient if needed based on count
      let displayIng = ing;
      const massNouns = ['flour', 'sugar', 'rice', 'milk', 'butter', 'oil', 'salt', 'pepper', 'water', 'cheese', 'honey', 'yogurt', 'bread', 'ice'];
      const isMassNoun = massNouns.some(noun => ing.includes(noun));

      if (data.countTotal > 1 && !isMassNoun && data.weightTotal === 0 && data.volumeTotal === 0) {
        if (ing.endsWith('f')) {
          displayIng = ing.slice(0, -1) + 'ves'; // leaf -> leaves
        } else if (ing.endsWith('y') && !ing.endsWith('ay') && !ing.endsWith('ey')) {
          displayIng = ing.slice(0, -1) + 'ies'; // berry -> berries
        } else if (ing.endsWith('o')) {
          displayIng = ing + 'es'; // tomato -> tomatoes
        } else if (!ing.endsWith('s')) {
          displayIng = ing + 's';
        }
      }

      // Capitalize ingredient name
      displayIng = displayIng.charAt(0).toUpperCase() + displayIng.slice(1);

      // Find category
      let foundCategory = 'Other';
      for (const [cat, items] of Object.entries(categories)) {
        if (items.some(item => ing.includes(item) || item.includes(ing))) {
          foundCategory = cat;
          break;
        }
      }

      // Build display string for quantity
      let displayParts = [];
      if (data.countTotal > 0) {
        displayParts.push(`${data.countTotal}${data.countTotal === 1 ? '' : ''}`);
      }
      if (data.weightTotal > 0) {
        displayParts.push(formatWeight(data.weightTotal));
      }
      if (data.volumeTotal > 0) {
        displayParts.push(formatVolume(data.volumeTotal));
      }

      categorizedList[foundCategory].push({
        countTotal: data.countTotal,
        weightTotal: data.weightTotal,
        volumeTotal: data.volumeTotal,
        displayQuantity: displayParts.join(' + '),
        hint: data.hint,
        ingredient: displayIng,
        count: 1,
        checked: false,
      });
    });

    // Build final list with category headers
    const finalList = [];
    Object.keys(categories).forEach(category => {
      if (categorizedList[category].length > 0) {
        // Add category header
        finalList.push({
          item: category,
          count: 1,
          checked: false,
          isHeader: true,
        });
        // Sort and add items
        categorizedList[category].sort((a, b) => a.ingredient.localeCompare(b.ingredient));
        finalList.push(...categorizedList[category]);
      }
    });

    setShoppingList(finalList);
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
                recipes={filteredRecipes}
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

          {currentView === "library" && (
            <motion.div
              key="library"
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -10 }}
              transition={{ duration: 0.2 }}
            >
              <RecipeLibrary />
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
          <ShoppingListView shoppingList={shoppingList} setShoppingList={setShoppingList} />
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
          onClose={() => setShowSettings(false)}
          randomizerMode={randomizerMode}
          setRandomizerMode={setRandomizerMode}
        />
      )}
    </div>
  );
};

export default RecipeManager;
