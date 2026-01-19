import { motion } from 'framer-motion';
import { useInView } from 'react-intersection-observer';

const testimonials = [
  {
    quote: "Foood has completely transformed my weekly routine. I used to stress about meal planning every single day. Now it's effortless!",
    name: "Sarah Johnson",
    role: "Home Cook, Mom of 3",
    image: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150&q=80",
    bgColor: "from-orange-500 to-orange-600",
    foodImage: "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=400&q=80"
  },
  {
    quote: "As someone who loves cooking but hates planning, this app is perfect. The smart shopping lists alone are worth it!",
    name: "Michael Chen",
    role: "Food Enthusiast",
    image: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&q=80",
    bgColor: "from-amber-500 to-orange-500",
    foodImage: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400&q=80"
  },
  {
    quote: "I've tried so many meal planning apps, but Foood is the first one I actually enjoy using. It's beautiful and intuitive.",
    name: "Emily Rodriguez",
    role: "Busy Professional",
    image: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&q=80",
    bgColor: "from-rose-500 to-orange-500",
    foodImage: "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=400&q=80"
  },
  {
    quote: "The recipe organization is fantastic. I finally have all my family recipes in one place and can easily share them!",
    name: "David Kim",
    role: "Home Chef",
    image: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150&q=80",
    bgColor: "from-emerald-600 to-teal-600",
    foodImage: "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=400&q=80"
  },
  {
    quote: "Love how it consolidates ingredients across multiple recipes. No more buying duplicate items at the grocery store!",
    name: "Lisa Thompson",
    role: "Budget-Conscious Cook",
    image: "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150&q=80",
    bgColor: "from-purple-600 to-pink-600",
    foodImage: "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400&q=80"
  }
];

const TestimonialCard = ({ testimonial, index }) => {
  const [ref, inView] = useInView({
    threshold: 0.2,
    triggerOnce: true
  });

  return (
    <motion.div
      ref={ref}
      initial={{ opacity: 0, y: 40 }}
      animate={inView ? { opacity: 1, y: 0 } : {}}
      transition={{ duration: 0.6, delay: index * 0.1 }}
      className={`${index === 1 || index === 4 ? 'md:mt-16' : ''}`}
    >
      <motion.div
        whileHover={{ y: -8, scale: 1.02 }}
        transition={{ duration: 0.3 }}
        className="relative h-full group cursor-pointer"
      >
        {/* Card Background with Food Image */}
        <div className="relative h-full min-h-[420px] rounded-3xl overflow-hidden shadow-xl">
          {/* Background Food Image */}
          <div className="absolute inset-0">
            <img
              src={testimonial.foodImage}
              alt="Delicious food"
              className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110"
            />
            <div className={`absolute inset-0 bg-gradient-to-br ${testimonial.bgColor} opacity-90`} />
            <div className="absolute inset-0 bg-gradient-to-t from-black/50 via-transparent to-transparent" />
          </div>

          <div className="relative z-10 p-8 lg:p-10 flex flex-col justify-between h-full">
            {/* Quote Icon */}
            <div className="absolute top-6 right-6 text-white/20 text-8xl font-serif leading-none">
              "
            </div>

            {/* Quote */}
            <div className="relative z-10">
              <p className="text-white text-lg lg:text-xl font-medium leading-relaxed mb-8 italic drop-shadow">
                "{testimonial.quote}"
              </p>
            </div>

            {/* Customer Info */}
            <div className="relative z-10">
              <div className="flex items-center gap-4">
                <div className="w-16 h-16 rounded-full overflow-hidden border-3 border-white/40 shadow-lg">
                  <img
                    src={testimonial.image}
                    alt={testimonial.name}
                    className="w-full h-full object-cover"
                  />
                </div>
                <div>
                  <div className="font-bold text-white text-lg drop-shadow">{testimonial.name}</div>
                  <div className="text-white/90 text-sm">{testimonial.role}</div>
                </div>
              </div>

              {/* Star Rating */}
              <div className="flex gap-1 mt-4">
                {[...Array(5)].map((_, i) => (
                  <svg key={i} className="w-5 h-5 text-yellow-300 fill-current drop-shadow" viewBox="0 0 20 20">
                    <path d="M10 15l-5.878 3.09 1.123-6.545L.489 6.91l6.572-.955L10 0l2.939 5.955 6.572.955-4.756 4.635 1.123 6.545z" />
                  </svg>
                ))}
              </div>
            </div>
          </div>

          {/* Hover Glow Effect */}
          <div className="absolute -inset-1 bg-gradient-to-r from-white/0 via-white/20 to-white/0 opacity-0 group-hover:opacity-100 transition-opacity duration-500 blur-xl" />
        </div>
      </motion.div>
    </motion.div>
  );
};

export default function TestimonialsSection() {
  const [ref, inView] = useInView({
    threshold: 0.1,
    triggerOnce: true
  });

  return (
    <section className="py-24 bg-white relative overflow-hidden">
      {/* Background Decorations */}
      <div className="absolute top-20 left-10 w-64 h-64 bg-orange-100 rounded-full blur-3xl opacity-50" />
      <div className="absolute bottom-20 right-10 w-80 h-80 bg-yellow-100 rounded-full blur-3xl opacity-50" />

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
            Testimonials
          </span>
          <h2 className="font-playfair text-4xl sm:text-5xl lg:text-6xl font-bold text-[#4A3728] mb-4">
            Loved by Home Cooks
          </h2>
          <p className="text-xl text-[#6B5344] max-w-2xl mx-auto">
            Join happy home cooks who have transformed their meal planning with Foood.
          </p>
        </motion.div>

        {/* Masonry Grid of Testimonials */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {testimonials.map((testimonial, index) => (
            <TestimonialCard key={index} testimonial={testimonial} index={index} />
          ))}
        </div>

        {/* Bottom CTA */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={inView ? { opacity: 1, y: 0 } : {}}
          transition={{ delay: 0.8 }}
          className="text-center mt-16"
        >
          <p className="text-lg text-[#6B5344] mb-4">
            Ready to join them?
          </p>
          <div className="inline-flex items-center gap-2 px-6 py-2 bg-orange-100 text-orange-600 rounded-full text-sm font-medium">
            4.9/5 from 100+ reviews
          </div>
        </motion.div>
      </div>
    </section>
  );
}
