import { motion } from 'framer-motion';
import { useInView } from 'react-intersection-observer';
import { BookOpen, CalendarDays, ShoppingBag, Share2, Clock, Shield } from 'lucide-react';

const features = [
  {
    span: 'col-span-12 lg:col-span-7',
    icon: BookOpen,
    title: 'Smart Recipe Management',
    description: 'Store unlimited recipes from any source. Import from websites, add your own creations, or browse our curated collection. Organize with tags, categories, and custom collections that work for you.',
    bgColor: 'from-orange-500 to-orange-600',
    iconBg: 'bg-white/20',
    foodPhoto: 'https://images.unsplash.com/photo-1495521821757-a1efb6729352?auto=format&fit=crop&w=1200&q=80'
  },
  {
    span: 'col-span-12 lg:col-span-5',
    icon: CalendarDays,
    title: 'Weekly Meal Planner',
    description: 'Drag and drop recipes onto your calendar. Get smart suggestions based on your preferences or let us randomize for variety.',
    bgColor: 'from-yellow-warm to-orange-400',
    iconBg: 'bg-white/20',
    foodPhoto: 'https://images.unsplash.com/photo-1490645935967-10de6ba17061?auto=format&fit=crop&w=1200&q=80'
  },
  {
    span: 'col-span-12 lg:col-span-5',
    icon: ShoppingBag,
    title: 'Auto Shopping Lists',
    description: 'Generate grocery lists instantly from your meal plan. Organized by category, with smart consolidation of duplicate ingredients.',
    bgColor: 'from-terracotta to-orange-500',
    iconBg: 'bg-white/20',
    foodPhoto: 'https://images.unsplash.com/photo-1488459716781-31db52582fe9?auto=format&fit=crop&w=1200&q=80'
  },
  {
    span: 'col-span-12 lg:col-span-7',
    icon: Share2,
    title: 'Share & Collaborate',
    description: 'Share your favorite recipes with family and friends. Build shared meal plans for households. Export recipes in multiple formats.',
    bgColor: 'from-sage to-orange-400',
    iconBg: 'bg-white/20',
    foodPhoto: 'https://images.unsplash.com/photo-1528712306091-ed0763094c98?auto=format&fit=crop&w=1200&q=80'
  },
  {
    span: 'col-span-12 lg:col-span-6',
    icon: Clock,
    title: 'Save Time & Money',
    description: 'Stop wondering what to cook. Reduce food waste with better planning. Stick to your budget with organized shopping lists.',
    bgColor: 'from-orange-400 to-yellow-warm',
    iconBg: 'bg-white/20',
    foodPhoto: 'https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?auto=format&fit=crop&w=1200&q=80'
  },
  {
    span: 'col-span-12 lg:col-span-6',
    icon: Shield,
    title: 'Your Data, Secured',
    description: 'All your recipes and meal plans are safely stored and backed up. Access from any device, anytime, anywhere.',
    bgColor: 'from-orange-600 to-orange-700',
    iconBg: 'bg-white/20',
    foodPhoto: 'https://images.unsplash.com/photo-1498837167922-ddd27525d352?auto=format&fit=crop&w=1200&q=80'
  },
];

const FeatureCard = ({ feature, index }) => {
  const [ref, inView] = useInView({
    threshold: 0.2,
    triggerOnce: true
  });

  return (
    <motion.div
      ref={ref}
      initial={{ opacity: 0, y: 50 }}
      animate={inView ? { opacity: 1, y: 0 } : {}}
      transition={{ duration: 0.6, delay: index * 0.1 }}
      className={`${feature.span} ${index % 2 === 1 ? 'lg:mt-12' : ''}`}
    >
      <motion.div
        whileHover={{ scale: 1.03, y: -8, rotateY: 2 }}
        transition={{ duration: 0.4, type: 'spring', stiffness: 200 }}
        className={`relative h-full min-h-[350px] rounded-3xl overflow-hidden shadow-2xl bg-gradient-to-br ${feature.bgColor} p-8 lg:p-12 group cursor-pointer`}
      >
        {/* Food Photo Background */}
        <div className="absolute inset-0 opacity-15 group-hover:opacity-25 transition-opacity duration-500">
          <img
            src={feature.foodPhoto}
            alt={feature.title}
            className="w-full h-full object-cover"
          />
        </div>

        {/* Gradient Overlay */}
        <div className={`absolute inset-0 bg-gradient-to-br ${feature.bgColor}`} />

        {/* Content */}
        <div className="relative z-10 flex flex-col h-full">
          {/* Icon */}
          <motion.div
            whileHover={{ rotate: 360, scale: 1.15 }}
            transition={{ type: 'spring', stiffness: 300, damping: 15 }}
            className={`w-16 h-16 ${feature.iconBg} backdrop-blur-sm rounded-2xl flex items-center justify-center mb-6 shadow-lg group-hover:bg-white/30 transition-colors`}
          >
            <feature.icon className="w-8 h-8 text-white" />
          </motion.div>

          {/* Title */}
          <h3 className="font-playfair text-3xl lg:text-4xl font-bold text-white mb-4">
            {feature.title}
          </h3>

          {/* Description */}
          <p className="text-white/90 text-lg leading-relaxed flex-grow">
            {feature.description}
          </p>

          {/* Decorative Line */}
          <motion.div
            initial={{ scaleX: 0 }}
            animate={inView ? { scaleX: 1 } : {}}
            transition={{ delay: index * 0.1 + 0.5, duration: 0.6 }}
            className="h-1 w-24 bg-white/40 rounded-full mt-6 origin-left"
          />
        </div>

        {/* Hover Glow Effect */}
        <div className="absolute -inset-1 bg-gradient-to-r from-white/0 via-white/10 to-white/0 opacity-0 group-hover:opacity-100 transition-opacity duration-500 blur-xl" />
      </motion.div>
    </motion.div>
  );
};

export default function FeaturesSection() {
  const [ref, inView] = useInView({
    threshold: 0.1,
    triggerOnce: true
  });

  return (
    <section id="features" className="py-24 bg-cream relative overflow-hidden">
      {/* Organic Blob Shapes in Background */}
      <div className="absolute top-10 right-10 w-96 h-96 bg-yellow-warm/20 rounded-full blur-3xl animate-blob-morph" />
      <div className="absolute bottom-20 left-10 w-80 h-80 bg-orange-400/20 rounded-full blur-3xl animate-blob-morph" style={{ animationDelay: '2s' }} />

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
            Features
          </span>
          <h2 className="font-playfair text-4xl sm:text-5xl lg:text-6xl font-bold text-[#4A3728] mb-4">
            Everything You Need
          </h2>
          <p className="text-xl text-[#6B5344] max-w-2xl mx-auto">
            Powerful features designed to make meal planning effortless and enjoyable.
          </p>
        </motion.div>

        {/* Asymmetric Features Grid */}
        <div className="grid grid-cols-12 gap-6 lg:gap-8">
          {features.map((feature, index) => (
            <FeatureCard key={index} feature={feature} index={index} />
          ))}
        </div>
      </div>
    </section>
  );
}
