import { useState, useEffect } from 'react';
import { useParams, useNavigate, Link } from 'react-router-dom';
import { motion } from 'framer-motion';
import {
  ArrowLeft,
  Clock,
  Users,
  ChefHat,
  Share2,
  Heart,
  Plus,
  Check,
  Flame,
  Beef,
  Wheat,
  Droplets,
  Copy,
  X,
  Calendar
} from 'lucide-react';

const API_BASE_URL = import.meta.env.VITE_API_BASE_URL ?? "http://127.0.0.1:8000";

const DAY_NAME_TO_INDEX = {
  monday: 0,
  tuesday: 1,
  wednesday: 2,
  thursday: 3,
  friday: 4,
  saturday: 5,
  sunday: 6,
};

function currentWeekMonday() {
  const today = new Date();
  const dayOfWeek = today.getDay(); // 0=Sun..6=Sat
  const offsetToMonday = dayOfWeek === 0 ? -6 : 1 - dayOfWeek;
  const monday = new Date(today);
  monday.setDate(today.getDate() + offsetToMonday);
  const yyyy = monday.getFullYear();
  const mm = String(monday.getMonth() + 1).padStart(2, '0');
  const dd = String(monday.getDate()).padStart(2, '0');
  return `${yyyy}-${mm}-${dd}`;
}

// Nutrition info card component
function NutritionCard({ icon: Icon, label, value, unit, color }) {
  return (
    <div className={`bg-white/90 backdrop-blur-sm rounded-xl p-4 shadow-sm border border-gray-100`}>
      <div className={`w-10 h-10 rounded-full ${color} flex items-center justify-center mb-2`}>
        <Icon className="w-5 h-5 text-white" />
      </div>
      <p className="text-2xl font-bold text-gray-900">{value}<span className="text-sm font-normal text-gray-500 ml-1">{unit}</span></p>
      <p className="text-sm text-gray-500">{label}</p>
    </div>
  );
}

// Add to Meal Plan Modal
function AddToMealPlanModal({ isOpen, onClose, recipe, onAdd }) {
  const [selectedDay, setSelectedDay] = useState('monday');
  const [selectedMeal, setSelectedMeal] = useState('Dinner');
  const [loading, setLoading] = useState(false);
  const [success, setSuccess] = useState(false);
  const [errorMessage, setErrorMessage] = useState('');

  const days = [
    { value: 'monday', label: 'Monday' },
    { value: 'tuesday', label: 'Tuesday' },
    { value: 'wednesday', label: 'Wednesday' },
    { value: 'thursday', label: 'Thursday' },
    { value: 'friday', label: 'Friday' },
    { value: 'saturday', label: 'Saturday' },
    { value: 'sunday', label: 'Sunday' }
  ];

  const meals = [
    { value: 'Breakfast',        label: 'Breakfast' },
    { value: 'Lunch',            label: 'Lunch' },
    { value: 'Dinner',           label: 'Dinner' },
    { value: 'Dessert/Snacking', label: 'Dessert / Snacking' }
  ];

  const handleSubmit = async () => {
    setLoading(true);
    setErrorMessage('');
    try {
      await onAdd(selectedDay, selectedMeal);
      setSuccess(true);
      setTimeout(() => {
        onClose();
        setSuccess(false);
      }, 1500);
    } catch (error) {
      setErrorMessage(error.message || 'Failed to add to meal plan');
    } finally {
      setLoading(false);
    }
  };

  if (!isOpen) return null;

  return (
    <motion.div
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0 }}
      className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4"
      onClick={onClose}
    >
      <motion.div
        initial={{ scale: 0.9, opacity: 0 }}
        animate={{ scale: 1, opacity: 1 }}
        exit={{ scale: 0.9, opacity: 0 }}
        className="bg-white rounded-2xl shadow-xl max-w-md w-full p-6"
        onClick={e => e.stopPropagation()}
      >
        {success ? (
          <div className="text-center py-8">
            <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
              <Check className="w-8 h-8 text-green-600" />
            </div>
            <h3 className="text-xl font-semibold text-gray-900">Added to Meal Plan!</h3>
            <p className="text-gray-500 mt-2">
              {recipe?.title} added to {selectedDay}'s {selectedMeal}
            </p>
          </div>
        ) : (
          <>
            <div className="flex items-center justify-between mb-6">
              <h3 className="text-xl font-semibold text-gray-900">Add to Meal Plan</h3>
              <button
                onClick={onClose}
                className="p-2 hover:bg-gray-100 rounded-full transition-colors"
              >
                <X className="w-5 h-5" />
              </button>
            </div>

            <div className="flex items-center gap-4 mb-6 p-4 bg-orange-50 rounded-xl">
              <img
                src={recipe?.image_url || 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=100'}
                alt={recipe?.title}
                className="w-16 h-16 rounded-lg object-cover"
              />
              <div>
                <h4 className="font-medium text-gray-900">{recipe?.title}</h4>
                <p className="text-sm text-gray-500">{recipe?.cuisine}</p>
              </div>
            </div>

            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Select Day
                </label>
                <div className="grid grid-cols-4 gap-2">
                  {days.map(day => (
                    <button
                      key={day.value}
                      onClick={() => setSelectedDay(day.value)}
                      className={`px-3 py-2 rounded-lg text-sm font-medium transition-colors ${
                        selectedDay === day.value
                          ? 'bg-orange-500 text-white'
                          : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                      }`}
                    >
                      {day.label.slice(0, 3)}
                    </button>
                  ))}
                </div>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Select Meal
                </label>
                <div className="grid grid-cols-4 gap-2">
                  {meals.map(meal => (
                    <button
                      key={meal.value}
                      onClick={() => setSelectedMeal(meal.value)}
                      className={`px-3 py-2 rounded-lg text-sm font-medium transition-colors ${
                        selectedMeal === meal.value
                          ? 'bg-orange-500 text-white'
                          : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                      }`}
                    >
                      {meal.label}
                    </button>
                  ))}
                </div>
              </div>
            </div>

            {errorMessage && (
              <div className="mt-4 px-4 py-3 bg-red-50 border border-red-200 rounded-xl text-sm text-red-700">
                {errorMessage}
              </div>
            )}

            <button
              onClick={handleSubmit}
              disabled={loading}
              className="w-full mt-6 bg-gradient-to-r from-orange-500 to-orange-600 text-white py-3 rounded-xl font-medium hover:from-orange-600 hover:to-orange-700 transition-all disabled:opacity-50 flex items-center justify-center gap-2"
            >
              {loading ? (
                <div className="w-5 h-5 border-2 border-white/30 border-t-white rounded-full animate-spin" />
              ) : (
                <>
                  <Calendar className="w-5 h-5" />
                  Add to {selectedDay}'s {selectedMeal}
                </>
              )}
            </button>
          </>
        )}
      </motion.div>
    </motion.div>
  );
}

// Share Modal
function ShareModal({ isOpen, onClose, recipe }) {
  const [copied, setCopied] = useState(false);
  const shareUrl = window.location.href;

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(shareUrl);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    } catch (err) {
      console.error('Failed to copy:', err);
    }
  };

  if (!isOpen) return null;

  return (
    <motion.div
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0 }}
      className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4"
      onClick={onClose}
    >
      <motion.div
        initial={{ scale: 0.9, opacity: 0 }}
        animate={{ scale: 1, opacity: 1 }}
        exit={{ scale: 0.9, opacity: 0 }}
        className="bg-white rounded-2xl shadow-xl max-w-md w-full p-6"
        onClick={e => e.stopPropagation()}
      >
        <div className="flex items-center justify-between mb-6">
          <h3 className="text-xl font-semibold text-gray-900">Share Recipe</h3>
          <button
            onClick={onClose}
            className="p-2 hover:bg-gray-100 rounded-full transition-colors"
          >
            <X className="w-5 h-5" />
          </button>
        </div>

        <div className="flex items-center gap-3 p-3 bg-gray-100 rounded-xl">
          <input
            type="text"
            value={shareUrl}
            readOnly
            className="flex-1 bg-transparent text-sm text-gray-600 outline-none"
          />
          <button
            onClick={handleCopy}
            className="flex items-center gap-2 px-4 py-2 bg-orange-500 text-white rounded-lg hover:bg-orange-600 transition-colors"
          >
            {copied ? <Check className="w-4 h-4" /> : <Copy className="w-4 h-4" />}
            {copied ? 'Copied!' : 'Copy'}
          </button>
        </div>
      </motion.div>
    </motion.div>
  );
}

export default function RecipeDetailPage() {
  const { slug } = useParams();
  const navigate = useNavigate();
  const [recipe, setRecipe] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [checkedIngredients, setCheckedIngredients] = useState(new Set());
  const [showMealPlanModal, setShowMealPlanModal] = useState(false);
  const [showShareModal, setShowShareModal] = useState(false);
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [isSaved, setIsSaved] = useState(false);
  const [savePending, setSavePending] = useState(false);
  const [toast, setToast] = useState(null);

  useEffect(() => {
    const token = localStorage.getItem('authToken');
    setIsAuthenticated(!!token);
    fetchRecipe();
  }, [slug]);

  // Once we know the recipe id + auth, check if this recipe is already saved.
  useEffect(() => {
    if (!isAuthenticated || !recipe?.id) return;
    const token = localStorage.getItem('authToken');
    fetch(`${API_BASE_URL}/library/saved`, {
      headers: { 'Authorization': `Bearer ${token}` },
    })
      .then((r) => (r.ok ? r.json() : { items: [] }))
      .then((data) => {
        const ids = new Set((data.items || []).map((r) => r.id));
        setIsSaved(ids.has(recipe.id));
      })
      .catch(() => {});
  }, [isAuthenticated, recipe?.id]);

  // Auto-dismiss toast after 2.5s
  useEffect(() => {
    if (!toast) return;
    const t = setTimeout(() => setToast(null), 2500);
    return () => clearTimeout(t);
  }, [toast]);

  const fetchRecipe = async () => {
    try {
      setLoading(true);
      const response = await fetch(`${API_BASE_URL}/library/recipes/${slug}`);
      if (!response.ok) {
        throw new Error('Recipe not found');
      }
      const data = await response.json();
      setRecipe(data);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  const toggleIngredient = (index) => {
    const newChecked = new Set(checkedIngredients);
    if (newChecked.has(index)) {
      newChecked.delete(index);
    } else {
      newChecked.add(index);
    }
    setCheckedIngredients(newChecked);
  };

  const handleAddToMealPlan = async (day, meal) => {
    const token = localStorage.getItem('authToken');
    if (!token) {
      navigate('/auth/login');
      return;
    }

    const dayIndex = DAY_NAME_TO_INDEX[day];
    if (dayIndex === undefined) {
      throw new Error(`Unknown day: ${day}`);
    }

    const response = await fetch(`${API_BASE_URL}/meal-plan`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`
      },
      body: JSON.stringify({
        recipe_id: recipe.id,
        week_start_date: currentWeekMonday(),
        day_of_week: dayIndex,
        meal_slot: meal
      })
    });

    if (!response.ok) {
      const data = await response.json().catch(() => ({}));
      const detail = typeof data.detail === 'string'
        ? data.detail
        : Array.isArray(data.detail) && data.detail[0]?.msg
          ? data.detail[0].msg
          : 'Failed to add to meal plan';
      throw new Error(detail);
    }
  };

  const handleToggleSave = async () => {
    const token = localStorage.getItem('authToken');
    if (!token) {
      navigate('/auth/login');
      return;
    }
    if (savePending) return;
    setSavePending(true);

    const wasSaved = isSaved;
    // Optimistic flip so the heart reflects intent immediately.
    setIsSaved(!wasSaved);

    try {
      const url = wasSaved
        ? `${API_BASE_URL}/library/recipes/${recipe.id}/unsave`
        : `${API_BASE_URL}/library/recipes/${recipe.id}/save`;
      const response = await fetch(url, {
        method: wasSaved ? 'DELETE' : 'POST',
        headers: { 'Authorization': `Bearer ${token}` },
      });
      if (!response.ok) throw new Error('Request failed');
      setToast(wasSaved ? 'Removed from favorites' : 'Saved to favorites');
    } catch (err) {
      // Roll back the optimistic update.
      setIsSaved(wasSaved);
      setToast('Could not update favorites. Try again.');
    } finally {
      setSavePending(false);
    }
  };

  if (loading) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-orange-50 to-amber-50 flex items-center justify-center">
        <div className="w-12 h-12 border-4 border-orange-500/30 border-t-orange-500 rounded-full animate-spin" />
      </div>
    );
  }

  if (error || !recipe) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-orange-50 to-amber-50 flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold text-gray-900 mb-2">Recipe Not Found</h1>
          <p className="text-gray-500 mb-6">The recipe you're looking for doesn't exist.</p>
          <Link
            to="/"
            className="inline-flex items-center gap-2 px-6 py-3 bg-orange-500 text-white rounded-xl hover:bg-orange-600 transition-colors"
          >
            <ArrowLeft className="w-5 h-5" />
            Go Home
          </Link>
        </div>
      </div>
    );
  }

  const totalTime = (recipe.prep_time_minutes || 0) + (recipe.cook_time_minutes || 0);

  return (
    <div className="min-h-screen bg-gradient-to-br from-orange-50 to-amber-50">
      {/* Toast */}
      {toast && (
        <motion.div
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          exit={{ opacity: 0, y: -20 }}
          className="fixed top-4 left-1/2 -translate-x-1/2 z-50 px-4 py-2 bg-gray-900 text-white text-sm font-medium rounded-full shadow-lg"
        >
          {toast}
        </motion.div>
      )}

      {/* Hero Section */}
      <div className="relative h-[50vh] min-h-[400px]">
        <img
          src={recipe.image_url || 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=1200'}
          alt={recipe.title}
          className="w-full h-full object-cover"
        />
        <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/40 to-transparent" />

        {/* Back Button */}
        <button
          onClick={() => navigate(-1)}
          className="absolute top-6 left-6 p-3 bg-white/20 backdrop-blur-md rounded-full text-white hover:bg-white/30 transition-colors"
        >
          <ArrowLeft className="w-6 h-6" />
        </button>

        {/* Action Buttons */}
        <div className="absolute top-6 right-6 flex items-center gap-3">
          <button
            onClick={() => setShowShareModal(true)}
            className="p-3 bg-white/20 backdrop-blur-md rounded-full text-white hover:bg-white/30 transition-colors"
          >
            <Share2 className="w-6 h-6" />
          </button>
          {isAuthenticated && (
            <button
              onClick={handleToggleSave}
              disabled={savePending}
              className={`p-3 backdrop-blur-md rounded-full transition-colors disabled:opacity-60 ${
                isSaved
                  ? 'bg-red-500/90 text-white hover:bg-red-500'
                  : 'bg-white/20 text-white hover:bg-white/30'
              }`}
              title={isSaved ? 'Remove from favorites' : 'Save to favorites'}
              aria-pressed={isSaved}
            >
              <Heart className={`w-6 h-6 ${isSaved ? 'fill-current' : ''}`} />
            </button>
          )}
        </div>

        {/* Recipe Title */}
        <div className="absolute bottom-0 left-0 right-0 p-6 md:p-8">
          <div className="max-w-4xl mx-auto">
            <div className="flex flex-wrap items-center gap-2 mb-3">
              {recipe.cuisine && (
                <span className="px-3 py-1 bg-orange-500 text-white text-sm font-medium rounded-full">
                  {recipe.cuisine}
                </span>
              )}
              {recipe.difficulty && (
                <span className={`px-3 py-1 text-sm font-medium rounded-full ${
                  recipe.difficulty === 'easy' ? 'bg-green-500 text-white' :
                  recipe.difficulty === 'medium' ? 'bg-yellow-500 text-white' :
                  'bg-red-500 text-white'
                }`}>
                  {recipe.difficulty.charAt(0).toUpperCase() + recipe.difficulty.slice(1)}
                </span>
              )}
              {recipe.category && recipe.category !== 'meal' && (
                <span className="px-3 py-1 bg-purple-500 text-white text-sm font-medium rounded-full">
                  {recipe.category.charAt(0).toUpperCase() + recipe.category.slice(1)}
                </span>
              )}
            </div>
            <h1 className="text-3xl md:text-4xl lg:text-5xl font-bold text-white mb-3">
              {recipe.title}
            </h1>
            {recipe.description && (
              <p className="text-white/80 text-lg max-w-2xl">
                {recipe.description}
              </p>
            )}
          </div>
        </div>
      </div>

      {/* Content */}
      <div className="max-w-4xl mx-auto px-4 md:px-6 py-8">
        {/* Quick Info Bar */}
        <div className="flex flex-wrap items-center gap-6 mb-8 -mt-16 relative z-10">
          <div className="flex items-center gap-6 p-4 bg-white rounded-2xl shadow-lg">
            {recipe.prep_time_minutes && (
              <div className="flex items-center gap-2 text-gray-600">
                <Clock className="w-5 h-5 text-orange-500" />
                <div>
                  <p className="text-xs text-gray-400">Prep</p>
                  <p className="font-medium">{recipe.prep_time_minutes}m</p>
                </div>
              </div>
            )}
            {recipe.cook_time_minutes && (
              <div className="flex items-center gap-2 text-gray-600">
                <ChefHat className="w-5 h-5 text-orange-500" />
                <div>
                  <p className="text-xs text-gray-400">Cook</p>
                  <p className="font-medium">{recipe.cook_time_minutes}m</p>
                </div>
              </div>
            )}
            {totalTime > 0 && (
              <div className="flex items-center gap-2 text-gray-600">
                <Clock className="w-5 h-5 text-orange-500" />
                <div>
                  <p className="text-xs text-gray-400">Total</p>
                  <p className="font-medium">{totalTime}m</p>
                </div>
              </div>
            )}
            {recipe.servings && (
              <div className="flex items-center gap-2 text-gray-600">
                <Users className="w-5 h-5 text-orange-500" />
                <div>
                  <p className="text-xs text-gray-400">Serves</p>
                  <p className="font-medium">{recipe.servings}</p>
                </div>
              </div>
            )}
          </div>

          {/* Add to Meal Plan Button */}
          {isAuthenticated && (
            <button
              onClick={() => setShowMealPlanModal(true)}
              className="flex items-center gap-2 px-6 py-4 bg-gradient-to-r from-orange-500 to-orange-600 text-white rounded-2xl shadow-lg hover:from-orange-600 hover:to-orange-700 transition-all font-medium"
            >
              <Plus className="w-5 h-5" />
              Add to Meal Plan
            </button>
          )}
        </div>

        {/* Nutrition Info */}
        {recipe.calories && (
          <div className="mb-8">
            <h2 className="text-xl font-bold text-gray-900 mb-4">Nutrition per Serving</h2>
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
              <NutritionCard
                icon={Flame}
                label="Calories"
                value={recipe.calories}
                unit="kcal"
                color="bg-red-500"
              />
              <NutritionCard
                icon={Beef}
                label="Protein"
                value={recipe.protein_g || 0}
                unit="g"
                color="bg-blue-500"
              />
              <NutritionCard
                icon={Wheat}
                label="Carbs"
                value={recipe.carbs_g || 0}
                unit="g"
                color="bg-amber-500"
              />
              <NutritionCard
                icon={Droplets}
                label="Fat"
                value={recipe.fat_g || 0}
                unit="g"
                color="bg-purple-500"
              />
            </div>
            {(recipe.fiber_g || recipe.sugar_g || recipe.sodium_mg) && (
              <div className="grid grid-cols-3 gap-4 mt-4">
                {recipe.fiber_g !== null && (
                  <div className="bg-white/90 backdrop-blur-sm rounded-xl p-3 text-center shadow-sm">
                    <p className="text-lg font-semibold text-gray-900">{recipe.fiber_g}g</p>
                    <p className="text-xs text-gray-500">Fiber</p>
                  </div>
                )}
                {recipe.sugar_g !== null && (
                  <div className="bg-white/90 backdrop-blur-sm rounded-xl p-3 text-center shadow-sm">
                    <p className="text-lg font-semibold text-gray-900">{recipe.sugar_g}g</p>
                    <p className="text-xs text-gray-500">Sugar</p>
                  </div>
                )}
                {recipe.sodium_mg !== null && (
                  <div className="bg-white/90 backdrop-blur-sm rounded-xl p-3 text-center shadow-sm">
                    <p className="text-lg font-semibold text-gray-900">{recipe.sodium_mg}mg</p>
                    <p className="text-xs text-gray-500">Sodium</p>
                  </div>
                )}
              </div>
            )}
          </div>
        )}

        <div className="grid md:grid-cols-3 gap-8">
          {/* Ingredients */}
          <div className="md:col-span-1">
            <div className="bg-white rounded-2xl shadow-sm p-6 sticky top-6">
              <h2 className="text-xl font-bold text-gray-900 mb-4">Ingredients</h2>
              <ul className="space-y-3">
                {recipe.recipe_ingredients?.map((ing, index) => (
                  <li
                    key={index}
                    className="flex items-start gap-3 cursor-pointer group"
                    onClick={() => toggleIngredient(index)}
                  >
                    <div className={`w-5 h-5 rounded-full border-2 flex-shrink-0 flex items-center justify-center transition-colors ${
                      checkedIngredients.has(index)
                        ? 'bg-orange-500 border-orange-500'
                        : 'border-gray-300 group-hover:border-orange-400'
                    }`}>
                      {checkedIngredients.has(index) && (
                        <Check className="w-3 h-3 text-white" />
                      )}
                    </div>
                    <span className={`text-gray-700 ${checkedIngredients.has(index) ? 'line-through text-gray-400' : ''}`}>
                      <span className="font-medium">{ing.quantity} {ing.unit}</span> {ing.ingredient.name}
                      {ing.note && <span className="text-gray-400 text-sm"> ({ing.note})</span>}
                    </span>
                  </li>
                ))}
              </ul>
            </div>
          </div>

          {/* Instructions */}
          <div className="md:col-span-2">
            <div className="bg-white rounded-2xl shadow-sm p-6">
              <h2 className="text-xl font-bold text-gray-900 mb-4">Instructions</h2>
              <div className="prose prose-orange max-w-none">
                {recipe.instructions?.split('\n').filter(line => line.trim()).map((step, index) => (
                  <div key={index} className="flex gap-4 mb-4">
                    <div className="w-8 h-8 rounded-full bg-orange-100 text-orange-600 flex items-center justify-center flex-shrink-0 font-bold">
                      {index + 1}
                    </div>
                    <p className="text-gray-700 leading-relaxed pt-1">
                      {step.replace(/^\d+\.\s*/, '')}
                    </p>
                  </div>
                ))}
              </div>
            </div>

            {/* Tags */}
            {recipe.tags && recipe.tags.length > 0 && (
              <div className="mt-6">
                <h3 className="text-sm font-medium text-gray-500 mb-3">Tags</h3>
                <div className="flex flex-wrap gap-2">
                  {recipe.tags.map((tag, index) => (
                    <span
                      key={index}
                      className="px-3 py-1 bg-gray-100 text-gray-600 text-sm rounded-full hover:bg-gray-200 transition-colors"
                    >
                      {tag.name || tag}
                    </span>
                  ))}
                </div>
              </div>
            )}
          </div>
        </div>

        {/* Login Prompt for non-authenticated users */}
        {!isAuthenticated && (
          <div className="mt-8 bg-gradient-to-r from-orange-500 to-orange-600 rounded-2xl p-6 text-white text-center">
            <h3 className="text-xl font-bold mb-2">Want to save this recipe?</h3>
            <p className="text-white/80 mb-4">
              Sign up to add recipes to your meal plan and create your own collection.
            </p>
            <Link
              to="/auth/signup"
              className="inline-flex items-center gap-2 px-6 py-3 bg-white text-orange-600 rounded-xl font-medium hover:bg-orange-50 transition-colors"
            >
              Get Started Free
            </Link>
          </div>
        )}
      </div>

      {/* Modals */}
      <AddToMealPlanModal
        isOpen={showMealPlanModal}
        onClose={() => setShowMealPlanModal(false)}
        recipe={recipe}
        onAdd={handleAddToMealPlan}
      />
      <ShareModal
        isOpen={showShareModal}
        onClose={() => setShowShareModal(false)}
        recipe={recipe}
      />
    </div>
  );
}
