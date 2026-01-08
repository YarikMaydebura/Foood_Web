import { motion } from 'framer-motion';
import { Link } from 'react-router-dom';
import { ArrowRight, Play } from 'lucide-react';
import ParallaxImage from '../common/ParallaxImage';

export default function HeroSection() {
  return (
    <section className="relative min-h-screen flex items-center overflow-hidden">
      {/* Parallax Food Photography Background */}
      <div className="absolute inset-0">
        {/* Beautiful food background image with parallax effect */}
        <ParallaxImage
          src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1920&q=80"
          alt="Delicious food spread"
          speed={0.3}
          className="h-full"
        />

        {/* Diagonal Overlay Gradient */}
        <div
          className="absolute inset-0 bg-gradient-to-br from-orange-600/90 via-orange-500/80 to-transparent"
          style={{ clipPath: 'polygon(0 0, 100% 0, 100% 85%, 0 100%)' }}
        />
      </div>

      {/* Floating Real Food Ingredients */}
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
          className="absolute top-20 right-20 w-32 h-32 drop-shadow-2xl"
        >
          <img
            src="https://images.unsplash.com/photo-1546470427-227c52abde65?auto=format&fit=crop&w=200&q=80"
            alt="Tomato"
            className="w-full h-full object-contain rounded-full bg-white/10 backdrop-blur-sm p-2"
          />
        </motion.div>

        {/* Floating Avocado */}
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
          className="absolute bottom-32 left-16 w-40 h-40 drop-shadow-2xl"
        >
          <img
            src="https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?auto=format&fit=crop&w=200&q=80"
            alt="Avocado"
            className="w-full h-full object-contain rounded-full bg-white/10 backdrop-blur-sm p-2"
          />
        </motion.div>

        {/* Floating Basil */}
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
          className="absolute top-1/3 right-1/4 w-24 h-24 drop-shadow-2xl"
        >
          <img
            src="https://images.unsplash.com/photo-1618164436241-4473940d1f5c?auto=format&fit=crop&w=200&q=80"
            alt="Basil leaves"
            className="w-full h-full object-contain rounded-full bg-white/10 backdrop-blur-sm p-2"
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
            className="font-playfair text-6xl sm:text-7xl lg:text-8xl xl:text-9xl font-black text-white mb-6 leading-none"
          >
            Never Wonder<br />
            <span className="text-yellow-butter">What's for Dinner</span>
          </motion.h1>

          {/* Subheadline */}
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, delay: 0.4 }}
            className="text-xl sm:text-2xl text-white/90 mb-10 max-w-2xl leading-relaxed"
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
                Start Free Trial
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
            className="mt-12 flex flex-wrap gap-6 sm:gap-8 text-white/80"
          >
            <div className="flex items-center gap-2">
              <span className="text-2xl">✓</span>
              <span className="text-sm sm:text-base">7-day free trial</span>
            </div>
            <div className="flex items-center gap-2">
              <span className="text-2xl">✓</span>
              <span className="text-sm sm:text-base">No credit card required</span>
            </div>
            <div className="flex items-center gap-2">
              <span className="text-2xl">✓</span>
              <span className="text-sm sm:text-base">Cancel anytime</span>
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
