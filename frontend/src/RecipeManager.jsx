import React, { useEffect, useState } from "react";
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
} from "lucide-react";

// API configuration
const API_BASE_URL = import.meta.env.VITE_API_BASE_URL ?? "http://127.0.0.1:8000";

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
}) => {
  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h2 className="text-3xl font-bold text-gray-800">My Recipes</h2>
        <button
          onClick={onAddRecipe}
          className="flex items-center gap-2 bg-orange-500 text-white px-6 py-3 rounded-lg hover:bg-orange-600 transition shadow-lg"
        >
          <Plus className="w-5 h-5" />
          <span>Add Recipe</span>
        </button>
      </div>

      <div className="mb-6 space-y-4">
        <div className="relative">
          <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-5 h-5" />
          <input
            type="text"
            placeholder="Search recipes or ingredients..."
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            className="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-transparent"
          />
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
                className={`px-4 py-2 rounded-full text-sm font-medium transition ${
                  selectedTags.includes(tag)
                    ? "bg-orange-500 text-white"
                    : "bg-white text-gray-700 border border-gray-300 hover:border-orange-500"
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
              className="text-orange-500 hover:underline"
            >
              Clear all filters
            </button>
          </div>
        )}
      </div>

      {loading ? (
        <div className="text-center py-12">
          <div className="inline-block animate-spin rounded-full h-12 w-12 border-4 border-orange-500 border-t-transparent"></div>
          <p className="mt-4 text-gray-600">Loading recipes...</p>
        </div>
      ) : recipes.length === 0 ? (
        <div className="bg-white rounded-xl shadow-lg p-12 text-center">
          <Book className="w-16 h-16 text-gray-300 mx-auto mb-4" />
          {searchQuery || selectedTags.length > 0 ? (
            <>
              <h3 className="text-xl font-semibold text-gray-600 mb-2">No recipes found</h3>
              <p className="text-gray-500 mb-6">Try adjusting your search or filters</p>
              <button
                onClick={() => {
                  setSearchQuery("");
                  setSelectedTags([]);
                }}
                className="bg-orange-500 text-white px-6 py-3 rounded-lg hover:bg-orange-600 transition"
              >
                Clear Filters
              </button>
            </>
          ) : (
            <>
              <h3 className="text-xl font-semibold text-gray-600 mb-2">No recipes yet</h3>
              <p className="text-gray-500 mb-6">Start building your recipe collection!</p>
              <button
                onClick={onAddRecipe}
                className="bg-orange-500 text-white px-6 py-3 rounded-lg hover:bg-orange-600 transition"
              >
                Add Your First Recipe
              </button>
            </>
          )}
        </div>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {recipes.map((recipe) => (
            <div
              key={recipe.id}
              className="bg-white rounded-xl shadow-lg overflow-hidden hover:shadow-xl transition"
            >
              {recipe.image_url && (
                <img src={recipe.image_url} alt={recipe.title} className="w-full h-48 object-cover" />
              )}
              <div className="p-4">
                <h3 className="text-xl font-bold text-gray-800 mb-2">{recipe.title}</h3>
                {recipe.tags && recipe.tags.length > 0 && (
                  <div className="flex flex-wrap gap-1 mb-3">
                    {recipe.tags.map((tag, index) => (
                      <span
                        key={index}
                        className="px-2 py-1 bg-orange-100 text-orange-600 text-xs rounded-full"
                      >
                        {typeof tag === 'string' ? tag : tag.name}
                      </span>
                    ))}
                  </div>
                )}
                <div className="flex gap-2">
                  <button
                    onClick={() => onEditRecipe(recipe)}
                    className="flex-1 flex items-center justify-center gap-2 bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 transition"
                  >
                    <Edit2 className="w-4 h-4" />
                    <span>Edit</span>
                  </button>
                  <button
                    onClick={() => onDeleteRecipe(recipe.id)}
                    className="flex-1 flex items-center justify-center gap-2 bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition"
                  >
                    <Trash2 className="w-4 h-4" />
                    <span>Delete</span>
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>
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

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h2 className="text-3xl font-bold text-gray-800">Shopping List</h2>
        {totalCount > 0 && (
          <div className="text-sm text-gray-600">
            {uncheckedCount} of {totalCount} items remaining
          </div>
        )}
      </div>

      <div className="bg-white rounded-xl shadow-lg p-6">
        {shoppingList.length === 0 ? (
          <div className="text-center py-12">
            <ShoppingCart className="w-16 h-16 text-gray-300 mx-auto mb-4" />
            <h3 className="text-xl font-semibold text-gray-600 mb-2">No items in your list</h3>
            <p className="text-gray-500">Add recipes to your meal planner to generate a shopping list</p>
          </div>
        ) : (
          <>
            <div className="space-y-2">
              {shoppingList.map((item, index) => (
                item.isHeader ? (
                  <div
                    key={index}
                    className="flex items-center gap-3 pt-6 pb-2 border-b-2 border-orange-200 mt-4 first:mt-0 first:pt-0"
                  >
                    <h3 className="text-xl font-bold text-orange-600 uppercase tracking-wide">
                      {item.item}
                    </h3>
                  </div>
                ) : (
                  <div
                    key={index}
                    className="flex items-center gap-3 p-3 hover:bg-gray-50 rounded-lg transition group"
                  >
                    <input
                      type="checkbox"
                      checked={item.checked}
                      onChange={() => toggleItem(index)}
                      className="w-5 h-5 text-orange-500 rounded focus:ring-2 focus:ring-orange-500 cursor-pointer"
                    />
                    <span
                      className={`flex-1 text-lg ${
                        item.checked ? "line-through text-gray-400" : "text-gray-800"
                      }`}
                    >
                      {item.quantity && item.unit && (
                        <span className="text-gray-600 font-normal">
                          {item.quantity} {item.unit}{' '}
                        </span>
                      )}
                      {item.quantity && !item.unit && item.quantity !== 1 && (
                        <span className="text-gray-600 font-normal">
                          {item.quantity}{' '}
                        </span>
                      )}
                      <span className="font-semibold">{item.ingredient}</span>
                    </span>
                    {item.count > 1 && (
                      <span
                        className={`px-3 py-1 rounded-full text-sm font-medium ${
                          item.checked ? "bg-gray-100 text-gray-400" : "bg-orange-100 text-orange-600"
                        }`}
                      >
                        ×{item.count}
                      </span>
                    )}
                  </div>
                )
              ))}
            </div>

            {totalCount > 0 && (
              <div className="mt-6 pt-6 border-t border-gray-200">
                <div className="flex gap-3">
                  <button
                    onClick={() =>
                      setShoppingList(shoppingList.map((item) => ({ ...item, checked: true })))
                    }
                    className="flex-1 px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition text-gray-700 font-medium"
                  >
                    Check All
                  </button>
                  <button
                    onClick={() =>
                      setShoppingList(shoppingList.map((item) => ({ ...item, checked: false })))
                    }
                    className="flex-1 px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition text-gray-700 font-medium"
                  >
                    Uncheck All
                  </button>
                  <button
                    onClick={() => setShoppingList(shoppingList.filter((item) => !item.checked))}
                    className="flex-1 px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600 transition font-medium"
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
      // Convert image to base64 data URL
      const reader = new FileReader();
      reader.onloadend = () => {
        setImage(reader.result);
        setImageFile(file);
      };
      reader.readAsDataURL(file);
    }
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
        .map((t) => t.trim())
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
    // Semi-transparent backdrop using inline style (rgba) to show greyed-out background
    <div className="fixed inset-0 flex items-center justify-center p-4 z-50" style={{ backgroundColor: 'rgba(0, 0, 0, 0.5)' }}>
      <div className="bg-white rounded-2xl shadow-xl border border-gray-200 w-full max-w-2xl max-h-[90vh] overflow-y-auto">
        <div className="p-8">
          <div className="flex items-center justify-between mb-6">
            <h2 className="text-2xl font-bold text-black">
              {recipe ? "Edit Recipe" : "Add New Recipe"}
            </h2>
            <button onClick={onClose} className="text-gray-400 hover:text-gray-600 transition">
              <X className="w-6 h-6" />
            </button>
          </div>

          {error && (
            <div className="mb-4 p-3 bg-red-100 border border-red-400 text-red-700 rounded-lg">
              {error}
            </div>
          )}

          <div className="space-y-4">
            <div>
              <label className="block text-sm font-medium text-black mb-2">Recipe Title *</label>
              <input
                type="text"
                value={title}
                onChange={(e) => setTitle(e.target.value)}
                placeholder="e.g., Spaghetti Carbonara"
                className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-transparent bg-white"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-black mb-2">Image</label>
              <div className="space-y-3">
                <div>
                  <label className="block text-xs text-gray-600 mb-1">Upload Image</label>
                  <input
                    type="file"
                    accept="image/*"
                    onChange={handleImageUpload}
                    className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-transparent bg-white file:mr-4 file:py-2 file:px-4 file:rounded-lg file:border-0 file:text-sm file:font-semibold file:bg-orange-100 file:text-orange-700 hover:file:bg-orange-200 cursor-pointer"
                  />
                </div>
                <div className="text-center text-sm text-gray-500">OR</div>
                <div>
                  <label className="block text-xs text-gray-600 mb-1">Image URL</label>
                  <input
                    type="url"
                    value={image}
                    onChange={(e) => setImage(e.target.value)}
                    placeholder="https://example.com/image.jpg"
                    className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-transparent bg-white"
                  />
                </div>
                {image && (
                  <div className="mt-2">
                    <img src={image} alt="Preview" className="w-32 h-32 object-cover rounded-lg border-2 border-gray-200" />
                  </div>
                )}
              </div>
            </div>

            <div>
              <label className="block text-sm font-medium text-black mb-2">
                Tags (comma-separated)
              </label>
              <input
                type="text"
                value={tags}
                onChange={(e) => setTags(e.target.value)}
                placeholder="e.g., Italian, Dinner, Quick"
                className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-transparent bg-white"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-black mb-2">
                Ingredients (one per line) *
              </label>
              <textarea
                value={ingredients}
                onChange={(e) => setIngredients(e.target.value)}
                rows={6}
                className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-transparent bg-white resize-none"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-black mb-2">Instructions *</label>
              <textarea
                value={instructions}
                onChange={(e) => setInstructions(e.target.value)}
                rows={6}
                className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-transparent bg-white resize-none"
              />
            </div>

            <div className="flex gap-4 pt-4">
              <button
                onClick={onClose}
                className="flex-1 px-6 py-3 border-2 border-gray-300 rounded-lg hover:bg-gray-50 transition font-medium text-gray-700"
              >
                Cancel
              </button>
              <button
                onClick={handleSave}
                className="flex-1 bg-[#FFB84D] text-white px-6 py-3 rounded-lg hover:bg-[#FFA830] transition font-medium shadow-sm"
              >
                {recipe ? "Update Recipe" : "Create Recipe"}
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

const MealPlannerView = ({ recipes, mealPlan, setMealPlan, onSavePlan }) => {
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

    setMealPlan(newPlan);
    onSavePlan(newPlan);
  };

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h2 className="text-3xl font-bold text-gray-800">Weekly Meal Planner</h2>
        <div className="flex gap-3">
          <button
            onClick={randomizeMealPlan}
            className="flex items-center gap-2 bg-green-500 text-white px-6 py-3 rounded-lg hover:bg-green-600 transition shadow-lg"
          >
            <span>Randomize</span>
          </button>
          <button
            onClick={clearAllMeals}
            className="flex items-center gap-2 bg-red-500 text-white px-6 py-3 rounded-lg hover:bg-red-600 transition shadow-lg"
          >
            <span>Clear All</span>
          </button>
        </div>
      </div>

      {recipes.length === 0 ? (
        <div className="bg-white rounded-xl shadow-lg p-12 text-center">
          <Calendar className="w-16 h-16 text-gray-300 mx-auto mb-4" />
          <h3 className="text-xl font-semibold text-gray-600 mb-2">No recipes available</h3>
          <p className="text-gray-500">Add some recipes first to start planning your meals</p>
        </div>
      ) : (
        <div className="bg-white rounded-xl shadow-lg p-6 overflow-x-auto">
          <table className="w-full min-w-[800px]">
            <thead>
              <tr>
                <th className="p-3 text-left font-semibold text-gray-700 border-b-2 border-gray-200">
                  Day
                </th>
                {meals.map((meal) => (
                  <th
                    key={meal}
                    className="p-3 text-left font-semibold text-gray-700 border-b-2 border-gray-200"
                  >
                    {meal}
                  </th>
                ))}
              </tr>
            </thead>
            <tbody>
              {days.map((day) => (
                <tr key={day} className="border-b border-gray-200 hover:bg-gray-50">
                  <td className="p-3 font-medium text-gray-800">{day}</td>
                  {meals.map((meal) => {
                    const recipeId = mealPlan[day]?.[meal];
                    const recipe = recipes.find((r) => r.id === recipeId);

                    return (
                      <td key={meal} className="p-3">
                        {recipe ? (
                          <div className="bg-orange-100 rounded-lg p-3 relative">
                            <p className="text-sm font-medium text-gray-800 pr-6">{recipe.title}</p>
                            {recipe.tags && recipe.tags.length > 0 && (
                              <div className="flex flex-wrap gap-1 mt-1">
                                {recipe.tags.map((tag, idx) => (
                                  <span
                                    key={idx}
                                    className="text-xs bg-orange-200 text-orange-700 px-2 py-0.5 rounded"
                                  >
                                    {typeof tag === 'string' ? tag : tag.name}
                                  </span>
                                ))}
                              </div>
                            )}
                            <button
                              onClick={() => removeRecipeFromMeal(day, meal)}
                              className="absolute top-2 right-2 text-red-500 hover:text-red-700 transition"
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
                            className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-transparent bg-white hover:border-orange-400 transition"
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

// Styling changes
const AuthScreen = ({ onAuth }) => {
  const [isLogin, setIsLogin] = useState(true);
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const validateForm = () => {
    if (!email || !password) {
      setError("Email and password are required");
      return false;
    }
    if (!isLogin && !name) {
      setError("Name is required");
      return false;
    }
    if (password.length < 6) {
      setError("Password must be at least 6 characters");
      return false;
    }
    if (!email.includes("@")) {
      setError("Please enter a valid email");
      return false;
    }
    return true;
  };

  const handleSubmit = async () => {
    setError("");
    if (!validateForm()) return;

    setLoading(true);
    try {
      if (isLogin) {
        const result = await api.login(email, password);
        if (result.error) setError(result.error);
        else onAuth(result.user);
      } else {
        const result = await api.signup(name, email, password);
        if (result.error) setError(result.error);
        else onAuth(result.user);
      }
    } catch (err) {
      setError("Connection error. Please check if the backend is running.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-[#F5EFE6] flex items-center justify-center p-4">
      <div className="bg-[#D5D5D5] rounded-3xl shadow-xl p-12 w-full max-w-md">
        <div className="flex items-center justify-center gap-3 mb-8">
          <div className="w-12 h-12 border-4 border-gray-600 rounded-md flex items-center justify-center">
            <X className="w-8 h-8 text-gray-600" />
          </div>
          <h1 className="text-3xl font-bold text-black">Recipe Manager</h1>
        </div>

        <h2 className="text-2xl font-normal text-black mb-8 text-center">
          {isLogin ? "Welcome" : "Create Account"}
        </h2>

        {error && (
          <div className="mb-4 p-3 bg-red-100 border border-red-400 text-red-700 rounded-lg">
            {error}
          </div>
        )}

        <div className="space-y-4">
          {!isLogin && (
            <input
              type="text"
              placeholder="Full Name"
              value={name}
              onChange={(e) => setName(e.target.value)}
              className="w-full px-4 py-3 bg-white border border-gray-300 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-transparent text-gray-900 placeholder-gray-400"
            />
          )}

          <input
            type="email"
            placeholder="Email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            className="w-full px-4 py-3 bg-white border border-gray-300 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-transparent text-gray-900 placeholder-gray-400"
          />

          <input
            type="password"
            placeholder="Password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            onKeyDown={(e) => e.key === "Enter" && handleSubmit()}
            className="w-full px-4 py-3 bg-white border border-gray-300 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-transparent text-gray-900 placeholder-gray-400"
          />

          <button
            onClick={handleSubmit}
            disabled={loading}
            className="w-full bg-orange-500 text-white py-3 rounded-xl font-semibold hover:bg-orange-600 transition disabled:bg-gray-400 disabled:cursor-not-allowed shadow-md"
          >
            {loading ? "Please wait..." : isLogin ? "Sign In" : "Sign Up"}
          </button>
        </div>

        <p className="mt-6 text-center text-gray-700">
          {isLogin ? "Don't have an account? " : "Already have an account? "}
          <button
            onClick={() => {
              setIsLogin(!isLogin);
              setError("");
            }}
            className="text-orange-500 font-semibold hover:text-orange-600 transition"
          >
            {isLogin ? "Sign up" : "Sign in"}
          </button>
        </p>
      </div>
    </div>
  );
};

const RecipeManager = () => {
  const [user, setUser] = useState(null);

  const [recipes, setRecipes] = useState([]);
  const [mealPlan, setMealPlan] = useState({});
  const [shoppingList, setShoppingList] = useState([]);

  const [currentView, setCurrentView] = useState("recipes");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const [showRecipeForm, setShowRecipeForm] = useState(false);
  const [editingRecipe, setEditingRecipe] = useState(null);

  const [searchQuery, setSearchQuery] = useState("");
  const [selectedTags, setSelectedTags] = useState([]);

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

  const loadRecipes = async () => {
    setLoading(true);
    setError("");

    const result = await api.getRecipes();
    if (result.error) setError(result.error);
    else setRecipes(result.recipes || result);

    setLoading(false);
  };

  const loadMealPlan = async () => {
    const result = await api.getMealPlan();
    if (!result.error) setMealPlan(result.plan || result);
  };

  const generateShoppingList = () => {
    const ingredientsMap = {};

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

              // Create unique key for combining
              const key = normalizedUnit ? `${singularIngredient}|||${normalizedUnit}` : singularIngredient;

              if (!ingredientsMap[key]) {
                ingredientsMap[key] = { ingredient: singularIngredient, unit: normalizedUnit, quantity: 0 };
              }
              ingredientsMap[key].quantity += quantity;
            } else if (fullText.trim()) {
              // Fallback for unparseable items
              const lower = fullText.toLowerCase();
              if (!ingredientsMap[lower]) {
                ingredientsMap[lower] = { ingredient: lower, unit: '', quantity: 1 };
              } else {
                ingredientsMap[lower].quantity += 1;
              }
            }
          });
        }
      });
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

    // Format and categorize items
    Object.entries(ingredientsMap).forEach(([key, data]) => {
      const qty = Math.round(data.quantity * 100) / 100; // Round to 2 decimals
      const unit = data.unit;
      const ing = data.ingredient;

      // Pluralize ingredient if needed
      let displayIng = ing;
      const massNouns = ['flour', 'sugar', 'rice', 'milk', 'butter', 'oil', 'salt', 'pepper', 'water', 'cheese', 'honey', 'yogurt', 'bread', 'ice'];
      const isMassNoun = massNouns.some(noun => ing.includes(noun));

      if (!unit && qty > 1 && !isMassNoun) {
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

      categorizedList[foundCategory].push({
        quantity: qty,
        unit: unit,
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
  ))];

  if (!user) return <AuthScreen onAuth={setUser} />;

  // Layout updated to match wireframe design
  return (
    <div className="min-h-screen bg-[#FFF8E8]">
      <nav className="bg-white shadow-sm border-b border-gray-200">
        <div className="max-w-7xl mx-auto px-6 py-3">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-3">
              <Book className="w-8 h-8 text-orange-500" />
              <h1 className="text-2xl font-bold text-black">Recipe Manager</h1>
            </div>

            {/* Navigation buttons with orange active state and gray inactive state */}
            <div className="flex items-center gap-4">
              <button
                onClick={() => setCurrentView("recipes")}
                className={`flex items-center gap-2 px-6 py-2 rounded-lg transition font-medium ${
                  currentView === "recipes"
                    ? "bg-[#FFB84D] text-white"
                    : "bg-gray-200 text-gray-600 hover:bg-gray-300"
                }`}
              >
                <Book className="w-5 h-5" />
                <span>Recipes</span>
              </button>

              <button
                onClick={() => setCurrentView("planner")}
                className={`flex items-center gap-2 px-6 py-2 rounded-lg transition font-medium ${
                  currentView === "planner"
                    ? "bg-[#FFB84D] text-white"
                    : "bg-gray-200 text-gray-600 hover:bg-gray-300"
                }`}
              >
                <Calendar className="w-5 h-5" />
                <span>Meal Planner</span>
              </button>

              <button
                onClick={() => setCurrentView("shopping")}
                className={`flex items-center gap-2 px-6 py-2 rounded-lg transition font-medium ${
                  currentView === "shopping"
                    ? "bg-[#FFB84D] text-white"
                    : "bg-gray-200 text-gray-600 hover:bg-gray-300"
                }`}
              >
                <ShoppingCart className="w-5 h-5" />
                <span>Shopping List</span>
              </button>

              <div className="flex items-center gap-2 text-gray-700">
                <User className="w-5 h-5" />
                <span>{user?.name ?? "User"}</span>
              </div>

              <button onClick={() => {
                localStorage.removeItem("authToken");
                setUser(null);
              }} className="text-gray-500 hover:text-red-500">
                <LogOut className="w-5 h-5" />
              </button>
            </div>
          </div>
        </div>
      </nav>

      <main className="max-w-7xl mx-auto px-6 py-8">
        {error && (
          <div className="mb-4 p-3 bg-red-100 border border-red-400 text-red-700 rounded-lg">
            {error}
          </div>
        )}

        {currentView === "recipes" && (
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
          />
        )}

        {currentView === "planner" && (
          <MealPlannerView
            recipes={recipes}
            mealPlan={mealPlan}
            setMealPlan={setMealPlan}
            onSavePlan={async (plan) => {
              const result = await api.updateMealPlan(plan);
              if (result.error) setError(result.error);
            }}
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
    </div>
  );
};

export default RecipeManager;
