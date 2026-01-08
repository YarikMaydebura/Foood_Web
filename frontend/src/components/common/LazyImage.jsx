import { useState } from 'react';
import { motion } from 'framer-motion';

export default function LazyImage({
  src,
  alt,
  className = '',
  fallback,
  ...props
}) {
  const [isLoaded, setIsLoaded] = useState(false);
  const [hasError, setHasError] = useState(false);

  // Generate SVG fallback with initials if provided
  const getFallbackSrc = () => {
    if (fallback) return fallback;
    return `data:image/svg+xml,${encodeURIComponent(`
      <svg xmlns="http://www.w3.org/2000/svg" width="200" height="200">
        <rect fill="#FFE8D6" width="200" height="200"/>
        <text x="50%" y="50%" text-anchor="middle" dy=".3em" fill="#FF8C00" font-size="60" font-weight="bold" font-family="Arial">?</text>
      </svg>
    `)}`;
  };

  return (
    <div className={`relative overflow-hidden ${className}`}>
      {/* Skeleton loader */}
      {!isLoaded && !hasError && (
        <div className="absolute inset-0">
          <div className="absolute inset-0 bg-gradient-to-r from-orange-100 via-orange-50 to-orange-100 animate-pulse" />
        </div>
      )}

      {/* Actual image */}
      <motion.img
        src={hasError ? getFallbackSrc() : src}
        alt={alt}
        onLoad={() => setIsLoaded(true)}
        onError={() => setHasError(true)}
        initial={{ opacity: 0 }}
        animate={{ opacity: isLoaded || hasError ? 1 : 0 }}
        transition={{ duration: 0.5 }}
        loading="lazy"
        className="w-full h-full object-cover"
        {...props}
      />
    </div>
  );
}
