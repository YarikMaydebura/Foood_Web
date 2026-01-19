import { motion } from 'framer-motion';
import { Link } from 'react-router-dom';
import { ArrowRight, Play } from 'lucide-react';

export default function HeroSection() {
  return (
    <section className="relative min-h-screen flex items-center overflow-hidden">
      {/* Full-Bleed Food Photography Background */}
      <div className="absolute inset-0">
        {/* Background Image */}
        <img
          src="https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=1920&q=80"
          alt="Fresh ingredients"
          className="w-full h-full object-cover"
        />
        {/* Gradient Overlay */}
        <div className="absolute inset-0 bg-gradient-to-br from-orange-600/95 via-orange-500/90 to-orange-400/80" />
      </div>

      {/* Floating Food Elements */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none">
        {/* Floating Tomato */}
        <motion.div
          animate={{
            y: [0, -30, 0],
            rotate: [0, 5, -5, 0],
          }}
          transition={{
            duration: 4,
            repeat: Infinity,
            ease: "easeInOut"
          }}
          className="absolute top-20 right-20 w-28 h-28 rounded-full overflow-hidden shadow-2xl border-4 border-white/20 bg-red-500"
        >
          <img
            src="https://images.unsplash.com/photo-1561136594-7f68413baa99?w=200&q=80"
            alt=""
            className="w-full h-full object-cover"
          />
        </motion.div>

        {/* Floating Herbs/Vegetables */}
        <motion.div
          animate={{
            y: [0, -20, 0],
            rotate: [0, -10, 0],
          }}
          transition={{
            duration: 5,
            repeat: Infinity,
            ease: "easeInOut",
            delay: 0.5
          }}
          className="absolute bottom-32 left-16 w-36 h-36 rounded-full overflow-hidden shadow-2xl border-4 border-white/20 bg-green-600"
        >
          <img
            src="https://images.unsplash.com/photo-1540420773420-3366772f4999?w=200&q=80"
            alt=""
            className="w-full h-full object-cover"
          />
        </motion.div>

        {/* Floating Lemon */}
        <motion.div
          animate={{
            y: [0, -25, 0],
            rotate: [10, 20, 10],
          }}
          transition={{
            duration: 6,
            repeat: Infinity,
            ease: "easeInOut",
            delay: 1
          }}
          className="absolute top-1/3 right-1/4 w-24 h-24 rounded-full overflow-hidden shadow-2xl border-4 border-white/20 bg-yellow-400"
        >
          <img
            src="https://images.unsplash.com/photo-1582087463261-ddea03f80f5d?w=200&q=80"
            alt=""
            className="w-full h-full object-cover"
          />
        </motion.div>

        {/* Floating Avocado */}
        <motion.div
          animate={{
            y: [0, -15, 0],
            rotate: [-5, 5, -5],
          }}
          transition={{
            duration: 4.5,
            repeat: Infinity,
            ease: "easeInOut",
            delay: 0.8
          }}
          className="absolute bottom-1/4 right-16 w-20 h-20 rounded-full overflow-hidden shadow-2xl border-4 border-white/20 hidden lg:block bg-green-500"
        >
          <img
            src="https://images.unsplash.com/photo-1519162808019-7de1683fa2ad?w=200&q=80"
            alt=""
            className="w-full h-full object-cover"
          />
        </motion.div>
      </div>

      {/* Content */}
      <div className="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-32">
        <div className="max-w-4xl">
          {/* Badge */}
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            className="inline-block mb-6"
          >
            <span className="px-4 py-2 bg-white/20 backdrop-blur-sm text-white rounded-full text-sm font-medium border border-white/30">
              ✨ Transform Your Meal Planning
            </span>
          </motion.div>

          {/* Hero Headline - Dramatic Typography */}
          <motion.h1
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, delay: 0.2 }}
            className="font-playfair text-6xl sm:text-7xl lg:text-8xl xl:text-9xl font-black text-white mb-6 leading-none drop-shadow-lg"
          >
            Never Wonder<br />
            <span className="text-yellow-butter">What's for Dinner</span>
          </motion.h1>

          {/* Subheadline */}
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, delay: 0.4 }}
            className="text-xl sm:text-2xl text-white/90 mb-10 max-w-2xl leading-relaxed drop-shadow"
          >
            Organize recipes, plan weekly meals, and generate smart shopping lists. Your all-in-one meal planning companion.
          </motion.p>

          {/* CTA Buttons */}
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, delay: 0.6 }}
            className="flex flex-col sm:flex-row gap-4"
          >
            <Link to="/app">
              <motion.button
                whileHover={{ scale: 1.05 }}
                whileTap={{ scale: 0.95 }}
                className="px-8 py-4 bg-white text-orange-600 font-bold rounded-xl shadow-2xl hover:shadow-white/20 transition-all flex items-center gap-2 group text-lg"
              >
                Get Started Free
                <ArrowRight className="w-5 h-5 group-hover:translate-x-1 transition-transform" />
              </motion.button>
            </Link>

            <motion.button
              whileHover={{ scale: 1.05 }}
              whileTap={{ scale: 0.95 }}
              className="px-8 py-4 bg-white/10 backdrop-blur-sm text-white font-bold rounded-xl border-2 border-white/30 hover:bg-white/20 transition-all flex items-center gap-2 text-lg"
            >
              <Play className="w-5 h-5" />
              Watch Demo
            </motion.button>
          </motion.div>

          {/* Trust Indicators */}
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ duration: 0.8, delay: 0.8 }}
            className="mt-12 flex flex-wrap gap-6 sm:gap-8 text-white/90"
          >
            <div className="flex items-center gap-2">
              <span className="text-2xl">✓</span>
              <span className="text-sm sm:text-base font-medium">100% Free Forever</span>
            </div>
            <div className="flex items-center gap-2">
              <span className="text-2xl">✓</span>
              <span className="text-sm sm:text-base">No credit card required</span>
            </div>
            <div className="flex items-center gap-2">
              <span className="text-2xl">✓</span>
              <span className="text-sm sm:text-base">Unlimited recipes</span>
            </div>
          </motion.div>
        </div>
      </div>

      {/* Scroll Indicator */}
      <motion.div
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 1, delay: 1.2 }}
        className="absolute bottom-8 left-1/2 transform -translate-x-1/2 z-10"
      >
        <motion.div
          animate={{ y: [0, 10, 0] }}
          transition={{ duration: 2, repeat: Infinity }}
          className="w-6 h-10 border-2 border-white/50 rounded-full flex items-start justify-center p-2"
        >
          <motion.div
            animate={{ y: [0, 12, 0] }}
            transition={{ duration: 2, repeat: Infinity }}
            className="w-1.5 h-3 bg-white/70 rounded-full"
          />
        </motion.div>
      </motion.div>
    </section>
  );
}
