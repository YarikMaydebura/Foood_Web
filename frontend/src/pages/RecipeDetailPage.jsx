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

  // Reviews
  const [reviews, setReviews] = useState([]);
  const [reviewSummary, setReviewSummary] = useState({ average: null, count: 0 });
  const [myReview, setMyReview] = useState(null);
  const [draftRating, setDraftRating] = useState(0);
  const [draftComment, setDraftComment] = useState("");
  const [savingReview, setSavingReview] = useState(false);

  // Comments
  const [comments, setComments] = useState([]);
  const [newCommentText, setNewCommentText] = useState("");
  const [replyingTo, setReplyingTo] = useState(null);
  const [replyText, setReplyText] = useState("");
  const [postingComment, setPostingComment] = useState(false);
  const [currentUserId, setCurrentUserId] = useState(null);

  const loadComments = async (recipeId) => {
    try {
      const res = await fetch(`${API_BASE_URL}/recipes/${recipeId}/comments`);
      if (res.ok) setComments(await res.json());
    } catch {
      /* ignore */
    }
  };

  const postComment = async (text, parentId = null) => {
    if (!recipe || !text.trim()) return;
    const token = localStorage.getItem('authToken');
    if (!token) {
      navigate('/auth/login');
      return;
    }
    setPostingComment(true);
    try {
      const res = await fetch(`${API_BASE_URL}/recipes/${recipe.id}/comments`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', 'Authorization': `Bearer ${token}` },
        body: JSON.stringify({ text: text.trim(), parent_id: parentId }),
      });
      if (res.ok) {
        await loadComments(recipe.id);
        if (parentId) {
          setReplyingTo(null);
          setReplyText("");
        } else {
          setNewCommentText("");
        }
      } else {
        const data = await res.json().catch(() => ({}));
        setToast(data.detail || 'Failed to post comment');
      }
    } finally {
      setPostingComment(false);
    }
  };

  const deleteComment = async (commentId) => {
    if (!recipe) return;
    const token = localStorage.getItem('authToken');
    if (!token) return;
    if (!window.confirm("Delete this comment?")) return;
    const res = await fetch(
      `${API_BASE_URL}/recipes/${recipe.id}/comments/${commentId}`,
      { method: 'DELETE', headers: { 'Authorization': `Bearer ${token}` } }
    );
    if (res.ok) await loadComments(recipe.id);
  };

  const loadReviews = async (recipeId) => {
    try {
      const [listRes, summaryRes] = await Promise.all([
        fetch(`${API_BASE_URL}/recipes/${recipeId}/reviews`),
        fetch(`${API_BASE_URL}/recipes/${recipeId}/reviews/summary`),
      ]);
      if (listRes.ok) setReviews(await listRes.json());
      if (summaryRes.ok) setReviewSummary(await summaryRes.json());
    } catch {
      /* ignore */
    }
  };

  const loadMyReview = async (recipeId) => {
    const token = localStorage.getItem('authToken');
    if (!token) return;
    try {
      const res = await fetch(`${API_BASE_URL}/recipes/${recipeId}/reviews/me`, {
        headers: { 'Authorization': `Bearer ${token}` },
      });
      if (res.ok) {
        const data = await res.json();
        setMyReview(data || null);
        if (data) {
          setDraftRating(data.rating);
          setDraftComment(data.comment || "");
        }
      }
    } catch {
      /* ignore */
    }
  };

  const submitReview = async () => {
    if (!recipe || draftRating < 1) return;
    const token = localStorage.getItem('authToken');
    if (!token) {
      navigate('/auth/login');
      return;
    }
    setSavingReview(true);
    try {
      const res = await fetch(`${API_BASE_URL}/recipes/${recipe.id}/reviews`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', 'Authorization': `Bearer ${token}` },
        body: JSON.stringify({ rating: draftRating, comment: draftComment.trim() || null }),
      });
      if (res.ok) {
        const data = await res.json();
        setMyReview(data);
        setToast(myReview ? 'Review updated' : 'Review posted');
        await loadReviews(recipe.id);
      } else {
        const data = await res.json().catch(() => ({}));
        setToast(data.detail || 'Failed to post review');
      }
    } finally {
      setSavingReview(false);
    }
  };

  const deleteMyReview = async () => {
    if (!recipe) return;
    const token = localStorage.getItem('authToken');
    if (!token) return;
    const res = await fetch(`${API_BASE_URL}/recipes/${recipe.id}/reviews/me`, {
      method: 'DELETE',
      headers: { 'Authorization': `Bearer ${token}` },
    });
    if (res.ok) {
      setMyReview(null);
      setDraftRating(0);
      setDraftComment("");
      setToast('Review removed');
      await loadReviews(recipe.id);
    }
  };

  useEffect(() => {
    const token = localStorage.getItem('authToken');
    setIsAuthenticated(!!token);
    fetchRecipe();
  }, [slug]);

  // Load reviews + comments whenever the recipe loads.
  useEffect(() => {
    if (!recipe?.id) return;
    loadReviews(recipe.id);
    loadMyReview(recipe.id);
    loadComments(recipe.id);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [recipe?.id, isAuthenticated]);

  // Fetch current user id once for "your comment" controls.
  useEffect(() => {
    const token = localStorage.getItem('authToken');
    if (!token) return;
    fetch(`${API_BASE_URL}/auth/me`, { headers: { 'Authorization': `Bearer ${token}` } })
      .then((r) => (r.ok ? r.json() : null))
      .then((data) => {
        if (data?.user?.id) setCurrentUserId(data.user.id);
      })
      .catch(() => {});
  }, [isAuthenticated]);

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

        {/* Reviews */}
        <div className="mt-8 bg-white rounded-2xl shadow-sm p-6">
          <div className="flex items-center justify-between mb-4 flex-wrap gap-2">
            <h2 className="text-xl font-bold text-gray-900">Reviews</h2>
            {reviewSummary.count > 0 ? (
              <div className="flex items-center gap-2 text-sm">
                <span className="text-amber-500 text-lg">★</span>
                <span className="font-semibold text-gray-900">
                  {reviewSummary.average?.toFixed(1)}
                </span>
                <span className="text-gray-500">
                  ({reviewSummary.count} {reviewSummary.count === 1 ? 'review' : 'reviews'})
                </span>
              </div>
            ) : (
              <span className="text-sm text-gray-500">No reviews yet</span>
            )}
          </div>

          {/* Write / edit your review */}
          {isAuthenticated && (
            <div className="bg-orange-50/60 border border-orange-100 rounded-xl p-4 mb-6">
              <p className="text-sm font-medium text-gray-700 mb-2">
                {myReview ? 'Your review' : 'Leave a review'}
              </p>
              <div className="flex items-center gap-1 mb-3">
                {[1, 2, 3, 4, 5].map((n) => (
                  <button
                    key={n}
                    type="button"
                    onClick={() => setDraftRating(n)}
                    aria-label={`Rate ${n} star${n > 1 ? 's' : ''}`}
                    className={`text-2xl transition-colors ${
                      draftRating >= n ? 'text-amber-500' : 'text-gray-300 hover:text-amber-400'
                    }`}
                  >
                    ★
                  </button>
                ))}
                {draftRating > 0 && (
                  <span className="ml-2 text-sm text-gray-600">{draftRating}/5</span>
                )}
              </div>
              <textarea
                value={draftComment}
                onChange={(e) => setDraftComment(e.target.value.slice(0, 500))}
                rows={2}
                placeholder="Optional — share what worked or didn't (up to 500 chars)"
                className="w-full px-3 py-2 bg-white border border-gray-200 rounded-lg text-sm focus:ring-2 focus:ring-orange-500 focus:border-orange-500 resize-none"
              />
              <div className="flex items-center justify-between mt-2">
                <span className="text-xs text-gray-400">{draftComment.length}/500</span>
                <div className="flex items-center gap-2">
                  {myReview && (
                    <button
                      type="button"
                      onClick={deleteMyReview}
                      className="px-3 py-1.5 text-xs text-red-600 hover:bg-red-50 rounded-lg transition-colors"
                    >
                      Delete review
                    </button>
                  )}
                  <button
                    type="button"
                    onClick={submitReview}
                    disabled={draftRating < 1 || savingReview}
                    className={`px-4 py-1.5 text-sm font-medium rounded-lg transition-colors ${
                      draftRating < 1 || savingReview
                        ? 'bg-gray-200 text-gray-400 cursor-not-allowed'
                        : 'bg-orange-500 text-white hover:bg-orange-600'
                    }`}
                  >
                    {myReview ? 'Update' : 'Post review'}
                  </button>
                </div>
              </div>
            </div>
          )}

          {/* List of reviews */}
          {reviews.length === 0 ? (
            <p className="text-sm text-gray-500 text-center py-6">
              Be the first to review this recipe.
            </p>
          ) : (
            <div className="space-y-4">
              {reviews.map((r) => (
                <div key={r.id} className="border-b border-gray-100 pb-4 last:border-b-0">
                  <div className="flex items-center justify-between mb-1">
                    <div className="flex items-center gap-2">
                      <span className="font-medium text-gray-900">{r.author_name || 'User'}</span>
                      <span className="text-amber-500">
                        {'★'.repeat(r.rating)}<span className="text-gray-300">{'★'.repeat(5 - r.rating)}</span>
                      </span>
                    </div>
                    <span className="text-xs text-gray-400">
                      {new Date(r.created_at).toLocaleDateString(undefined, { month: 'short', day: 'numeric', year: 'numeric' })}
                    </span>
                  </div>
                  {r.comment && (
                    <p className="text-sm text-gray-700 mt-1 whitespace-pre-wrap">{r.comment}</p>
                  )}
                </div>
              ))}
            </div>
          )}
        </div>

        {/* Comments */}
        <div className="mt-8 bg-white rounded-2xl shadow-sm p-6">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-xl font-bold text-gray-900">Comments</h2>
            <span className="text-sm text-gray-500">
              {comments.length} {comments.length === 1 ? 'thread' : 'threads'}
            </span>
          </div>

          {isAuthenticated && (
            <div className="mb-6">
              <textarea
                value={newCommentText}
                onChange={(e) => setNewCommentText(e.target.value.slice(0, 2000))}
                rows={3}
                placeholder="Share a tip, a tweak, or a question..."
                className="w-full px-3 py-2 bg-gray-50 border border-gray-200 rounded-xl text-sm focus:ring-2 focus:ring-orange-500 focus:border-orange-500 resize-none"
              />
              <div className="flex items-center justify-between mt-2">
                <span className="text-xs text-gray-400">{newCommentText.length}/2000</span>
                <button
                  type="button"
                  onClick={() => postComment(newCommentText)}
                  disabled={!newCommentText.trim() || postingComment}
                  className={`px-4 py-1.5 text-sm font-medium rounded-lg transition-colors ${
                    !newCommentText.trim() || postingComment
                      ? 'bg-gray-200 text-gray-400 cursor-not-allowed'
                      : 'bg-orange-500 text-white hover:bg-orange-600'
                  }`}
                >
                  Post comment
                </button>
              </div>
            </div>
          )}

          {comments.length === 0 ? (
            <p className="text-sm text-gray-500 text-center py-6">
              No comments yet. {isAuthenticated ? "Start the conversation!" : "Sign in to start the conversation."}
            </p>
          ) : (
            <div className="space-y-5">
              {comments.map((c) => (
                <div key={c.id} className="border-l-2 border-gray-100 pl-4">
                  <div className="flex items-center justify-between mb-1 flex-wrap gap-1">
                    <span className="font-medium text-gray-900 text-sm">{c.author_name || 'User'}</span>
                    <span className="text-xs text-gray-400">
                      {new Date(c.created_at).toLocaleDateString(undefined, { month: 'short', day: 'numeric', hour: '2-digit', minute: '2-digit' })}
                    </span>
                  </div>
                  <p className="text-sm text-gray-700 whitespace-pre-wrap">{c.text}</p>
                  <div className="flex items-center gap-3 mt-2">
                    {isAuthenticated && (
                      <button
                        type="button"
                        onClick={() => {
                          setReplyingTo(replyingTo === c.id ? null : c.id);
                          setReplyText("");
                        }}
                        className="text-xs font-medium text-orange-600 hover:text-orange-700"
                      >
                        {replyingTo === c.id ? 'Cancel' : 'Reply'}
                      </button>
                    )}
                    {currentUserId === c.user_id && (
                      <button
                        type="button"
                        onClick={() => deleteComment(c.id)}
                        className="text-xs text-red-500 hover:text-red-700"
                      >
                        Delete
                      </button>
                    )}
                  </div>

                  {replyingTo === c.id && (
                    <div className="mt-3 pl-2 border-l-2 border-orange-200">
                      <textarea
                        value={replyText}
                        onChange={(e) => setReplyText(e.target.value.slice(0, 2000))}
                        rows={2}
                        placeholder={`Reply to ${c.author_name || 'this comment'}...`}
                        className="w-full px-3 py-2 bg-gray-50 border border-gray-200 rounded-lg text-sm focus:ring-2 focus:ring-orange-500 focus:border-orange-500 resize-none"
                        autoFocus
                      />
                      <div className="flex items-center justify-end gap-2 mt-2">
                        <button
                          type="button"
                          onClick={() => postComment(replyText, c.id)}
                          disabled={!replyText.trim() || postingComment}
                          className={`px-3 py-1 text-xs font-medium rounded-lg transition-colors ${
                            !replyText.trim() || postingComment
                              ? 'bg-gray-200 text-gray-400 cursor-not-allowed'
                              : 'bg-orange-500 text-white hover:bg-orange-600'
                          }`}
                        >
                          Reply
                        </button>
                      </div>
                    </div>
                  )}

                  {c.replies && c.replies.length > 0 && (
                    <div className="mt-3 ml-4 space-y-3">
                      {c.replies.map((r) => (
                        <div key={r.id} className="border-l-2 border-orange-100 pl-3">
                          <div className="flex items-center justify-between mb-0.5 flex-wrap gap-1">
                            <span className="font-medium text-gray-900 text-sm">{r.author_name || 'User'}</span>
                            <span className="text-xs text-gray-400">
                              {new Date(r.created_at).toLocaleDateString(undefined, { month: 'short', day: 'numeric', hour: '2-digit', minute: '2-digit' })}
                            </span>
                          </div>
                          <p className="text-sm text-gray-700 whitespace-pre-wrap">{r.text}</p>
                          {currentUserId === r.user_id && (
                            <button
                              type="button"
                              onClick={() => deleteComment(r.id)}
                              className="mt-1 text-xs text-red-500 hover:text-red-700"
                            >
                              Delete
                            </button>
                          )}
                        </div>
                      ))}
                    </div>
                  )}
                </div>
              ))}
            </div>
          )}
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
