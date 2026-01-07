import { motion } from 'framer-motion';
import { useInView } from 'react-intersection-observer';
import { BookOpen, CalendarDays, ShoppingBag } from 'lucide-react';

const steps = [
  {
    number: "01",
    title: "Add Your Recipes",
    description: "Import recipes from anywhere or create your own. Organize with tags, categories, and custom collections. Search and filter with ease.",
    icon: BookOpen,
  },
  {
    number: "02",
    title: "Plan Your Week",
    description: "Drag and drop recipes onto your weekly calendar. Use smart suggestions based on your preferences or randomize for variety.",
    icon: CalendarDays,
  },
  {
    number: "03",
    title: "Shop Smart",
    description: "Get an auto-generated shopping list organized by category. Check off items as you shop. Never forget an ingredient again.",
    icon: ShoppingBag,
  }
];

const StepItem = ({ step, index, isReversed }) => {
  const [ref, inView] = useInView({
    threshold: 0.3,
    triggerOnce: true
  });

  return (
    <motion.div
      ref={ref}
      initial={{ opacity: 0, x: isReversed ? 50 : -50 }}
      animate={inView ? { opacity: 1, x: 0 } : {}}
      transition={{ duration: 0.7, delay: index * 0.2 }}
      className={`flex flex-col ${isReversed ? 'lg:flex-row-reverse' : 'lg:flex-row'} items-center gap-12 lg:gap-16`}
    >
      {/* Visual Side */}
      <div className="flex-1 w-full">
        <motion.div
          whileHover={{ scale: 1.02 }}
          className="relative"
        >
          {/* Glow Effect */}
          <div className="absolute -inset-6 bg-gradient-to-br from-orange-200 to-orange-100 rounded-3xl blur-3xl opacity-30" />

          {/* Card */}
          <div className="relative bg-gradient-to-br from-white via-orange-50/50 to-orange-100/30 p-12 shadow-2xl rounded-3xl backdrop-blur-sm border border-orange-100">
            {/* Icon */}
            <motion.div
              animate={{
                y: [0, -10, 0],
              }}
              transition={{
                duration: 3,
                repeat: Infinity,
                ease: "easeInOut",
                delay: index * 0.5
              }}
              className="text-center"
            >
              <div className="w-24 h-24 mx-auto bg-gradient-to-br from-orange-400 to-orange-600 rounded-2xl flex items-center justify-center shadow-lg mb-4">
                <step.icon className="w-12 h-12 text-white" />
              </div>
            </motion.div>
          </div>
        </motion.div>
      </div>

      {/* Content Side */}
      <div className="flex-1">
        {/* Step Number */}
        <motion.span
          initial={{ opacity: 0, scale: 0 }}
          animate={inView ? { opacity: 1, scale: 1 } : {}}
          transition={{ delay: index * 0.2 + 0.3, type: 'spring' }}
          className="font-playfair text-8xl lg:text-9xl font-black text-orange-200 leading-none block mb-4"
        >
          {step.number}
        </motion.span>

        {/* Title */}
        <motion.h3
          initial={{ opacity: 0, y: 20 }}
          animate={inView ? { opacity: 1, y: 0 } : {}}
          transition={{ delay: index * 0.2 + 0.4 }}
          className="font-playfair text-3xl lg:text-4xl font-bold text-[#4A3728] mb-4 -mt-10"
        >
          {step.title}
        </motion.h3>

        {/* Description */}
        <motion.p
          initial={{ opacity: 0, y: 20 }}
          animate={inView ? { opacity: 1, y: 0 } : {}}
          transition={{ delay: index * 0.2 + 0.5 }}
          className="text-lg text-[#6B5344] leading-relaxed"
        >
          {step.description}
        </motion.p>

        {/* Decorative Line */}
        <motion.div
          initial={{ scaleX: 0 }}
          animate={inView ? { scaleX: 1 } : {}}
          transition={{ delay: index * 0.2 + 0.6, duration: 0.6 }}
          className="h-1 w-24 bg-gradient-to-r from-orange-500 to-orange-300 rounded-full mt-6 origin-left"
        />
      </div>
    </motion.div>
  );
};

export default function HowItWorksSection() {
  const [ref, inView] = useInView({
    threshold: 0.1,
    triggerOnce: true
  });

  return (
    <section id="how-it-works" className="py-24 bg-gradient-to-b from-orange-50 to-cream-peachy relative overflow-hidden">
      {/* Background Pattern */}
      <div className="absolute inset-0 opacity-5">
        <div className="absolute inset-0" style={{
          backgroundImage: `url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23FF8C00' fill-opacity='1'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E")`,
        }} />
      </div>

      {/* Curved Connector - SVG Path */}
      <div className="absolute top-1/4 left-0 right-0 hidden lg:block pointer-events-none">
        <svg className="w-full h-96" viewBox="0 0 1440 400" preserveAspectRatio="none">
          <motion.path
            initial={{ pathLength: 0, opacity: 0 }}
            animate={inView ? { pathLength: 1, opacity: 0.2 } : {}}
            transition={{ duration: 2, ease: "easeInOut" }}
            d="M0,200 Q360,100 720,200 T1440,200"
            stroke="#FF8C00"
            strokeWidth="3"
            fill="none"
            strokeDasharray="10,10"
          />
        </svg>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        {/* Section Header */}
        <motion.div
          ref={ref}
          initial={{ opacity: 0, y: 30 }}
          animate={inView ? { opacity: 1, y: 0 } : {}}
          transition={{ duration: 0.7 }}
          className="text-center mb-20"
        >
          <span className="inline-block px-4 py-1 bg-orange-100 text-orange-600 rounded-full text-sm font-medium mb-4">
            How It Works
          </span>
          <h2 className="font-playfair text-4xl sm:text-5xl lg:text-6xl font-bold text-[#4A3728] mb-4">
            Simple as 1, 2, 3
          </h2>
          <p className="text-xl text-[#6B5344] max-w-2xl mx-auto">
            Get started in minutes and transform your meal planning workflow forever.
          </p>
        </motion.div>

        {/* Steps */}
        <div className="space-y-32">
          {steps.map((step, index) => (
            <StepItem
              key={index}
              step={step}
              index={index}
              isReversed={index % 2 === 1}
            />
          ))}
        </div>
      </div>
    </section>
  );
}
