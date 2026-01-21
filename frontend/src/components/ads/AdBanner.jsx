import { useEffect, useRef } from 'react';

/**
 * AdBanner Component for Adsterra Ads
 *
 * SETUP INSTRUCTIONS:
 * 1. Sign up at https://www.adsterra.com
 * 2. Add your website and get approved
 * 3. Create ad units for each placement
 * 4. Replace the placeholder values below with your Adsterra ad codes
 *
 * Ad Sizes:
 * - "728x90" - Leaderboard (desktop header)
 * - "300x250" - Medium Rectangle (sidebar, in-content)
 * - "320x50" - Mobile Banner
 * - "300x100" - Small Banner
 */

const AD_CONFIG = {
  // Replace these with your actual Adsterra ad configuration
  // You'll get these values from your Adsterra dashboard
  enabled: false, // Set to true when you have your ad codes
  '728x90': {
    key: 'YOUR_ADSTERRA_KEY_728x90',
    format: 'iframe',
    height: 90,
    width: 728,
  },
  '300x250': {
    key: 'YOUR_ADSTERRA_KEY_300x250',
    format: 'iframe',
    height: 250,
    width: 300,
  },
  '320x50': {
    key: 'YOUR_ADSTERRA_KEY_320x50',
    format: 'iframe',
    height: 50,
    width: 320,
  },
};

export default function AdBanner({ size = '728x90', className = '' }) {
  const adRef = useRef(null);
  const config = AD_CONFIG[size];

  useEffect(() => {
    // Only load ads if enabled and we have a valid config
    if (!AD_CONFIG.enabled || !config || !adRef.current) return;

    // Adsterra typically uses a script injection approach
    // This will be customized based on your specific Adsterra code
    const script = document.createElement('script');
    script.async = true;
    script.setAttribute('data-cfasync', 'false');
    // script.src = `//www.adsterra.com/.../${config.key}`;
    // adRef.current.appendChild(script);

    return () => {
      // Cleanup if needed
    };
  }, [config]);

  // If ads are not enabled, show a placeholder (remove in production)
  if (!AD_CONFIG.enabled) {
    return (
      <div
        className={`bg-gray-100 border-2 border-dashed border-gray-300 rounded-lg flex items-center justify-center text-gray-400 text-sm ${className}`}
        style={{
          width: config?.width || 728,
          height: config?.height || 90,
          maxWidth: '100%',
        }}
      >
        <div className="text-center p-2">
          <p>Ad Space ({size})</p>
          <p className="text-xs">Configure in AdBanner.jsx</p>
        </div>
      </div>
    );
  }

  return (
    <div
      ref={adRef}
      className={`ad-container flex items-center justify-center ${className}`}
      style={{
        minWidth: config?.width || 'auto',
        minHeight: config?.height || 'auto',
        maxWidth: '100%',
      }}
    >
      {/* Adsterra ad will be injected here */}
    </div>
  );
}

/**
 * Responsive Ad Banner that switches sizes based on screen width
 */
export function ResponsiveAdBanner({ className = '' }) {
  return (
    <div className={`flex justify-center ${className}`}>
      {/* Desktop: 728x90 */}
      <div className="hidden md:block">
        <AdBanner size="728x90" />
      </div>
      {/* Mobile: 320x50 */}
      <div className="block md:hidden">
        <AdBanner size="320x50" />
      </div>
    </div>
  );
}
