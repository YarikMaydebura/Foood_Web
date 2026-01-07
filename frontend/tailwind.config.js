export default {
  content: ['./index.html', './src/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        orange: {
          50: '#FFF8E8',
          100: '#FFF3E0',
          200: '#FFE8D6',
          400: '#FFB84D',
          500: '#FF8C00',
          600: '#E67E00',
          700: '#CC7000',
          sunset: '#FF6B35',
        },
        yellow: {
          warm: '#FFC93C',
          butter: '#FFE66D',
          soft: '#FFF9E6',
        },
        terracotta: {
          DEFAULT: '#C1666B',
          light: '#FFD5D5',
        },
        sage: '#81B29A',
        cream: {
          DEFAULT: '#FFF8E8',
          peachy: '#FFE8D6',
        },
      },
      fontFamily: {
        playfair: ['Playfair Display', 'serif'],
        sans: ['DM Sans', 'sans-serif'],
      },
      animation: {
        'float': 'float 6s ease-in-out infinite',
        'bounce-ingredient': 'bounceIngredient 2s ease-in-out infinite',
        'blob-morph': 'blobMorph 8s ease-in-out infinite',
        'fade-in': 'fadeIn 0.6s ease-out',
      },
      keyframes: {
        float: {
          '0%, 100%': { transform: 'translateY(0)' },
          '50%': { transform: 'translateY(-20px)' },
        },
        bounceIngredient: {
          '0%, 100%': { transform: 'translateY(0) rotate(0deg)' },
          '25%': { transform: 'translateY(-30px) rotate(5deg)' },
          '75%': { transform: 'translateY(-15px) rotate(-5deg)' },
        },
        blobMorph: {
          '0%, 100%': { borderRadius: '60% 40% 30% 70% / 60% 30% 70% 40%' },
          '50%': { borderRadius: '30% 60% 70% 40% / 50% 60% 30% 60%' },
        },
        fadeIn: {
          '0%': { opacity: '0', transform: 'translateY(20px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
      },
    },
  },
  plugins: [],
};
