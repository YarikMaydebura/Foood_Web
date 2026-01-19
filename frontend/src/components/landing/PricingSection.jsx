import { motion } from 'framer-motion';
import { useInView } from 'react-intersection-observer';
import { Link } from 'react-router-dom';
import { Check, ArrowRight, Gift } from 'lucide-react';

const features = [
  'Unlimited recipe storage',
  'Weekly meal planning',
  'Smart shopping lists',
  'Recipe sharing',
  'Multi-device sync',
  'Priority support',
  'Export to PDF',
  'Nutritional info'
];

export default function PricingSection() {
  const [ref, inView] = useInView({
    threshold: 0.2,
    triggerOnce: true
  });

  return (
    <section id="pricing" className="py-24 relative overflow-hidden">
      {/* Full-Section Gradient Background */}
      <div className="absolute inset-0 bg-gradient-to-br from-orange-500 via-orange-600 to-yellow-warm" />

      {/* Background Food Image */}
      <div className="absolute inset-0">
        <img
          src="https://images.unsplash.com/photo-1495521821757-a1efb6729352?w=1920&q=80"
          alt="Fresh ingredients"
          className="w-full h-full object-cover opacity-20"
        />
      </div>

      {/* Animated Background Blobs */}
      <div className="absolute inset-0 overflow-hidden">
        <motion.div
          animate={{
            scale: [1, 1.2, 1],
            rotate: [0, 90, 0],
          }}
          transition={{
            duration: 20,
            repeat: Infinity,
            ease: "easeInOut"
          }}
          className="absolute top-0 right-0 w-96 h-96 bg-yellow-400/20 rounded-full blur-3xl"
        />
        <motion.div
          animate={{
            scale: [1, 1.3, 1],
            rotate: [0, -90, 0],
          }}
          transition={{
            duration: 25,
            repeat: Infinity,
            ease: "easeInOut"
          }}
          className="absolute bottom-0 left-0 w-96 h-96 bg-orange-400/20 rounded-full blur-3xl"
        />
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        {/* Section Header */}
        <motion.div
          ref={ref}
          initial={{ opacity: 0, y: 30 }}
          animate={inView ? { opacity: 1, y: 0 } : {}}
          transition={{ duration: 0.7 }}
          className="text-center mb-16"
        >
          <span className="inline-block px-4 py-1 bg-white/20 backdrop-blur-sm text-white rounded-full text-sm font-medium mb-4">
            Pricing
          </span>
          <h2 className="font-playfair text-4xl sm:text-5xl lg:text-6xl font-bold text-white mb-4">
            Completely Free
          </h2>
          <p className="text-xl text-white/90 max-w-2xl mx-auto">
            All features included. No hidden costs. No credit card required.
          </p>
        </motion.div>

        {/* Pricing Card */}
        <motion.div
          initial={{ opacity: 0, y: 40 }}
          animate={inView ? { opacity: 1, y: 0 } : {}}
          transition={{ duration: 0.8, delay: 0.2 }}
          className="max-w-5xl mx-auto"
        >
          <div className="bg-white/95 backdrop-blur-sm rounded-3xl p-8 lg:p-12 shadow-2xl">
            <div className="grid lg:grid-cols-2 gap-12 items-center">
              {/* Left: Pricing Info */}
              <div>
                {/* Free Badge */}
                <div className="inline-flex items-center gap-2 px-4 py-2 bg-green-100 text-green-700 rounded-full text-sm font-medium mb-6">
                  <Gift className="w-4 h-4" />
                  100% Free Forever
                </div>

                {/* Price */}
                <div className="mb-6">
                  <span className="font-playfair text-6xl lg:text-7xl font-black text-orange-600">
                    FREE
                  </span>
                </div>

                <p className="text-xl lg:text-2xl text-[#4A3728] mb-8 font-medium">
                  Everything you need to plan amazing meals
                </p>

                {/* Features List */}
                <ul className="space-y-3 mb-8">
                  {features.map((feature, index) => (
                    <motion.li
                      key={index}
                      initial={{ opacity: 0, x: -20 }}
                      animate={inView ? { opacity: 1, x: 0 } : {}}
                      transition={{ delay: 0.4 + index * 0.05 }}
                      className="flex items-center gap-3 text-[#6B5344]"
                    >
                      <div className="flex-shrink-0 w-6 h-6 bg-green-100 rounded-full flex items-center justify-center">
                        <Check className="w-4 h-4 text-green-600" />
                      </div>
                      <span>{feature}</span>
                    </motion.li>
                  ))}
                </ul>

                {/* CTA Button */}
                <Link to="/app">
                  <motion.button
                    whileHover={{ scale: 1.02 }}
                    whileTap={{ scale: 0.98 }}
                    className="w-full px-8 py-4 bg-gradient-to-r from-orange-500 to-orange-600 text-white font-bold rounded-xl shadow-lg hover:shadow-xl transition-all flex items-center justify-center gap-2 group text-lg"
                  >
                    Get Started Free
                    <ArrowRight className="w-5 h-5 group-hover:translate-x-1 transition-transform" />
                  </motion.button>
                </Link>

                <p className="text-sm text-[#6B5344] text-center mt-4">
                  No credit card required
                </p>
              </div>

              {/* Right: Embedded Testimonial with Food Image */}
              <motion.div
                initial={{ opacity: 0, scale: 0.9 }}
                animate={inView ? { opacity: 1, scale: 1 } : {}}
                transition={{ delay: 0.5, duration: 0.6 }}
                className="relative rounded-2xl overflow-hidden"
              >
                {/* Background Image */}
                <div className="absolute inset-0">
                  <img
                    src="https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=600&q=80"
                    alt="Cooking"
                    className="w-full h-full object-cover"
                  />
                  <div className="absolute inset-0 bg-gradient-to-br from-orange-500/90 to-orange-600/90" />
                </div>

                <div className="relative z-10 p-8 lg:p-10">
                  {/* Quote Icon */}
                  <div className="absolute top-6 right-6 text-white/20 text-6xl font-serif leading-none">
                    "
                  </div>

                  {/* Testimonial Content */}
                  <div className="relative">
                    <p className="text-lg lg:text-xl text-white font-medium mb-6 italic leading-relaxed drop-shadow">
                      Foood completely transformed how I plan meals. I save hours every week and my family loves the variety!
                    </p>

                    {/* Customer Info */}
                    <div className="flex items-center gap-4">
                      <div className="w-14 h-14 rounded-full overflow-hidden border-2 border-white/40">
                        <img
                          src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&q=80"
                          alt="Sarah Johnson"
                          className="w-full h-full object-cover"
                        />
                      </div>
                      <div>
                        <div className="font-bold text-white">Sarah Johnson</div>
                        <div className="text-sm text-white/80">Home Cook, Mom of 3</div>
                      </div>
                    </div>

                    {/* Star Rating */}
                    <div className="flex gap-1 mt-4">
                      {[...Array(5)].map((_, i) => (
                        <svg key={i} className="w-5 h-5 text-yellow-300 fill-current" viewBox="0 0 20 20">
                          <path d="M10 15l-5.878 3.09 1.123-6.545L.489 6.91l6.572-.955L10 0l2.939 5.955 6.572.955-4.756 4.635 1.123 6.545z" />
                        </svg>
                      ))}
                    </div>
                  </div>
                </div>
              </motion.div>
            </div>
          </div>
        </motion.div>

        {/* Trust Indicators */}
        <motion.div
          initial={{ opacity: 0 }}
          animate={inView ? { opacity: 1 } : {}}
          transition={{ delay: 0.8 }}
          className="text-center mt-8 text-white/90"
        >
          <p className="text-lg">
            100% Free 100+ happy cooks All features included
          </p>
        </motion.div>
      </div>
    </section>
  );
}
