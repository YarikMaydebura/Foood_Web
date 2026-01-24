import { useState, useEffect, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import { motion, AnimatePresence } from 'framer-motion';
import {
  Search,
  Filter,
  X,
  Clock,
  Users,
  ChefHat,
  Flame,
  Plus,
  Heart,
  ChevronDown,
  Loader2
} from 'lucide-react';

const API_BASE_URL = import.meta.env.VITE_API_BASE_URL ?? "http://127.0.0.1:8000";

// Filter pill component
function FilterPill({ label, isActive, onClick, onRemove }) {
  return (
    <button
      onClick={onClick}
      className={`inline-flex items-center gap-1 px-3 py-1.5 rounded-full text-sm font-medium transition-all ${
        isActive
          ? 'bg-orange-500 text-white'
          : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
      }`}
    >
      {label}
      {isActive && onRemove && (
        <X
          className="w-3 h-3 ml-1"
          onClick={(e) => {
            e.stopPropagation();
            onRemove();
          }}
        />
      )}
    </button>
  );
}

// Recipe card component
function RecipeCard({ recipe, isSaved, onAddToCollection }) {
  const navigate = useNavigate();
  const [isHovered, setIsHovered] = useState(false);
  const [adding, setAdding] = useState(false);

  const handleAddToCollection = async (e) => {
    e.stopPropagation();
    setAdding(true);
    try {
      await onAddToCollection(recipe.id);
    } finally {
      setAdding(false);
    }
  };

  const getDifficultyColor = (difficulty) => {
    switch (difficulty) {
      case 'easy': return 'bg-green-100 text-green-700';
      case 'medium': return 'bg-yellow-100 text-yellow-700';
      case 'hard': return 'bg-red-100 text-red-700';
      default: return 'bg-gray-100 text-gray-700';
    }
  };

  const totalTime = (recipe.prep_time_minutes || 0) + (recipe.cook_time_minutes || 0);

  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      exit={{ opacity: 0, y: -20 }}
      whileHover={{ y: -4 }}
      className="bg-white rounded-2xl shadow-sm hover:shadow-lg transition-all duration-300 overflow-hidden cursor-pointer group"
      onClick={() => navigate(`/recipe/${recipe.slug}`)}
      onMouseEnter={() => setIsHovered(true)}
      onMouseLeave={() => setIsHovered(false)}
    >
      {/* Image */}
      <div className="relative h-48 overflow-hidden">
        <img
          src={recipe.image_url || 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400'}
          alt={recipe.title}
          className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
        />
        <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent" />

        {/* Category Badge */}
        {recipe.category && recipe.category !== 'meal' && (
          <span className="absolute top-3 left-3 px-2 py-1 bg-purple-500 text-white text-xs font-medium rounded-full">
            {recipe.category.charAt(0).toUpperCase() + recipe.category.slice(1)}
          </span>
        )}

        {/* Add to Collection Button */}
        <AnimatePresence>
          {(isHovered || isSaved) && (
            <motion.button
              initial={{ opacity: 0, scale: 0.8 }}
              animate={{ opacity: 1, scale: 1 }}
              exit={{ opacity: 0, scale: 0.8 }}
              onClick={handleAddToCollection}
              disabled={adding || isSaved}
              className={`absolute top-3 right-3 p-2 backdrop-blur-sm rounded-full transition-colors shadow-lg ${
                isSaved
                  ? 'bg-orange-500 text-white cursor-default'
                  : 'bg-white/90 text-orange-500 hover:bg-white hover:text-orange-600'
              }`}
              title={isSaved ? "Saved to My Recipes" : "Add to My Recipes"}
            >
              {adding ? (
                <Loader2 className="w-5 h-5 animate-spin" />
              ) : (
                <Heart className="w-5 h-5" fill={isSaved ? "currentColor" : "none"} />
              )}
            </motion.button>
          )}
        </AnimatePresence>

        {/* Quick Info */}
        <div className="absolute bottom-3 left-3 right-3 flex items-center gap-3">
          {totalTime > 0 && (
            <span className="flex items-center gap-1 text-white text-xs">
              <Clock className="w-3 h-3" />
              {totalTime}m
            </span>
          )}
          {recipe.servings && (
            <span className="flex items-center gap-1 text-white text-xs">
              <Users className="w-3 h-3" />
              {recipe.servings}
            </span>
          )}
          {recipe.calories && (
            <span className="flex items-center gap-1 text-white text-xs">
              <Flame className="w-3 h-3" />
              {recipe.calories} cal
            </span>
          )}
        </div>
      </div>

      {/* Content */}
      <div className="p-4">
        <div className="flex items-start justify-between gap-2 mb-2">
          <h3 className="font-semibold text-gray-900 group-hover:text-orange-600 transition-colors line-clamp-1">
            {recipe.title}
          </h3>
        </div>

        {recipe.description && (
          <p className="text-sm text-gray-500 line-clamp-2 mb-3">
            {recipe.description}
          </p>
        )}

        <div className="flex items-center gap-2 flex-wrap">
          {recipe.cuisine && (
            <span className="px-2 py-1 bg-orange-50 text-orange-700 text-xs font-medium rounded-full">
              {recipe.cuisine}
            </span>
          )}
          {recipe.difficulty && (
            <span className={`px-2 py-1 text-xs font-medium rounded-full ${getDifficultyColor(recipe.difficulty)}`}>
              {recipe.difficulty.charAt(0).toUpperCase() + recipe.difficulty.slice(1)}
            </span>
          )}
        </div>
      </div>
    </motion.div>
  );
}

export default function RecipeLibrary() {
  const navigate = useNavigate();
  const [recipes, setRecipes] = useState([]);
  const [loading, setLoading] = useState(true);
  const [loadingMore, setLoadingMore] = useState(false);
  const [error, setError] = useState(null);

  // Filter states
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedCuisine, setSelectedCuisine] = useState('');
  const [selectedCategory, setSelectedCategory] = useState('');
  const [selectedDifficulty, setSelectedDifficulty] = useState('');
  const [showFilters, setShowFilters] = useState(false);

  // Pagination
  const [page, setPage] = useState(1);
  const [hasMore, setHasMore] = useState(true);
  const [total, setTotal] = useState(0);

  // Saved recipes tracking
  const [savedRecipeIds, setSavedRecipeIds] = useState(new Set());

  // Available options
  const [cuisines, setCuisines] = useState([]);
  const [categories] = useState(['meal', 'drink', 'snack', 'dessert']);
  const difficulties = ['easy', 'medium', 'hard'];

  // Fetch cuisines
  useEffect(() => {
    fetch(`${API_BASE_URL}/library/cuisines`)
      .then(res => res.json())
      .then(data => setCuisines(data.cuisines || []))
      .catch(console.error);
  }, []);

  // Fetch recipes
  const fetchRecipes = useCallback(async (reset = false) => {
    try {
      if (reset) {
        setLoading(true);
        setPage(1);
      } else {
        setLoadingMore(true);
      }

      const params = new URLSearchParams({
        offset: reset ? 0 : (page - 1) * 12,
        limit: 12
      });

      if (searchQuery) params.append('search', searchQuery);
      if (selectedCuisine) params.append('cuisine', selectedCuisine);
      if (selectedCategory) params.append('category', selectedCategory);
      if (selectedDifficulty) params.append('difficulty', selectedDifficulty);

      const response = await fetch(`${API_BASE_URL}/library/recipes?${params}`);
      const data = await response.json();

      if (reset) {
        setRecipes(data.items || []);
        // Build set of saved recipe IDs
        const savedIds = new Set(
          (data.items || []).filter(r => r.is_saved).map(r => r.id)
        );
        setSavedRecipeIds(savedIds);
      } else {
        setRecipes(prev => [...prev, ...(data.items || [])]);
        // Add new saved IDs to existing set
        const newSavedIds = (data.items || []).filter(r => r.is_saved).map(r => r.id);
        setSavedRecipeIds(prev => new Set([...prev, ...newSavedIds]));
      }

      setTotal(data.total || 0);
      setHasMore((data.items?.length || 0) === 12);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
      setLoadingMore(false);
    }
  }, [page, searchQuery, selectedCuisine, selectedCategory, selectedDifficulty]);

  // Initial fetch and filter changes
  useEffect(() => {
    fetchRecipes(true);
  }, [searchQuery, selectedCuisine, selectedCategory, selectedDifficulty]);

  // Load more
  const loadMore = () => {
    if (!loadingMore && hasMore) {
      setPage(prev => prev + 1);
      fetchRecipes(false);
    }
  };

  // Add to collection
  const handleAddToCollection = async (recipeId) => {
    const token = localStorage.getItem('authToken');
    if (!token) {
      navigate('/auth/login');
      return;
    }

    try {
      const response = await fetch(`${API_BASE_URL}/library/recipes/${recipeId}/add-to-collection`, {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${token}`
        }
      });

      if (response.ok) {
        // Update local saved state
        setSavedRecipeIds(prev => new Set([...prev, recipeId]));
      }
    } catch (err) {
      console.error('Error adding to collection:', err);
    }
  };

  // Clear all filters
  const clearFilters = () => {
    setSearchQuery('');
    setSelectedCuisine('');
    setSelectedCategory('');
    setSelectedDifficulty('');
  };

  const hasActiveFilters = searchQuery || selectedCuisine || selectedCategory || selectedDifficulty;

  return (
    <div className="min-h-screen bg-gradient-to-br from-orange-50 to-amber-50">
      {/* Header */}
      <div className="bg-white border-b border-gray-200 sticky top-0 z-20">
        <div className="max-w-7xl mx-auto px-4 py-4">
          {/* Search Bar */}
          <div className="flex items-center gap-4">
            <div className="flex-1 relative">
              <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400" />
              <input
                type="text"
                placeholder="Search recipes..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="w-full pl-12 pr-4 py-3 bg-gray-100 border-0 rounded-xl focus:ring-2 focus:ring-orange-500 focus:bg-white transition-all"
              />
            </div>
            <button
              onClick={() => setShowFilters(!showFilters)}
              className={`flex items-center gap-2 px-4 py-3 rounded-xl font-medium transition-colors ${
                showFilters || hasActiveFilters
                  ? 'bg-orange-500 text-white'
                  : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
              }`}
            >
              <Filter className="w-5 h-5" />
              Filters
              {hasActiveFilters && (
                <span className="w-2 h-2 bg-white rounded-full" />
              )}
            </button>
          </div>

          {/* Filters Panel */}
          <AnimatePresence>
            {showFilters && (
              <motion.div
                initial={{ height: 0, opacity: 0 }}
                animate={{ height: 'auto', opacity: 1 }}
                exit={{ height: 0, opacity: 0 }}
                className="overflow-hidden"
              >
                <div className="pt-4 pb-2 space-y-4">
                  {/* Cuisine */}
                  <div>
                    <label className="text-sm font-medium text-gray-700 mb-2 block">Cuisine</label>
                    <div className="flex flex-wrap gap-2">
                      {cuisines.map(cuisine => (
                        <FilterPill
                          key={cuisine}
                          label={cuisine}
                          isActive={selectedCuisine === cuisine}
                          onClick={() => setSelectedCuisine(selectedCuisine === cuisine ? '' : cuisine)}
                          onRemove={() => setSelectedCuisine('')}
                        />
                      ))}
                    </div>
                  </div>

                  {/* Category */}
                  <div>
                    <label className="text-sm font-medium text-gray-700 mb-2 block">Category</label>
                    <div className="flex flex-wrap gap-2">
                      {categories.map(category => (
                        <FilterPill
                          key={category}
                          label={category.charAt(0).toUpperCase() + category.slice(1)}
                          isActive={selectedCategory === category}
                          onClick={() => setSelectedCategory(selectedCategory === category ? '' : category)}
                          onRemove={() => setSelectedCategory('')}
                        />
                      ))}
                    </div>
                  </div>

                  {/* Difficulty */}
                  <div>
                    <label className="text-sm font-medium text-gray-700 mb-2 block">Difficulty</label>
                    <div className="flex flex-wrap gap-2">
                      {difficulties.map(difficulty => (
                        <FilterPill
                          key={difficulty}
                          label={difficulty.charAt(0).toUpperCase() + difficulty.slice(1)}
                          isActive={selectedDifficulty === difficulty}
                          onClick={() => setSelectedDifficulty(selectedDifficulty === difficulty ? '' : difficulty)}
                          onRemove={() => setSelectedDifficulty('')}
                        />
                      ))}
                    </div>
                  </div>

                  {/* Clear Filters */}
                  {hasActiveFilters && (
                    <button
                      onClick={clearFilters}
                      className="text-sm text-orange-600 hover:text-orange-700 font-medium"
                    >
                      Clear all filters
                    </button>
                  )}
                </div>
              </motion.div>
            )}
          </AnimatePresence>
        </div>
      </div>

      {/* Content */}
      <div className="max-w-7xl mx-auto px-4 py-8">
        {/* Results Count */}
        <div className="flex items-center justify-between mb-6">
          <p className="text-gray-600">
            {total} recipes found
            {hasActiveFilters && (
              <button
                onClick={clearFilters}
                className="ml-2 text-orange-600 hover:text-orange-700"
              >
                Clear filters
              </button>
            )}
          </p>
        </div>

        {/* Loading State */}
        {loading ? (
          <div className="flex items-center justify-center py-20">
            <div className="w-12 h-12 border-4 border-orange-500/30 border-t-orange-500 rounded-full animate-spin" />
          </div>
        ) : error ? (
          <div className="text-center py-20">
            <p className="text-gray-500">{error}</p>
          </div>
        ) : recipes.length === 0 ? (
          <div className="text-center py-20">
            <ChefHat className="w-16 h-16 text-gray-300 mx-auto mb-4" />
            <h3 className="text-xl font-semibold text-gray-900 mb-2">No recipes found</h3>
            <p className="text-gray-500 mb-4">Try adjusting your filters or search query</p>
            {hasActiveFilters && (
              <button
                onClick={clearFilters}
                className="px-4 py-2 bg-orange-500 text-white rounded-lg hover:bg-orange-600 transition-colors"
              >
                Clear Filters
              </button>
            )}
          </div>
        ) : (
          <>
            {/* Recipe Grid */}
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
              {recipes.map(recipe => (
                <RecipeCard
                  key={recipe.id}
                  recipe={recipe}
                  isSaved={savedRecipeIds.has(recipe.id)}
                  onAddToCollection={handleAddToCollection}
                />
              ))}
            </div>

            {/* Load More */}
            {hasMore && (
              <div className="text-center mt-8">
                <button
                  onClick={loadMore}
                  disabled={loadingMore}
                  className="inline-flex items-center gap-2 px-6 py-3 bg-white border border-gray-200 rounded-xl text-gray-700 font-medium hover:bg-gray-50 transition-colors disabled:opacity-50"
                >
                  {loadingMore ? (
                    <>
                      <Loader2 className="w-5 h-5 animate-spin" />
                      Loading...
                    </>
                  ) : (
                    <>
                      <ChevronDown className="w-5 h-5" />
                      Load More
                    </>
                  )}
                </button>
              </div>
            )}
          </>
        )}
      </div>
    </div>
  );
}
