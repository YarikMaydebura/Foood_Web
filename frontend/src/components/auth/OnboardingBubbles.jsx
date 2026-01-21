import { useState, useMemo } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { ArrowRight, ChefHat, Sparkles } from 'lucide-react';

// Diet preferences with emojis
const DIET_OPTIONS = [
  { id: 'Vegetarian', label: 'Vegetarian', emoji: '🥗' },
  { id: 'Healthy', label: 'Healthy', emoji: '💪' },
  { id: 'Comfort Food', label: 'Comfort Food', emoji: '🍝' },
];

// Cuisine preferences with emojis
const CUISINE_OPTIONS = [
  { id: 'Italian', label: 'Italian', emoji: '🍕' },
  { id: 'Asian', label: 'Asian', emoji: '🍜' },
  { id: 'Mediterranean', label: 'Mediterranean', emoji: '🫒' },
  { id: 'American', label: 'American', emoji: '🍔' },
  { id: 'Japanese', label: 'Japanese', emoji: '🍣' },
  { id: 'French', label: 'French', emoji: '🥐' },
  { id: 'Thai', label: 'Thai', emoji: '🍛' },
];

const STEPS = {
  DIET: 'diet',
  CUISINE: 'cuisine',
};

// Animated bubble component
const PreferenceBubble = ({ option, selected, onClick, index }) => {
  // Generate random offset for organic layout
  const randomOffset = useMemo(() => ({
    x: (Math.random() - 0.5) * 20,
    y: (Math.random() - 0.5) * 20,
    rotate: (Math.random() - 0.5) * 10,
  }), []);

  return (
    <motion.button
      initial={{ scale: 0, opacity: 0 }}
      animate={{
        scale: 1,
        opacity: 1,
        x: randomOffset.x,
        y: randomOffset.y,
      }}
      whileHover={{
        scale: 1.08,
        rotate: randomOffset.rotate,
        transition: { type: 'spring', stiffness: 400 }
      }}
      whileTap={{ scale: 0.95 }}
      transition={{
        type: 'spring',
        stiffness: 300,
        damping: 20,
        delay: index * 0.08
      }}
      onClick={onClick}
      className={`
        relative px-6 py-4 rounded-full text-lg font-medium
        transition-all duration-300 transform
        ${selected
          ? 'bg-gradient-to-r from-orange-500 to-orange-600 text-white shadow-lg shadow-orange-500/40 ring-4 ring-orange-300/50 scale-105'
          : 'bg-white/95 text-gray-700 hover:bg-orange-50 border-2 border-orange-200 hover:border-orange-400'
        }
      `}
    >
      {/* Glow effect when selected */}
      {selected && (
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          className="absolute inset-0 rounded-full bg-gradient-to-r from-orange-400 to-yellow-400 blur-xl -z-10"
        />
      )}

      <span className="flex items-center gap-2">
        <span className="text-2xl">{option.emoji}</span>
        <span>{option.label}</span>
      </span>

      {/* Selected checkmark */}
      {selected && (
        <motion.span
          initial={{ scale: 0 }}
          animate={{ scale: 1 }}
          className="absolute -top-1 -right-1 w-6 h-6 bg-white rounded-full flex items-center justify-center shadow-md"
        >
          <span className="text-orange-500 text-sm">✓</span>
        </motion.span>
      )}
    </motion.button>
  );
};

// Floating background element
const FloatingElement = ({ emoji, style, delay }) => (
  <motion.div
    initial={{ opacity: 0, scale: 0 }}
    animate={{
      opacity: 0.3,
      scale: 1,
      y: [0, -20, 0],
      rotate: [0, 10, -10, 0],
    }}
    transition={{
      opacity: { delay },
      scale: { delay },
      y: { duration: 4, repeat: Infinity, ease: 'easeInOut', delay },
      rotate: { duration: 5, repeat: Infinity, ease: 'easeInOut', delay },
    }}
    className="absolute text-6xl pointer-events-none select-none"
    style={style}
  >
    {emoji}
  </motion.div>
);

export default function OnboardingBubbles({ onComplete, api }) {
  const [step, setStep] = useState(STEPS.DIET);
  const [dietPreferences, setDietPreferences] = useState([]);
  const [cuisinePreferences, setCuisinePreferences] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const toggleDiet = (id) => {
    setDietPreferences(prev =>
      prev.includes(id)
        ? prev.filter(p => p !== id)
        : [...prev, id]
    );
  };

  const toggleCuisine = (id) => {
    setCuisinePreferences(prev =>
      prev.includes(id)
        ? prev.filter(p => p !== id)
        : [...prev, id]
    );
  };

  const handleContinue = () => {
    setStep(STEPS.CUISINE);
  };

  const handleComplete = async () => {
    setLoading(true);
    setError('');

    try {
      const result = await api.completeOnboarding(dietPreferences, cuisinePreferences);
      if (result.error) {
        setError(result.error);
      } else {
        onComplete();
      }
    } catch (err) {
      setError('Connection error. Please try again.');
    } finally {
      setLoading(false);
    }
  };

  const handleSkip = async () => {
    setLoading(true);
    setError('');

    try {
      const result = await api.skipOnboarding();
      if (result.error) {
        setError(result.error);
      } else {
        onComplete();
      }
    } catch (err) {
      setError('Connection error. Please try again.');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="fixed inset-0 bg-gradient-to-br from-orange-600/95 via-orange-500/90 to-orange-400/80 overflow-hidden">
      {/* Background Food Image */}
      <div className="absolute inset-0">
        <img
          src="https://images.unsplash.com/photo-1495521821757-a1efb6729352?w=1920&q=80"
          alt=""
          className="w-full h-full object-cover opacity-20"
        />
      </div>

      {/* Floating Background Elements */}
      <FloatingElement emoji="🍅" style={{ top: '10%', left: '5%' }} delay={0} />
      <FloatingElement emoji="🥑" style={{ top: '15%', right: '10%' }} delay={0.3} />
      <FloatingElement emoji="🍋" style={{ bottom: '20%', left: '8%' }} delay={0.6} />
      <FloatingElement emoji="🌶️" style={{ bottom: '15%', right: '5%' }} delay={0.9} />
      <FloatingElement emoji="🧄" style={{ top: '50%', left: '3%' }} delay={1.2} />
      <FloatingElement emoji="🥕" style={{ top: '60%', right: '8%' }} delay={1.5} />

      {/* Content */}
      <div className="relative z-10 min-h-screen flex flex-col items-center justify-center p-6">
        <AnimatePresence mode="wait">
          {step === STEPS.DIET ? (
            <motion.div
              key="diet"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -20 }}
              className="w-full max-w-2xl text-center"
            >
              {/* Header */}
              <motion.div
                initial={{ scale: 0 }}
                animate={{ scale: 1 }}
                transition={{ type: 'spring', stiffness: 200 }}
                className="inline-flex items-center justify-center w-20 h-20 bg-white/20 backdrop-blur-sm rounded-full mb-6"
              >
                <ChefHat className="w-10 h-10 text-white" />
              </motion.div>

              <h1 className="font-playfair text-4xl md:text-5xl font-bold text-white mb-4 drop-shadow-lg">
                What Do You Like to Eat?
              </h1>
              <p className="text-xl text-white/90 mb-10">
                Select your dietary preferences (optional)
              </p>

              {/* Progress Indicator */}
              <div className="flex items-center justify-center gap-3 mb-10">
                <div className="h-2 w-12 rounded-full bg-white" />
                <div className="h-2 w-12 rounded-full bg-white/30" />
              </div>

              {/* Diet Bubbles */}
              <div className="flex flex-wrap justify-center gap-4 mb-12">
                {DIET_OPTIONS.map((option, index) => (
                  <PreferenceBubble
                    key={option.id}
                    option={option}
                    selected={dietPreferences.includes(option.id)}
                    onClick={() => toggleDiet(option.id)}
                    index={index}
                  />
                ))}
              </div>

              {/* Error Message */}
              {error && (
                <motion.div
                  initial={{ opacity: 0 }}
                  animate={{ opacity: 1 }}
                  className="mb-6 p-4 bg-red-500/20 backdrop-blur-sm border border-red-300/30 text-white rounded-xl text-sm"
                >
                  {error}
                </motion.div>
              )}

              {/* Continue Button */}
              <motion.button
                onClick={handleContinue}
                whileHover={{ scale: 1.02 }}
                whileTap={{ scale: 0.98 }}
                className="px-10 py-4 bg-white text-orange-600 font-bold rounded-xl shadow-2xl hover:shadow-white/30 transition-all flex items-center gap-2 mx-auto group text-lg"
              >
                Continue
                <ArrowRight className="w-5 h-5 group-hover:translate-x-1 transition-transform" />
              </motion.button>

              {/* Skip Option */}
              <button
                onClick={handleSkip}
                disabled={loading}
                className="mt-6 text-white/80 hover:text-white font-medium transition-colors"
              >
                {loading ? 'Loading...' : 'Skip for now'}
              </button>
            </motion.div>
          ) : (
            <motion.div
              key="cuisine"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -20 }}
              className="w-full max-w-3xl text-center"
            >
              {/* Header */}
              <motion.div
                initial={{ scale: 0 }}
                animate={{ scale: 1 }}
                transition={{ type: 'spring', stiffness: 200 }}
                className="inline-flex items-center justify-center w-20 h-20 bg-white/20 backdrop-blur-sm rounded-full mb-6"
              >
                <Sparkles className="w-10 h-10 text-white" />
              </motion.div>

              <h1 className="font-playfair text-4xl md:text-5xl font-bold text-white mb-4 drop-shadow-lg">
                Pick Your Favorite Cuisines
              </h1>
              <p className="text-xl text-white/90 mb-10">
                We'll recommend recipes you'll love
              </p>

              {/* Progress Indicator */}
              <div className="flex items-center justify-center gap-3 mb-10">
                <div className="h-2 w-12 rounded-full bg-white" />
                <div className="h-2 w-12 rounded-full bg-white" />
              </div>

              {/* Cuisine Bubbles */}
              <div className="flex flex-wrap justify-center gap-4 mb-12">
                {CUISINE_OPTIONS.map((option, index) => (
                  <PreferenceBubble
                    key={option.id}
                    option={option}
                    selected={cuisinePreferences.includes(option.id)}
                    onClick={() => toggleCuisine(option.id)}
                    index={index}
                  />
                ))}
              </div>

              {/* Error Message */}
              {error && (
                <motion.div
                  initial={{ opacity: 0 }}
                  animate={{ opacity: 1 }}
                  className="mb-6 p-4 bg-red-500/20 backdrop-blur-sm border border-red-300/30 text-white rounded-xl text-sm"
                >
                  {error}
                </motion.div>
              )}

              {/* Action Buttons */}
              <div className="flex flex-col sm:flex-row gap-4 justify-center">
                <button
                  onClick={() => setStep(STEPS.DIET)}
                  className="px-8 py-4 bg-white/10 backdrop-blur-sm text-white font-bold rounded-xl border-2 border-white/30 hover:bg-white/20 transition-all"
                >
                  Back
                </button>
                <motion.button
                  onClick={handleComplete}
                  disabled={loading}
                  whileHover={{ scale: loading ? 1 : 1.02 }}
                  whileTap={{ scale: loading ? 1 : 0.98 }}
                  className="px-10 py-4 bg-white text-orange-600 font-bold rounded-xl shadow-2xl hover:shadow-white/30 transition-all flex items-center gap-2 justify-center group text-lg disabled:opacity-70"
                >
                  {loading ? (
                    <>
                      <div className="w-5 h-5 border-2 border-orange-500/30 border-t-orange-500 rounded-full animate-spin" />
                      <span>Setting up...</span>
                    </>
                  ) : (
                    <>
                      <span>Let's Cook!</span>
                      <ArrowRight className="w-5 h-5 group-hover:translate-x-1 transition-transform" />
                    </>
                  )}
                </motion.button>
              </div>

              {/* Skip Option */}
              <button
                onClick={handleSkip}
                disabled={loading}
                className="mt-6 text-white/80 hover:text-white font-medium transition-colors"
              >
                {loading ? 'Loading...' : 'Skip for now'}
              </button>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </div>
  );
}
