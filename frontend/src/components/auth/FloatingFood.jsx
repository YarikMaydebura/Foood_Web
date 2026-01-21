import { motion, useMotionValue, useSpring } from 'framer-motion';
import { useEffect, useState } from 'react';

// Food images from Unsplash
const foodItems = [
  {
    id: 'tomato',
    src: 'https://images.unsplash.com/photo-1561136594-7f68413baa99?w=200&q=80',
    fallbackColor: 'bg-red-500',
    position: { top: '15%', right: '15%' },
    size: 'w-24 h-24 lg:w-28 lg:h-28',
    animation: { duration: 4, delay: 0 },
    parallaxStrength: 0.5
  },
  {
    id: 'herbs',
    src: 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=200&q=80',
    fallbackColor: 'bg-green-600',
    position: { bottom: '20%', left: '10%' },
    size: 'w-28 h-28 lg:w-36 lg:h-36',
    animation: { duration: 5, delay: 0.5 },
    parallaxStrength: 0.3
  },
  {
    id: 'lemon',
    src: 'https://images.unsplash.com/photo-1582087463261-ddea03f80f5d?w=200&q=80',
    fallbackColor: 'bg-yellow-400',
    position: { top: '35%', right: '25%' },
    size: 'w-20 h-20 lg:w-24 lg:h-24',
    animation: { duration: 6, delay: 1 },
    parallaxStrength: 0.7
  },
  {
    id: 'avocado',
    src: 'https://images.unsplash.com/photo-1519162808019-7de1683fa2ad?w=200&q=80',
    fallbackColor: 'bg-green-500',
    position: { bottom: '25%', right: '12%' },
    size: 'w-16 h-16 lg:w-20 lg:h-20 hidden md:block',
    animation: { duration: 4.5, delay: 0.8 },
    parallaxStrength: 0.4
  },
  {
    id: 'orange',
    src: 'https://images.unsplash.com/photo-1547514701-42782101795e?w=200&q=80',
    fallbackColor: 'bg-orange-400',
    position: { top: '60%', left: '15%' },
    size: 'w-16 h-16 lg:w-20 lg:h-20 hidden lg:block',
    animation: { duration: 5.5, delay: 1.2 },
    parallaxStrength: 0.6
  }
];

const FloatingFoodItem = ({ item, mouseX, mouseY }) => {
  const springConfig = { stiffness: 50, damping: 20 };
  const x = useSpring(useMotionValue(0), springConfig);
  const y = useSpring(useMotionValue(0), springConfig);

  useEffect(() => {
    x.set(mouseX * item.parallaxStrength);
    y.set(mouseY * item.parallaxStrength);
  }, [mouseX, mouseY, item.parallaxStrength, x, y]);

  return (
    <motion.div
      style={{ x, y, ...item.position }}
      animate={{
        y: [0, -20, 0],
        rotate: [0, 5, -5, 0],
      }}
      transition={{
        duration: item.animation.duration,
        repeat: Infinity,
        ease: "easeInOut",
        delay: item.animation.delay
      }}
      className={`absolute ${item.size} rounded-full overflow-hidden shadow-2xl border-4 border-white/20 ${item.fallbackColor}`}
    >
      <img
        src={item.src}
        alt=""
        className="w-full h-full object-cover"
        loading="eager"
      />
    </motion.div>
  );
};

export default function FloatingFood() {
  const [mousePosition, setMousePosition] = useState({ x: 0, y: 0 });

  useEffect(() => {
    const handleMouseMove = (e) => {
      // Calculate normalized mouse position (-0.5 to 0.5)
      const x = (e.clientX / window.innerWidth - 0.5) * 40;
      const y = (e.clientY / window.innerHeight - 0.5) * 40;
      setMousePosition({ x, y });
    };

    window.addEventListener('mousemove', handleMouseMove);
    return () => window.removeEventListener('mousemove', handleMouseMove);
  }, []);

  return (
    <div className="absolute inset-0 overflow-hidden pointer-events-none z-0">
      {foodItems.map((item) => (
        <FloatingFoodItem
          key={item.id}
          item={item}
          mouseX={mousePosition.x}
          mouseY={mousePosition.y}
        />
      ))}
    </div>
  );
}
