import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    host: '0.0.0.0', // Allow network access
    port: 5173,
  },
  build: {
    rollupOptions: {
      output: {
        manualChunks(id) {
          if (id.includes('node_modules')) {
            // Keep React packages together
            if (id.includes('react') || id.includes('react-dom') || id.includes('react-router')) {
              return 'react-vendor';
            }
            // Keep Framer Motion in its own chunk
            if (id.includes('framer-motion')) {
              return 'framer-motion';
            }
            // Keep Lucide icons in its own chunk
            if (id.includes('lucide-react')) {
              return 'lucide-icons';
            }
            // Other vendor packages
            return id.toString().split('node_modules/')[1].split('/')[0].toString();
          }
        }
      }
    }
  }
})
