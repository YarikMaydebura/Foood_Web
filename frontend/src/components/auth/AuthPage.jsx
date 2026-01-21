import { useState, useEffect } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import { motion, AnimatePresence } from 'framer-motion';
import FloatingFood from './FloatingFood';
import LoginForm from './LoginForm';
import SignupForm from './SignupForm';
import EmailVerification from './EmailVerification';
import ForgotPassword from './ForgotPassword';
import OnboardingBubbles from './OnboardingBubbles';

const API_BASE_URL = import.meta.env.VITE_API_BASE_URL ?? "http://127.0.0.1:8000";

// Auth API functions
export const authApi = {
  login: async (email, password) => {
    try {
      const response = await fetch(`${API_BASE_URL}/auth/login`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, password }),
      });
      const data = await response.json();
      if (!response.ok) return { error: data.detail || "Login failed" };
      if (data.access_token) {
        localStorage.setItem("authToken", data.access_token);
      }
      return data;
    } catch (err) {
      return { error: "Network error" };
    }
  },

  signup: async (name, email, password) => {
    try {
      const response = await fetch(`${API_BASE_URL}/auth/signup`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ name, email, password }),
      });
      const data = await response.json();
      if (!response.ok) return { error: data.detail || "Signup failed" };
      return data;
    } catch (err) {
      return { error: "Network error" };
    }
  },

  verifyEmail: async (email, code) => {
    try {
      const response = await fetch(`${API_BASE_URL}/auth/verify-email`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, code }),
      });
      const data = await response.json();
      if (!response.ok) return { error: data.detail || "Verification failed" };
      return data;
    } catch (err) {
      return { error: "Network error" };
    }
  },

  resendCode: async (email) => {
    try {
      const response = await fetch(`${API_BASE_URL}/auth/resend-code`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email }),
      });
      const data = await response.json();
      if (!response.ok) return { error: data.detail || "Failed to resend code" };
      return data;
    } catch (err) {
      return { error: "Network error" };
    }
  },

  forgotPassword: async (email) => {
    try {
      const response = await fetch(`${API_BASE_URL}/auth/forgot-password`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email }),
      });
      const data = await response.json();
      if (!response.ok) return { error: data.detail || "Request failed" };
      return data;
    } catch (err) {
      return { error: "Network error" };
    }
  },

  resetPassword: async (email, code, newPassword) => {
    try {
      const response = await fetch(`${API_BASE_URL}/auth/reset-password`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, code, new_password: newPassword }),
      });
      const data = await response.json();
      if (!response.ok) return { error: data.detail || "Reset failed" };
      return data;
    } catch (err) {
      return { error: "Network error" };
    }
  },

  completeOnboarding: async (dietPreferences, cuisinePreferences) => {
    try {
      const token = localStorage.getItem("authToken");
      const response = await fetch(`${API_BASE_URL}/onboarding/complete`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          ...(token && { Authorization: `Bearer ${token}` }),
        },
        body: JSON.stringify({
          diet_preferences: dietPreferences,
          cuisine_preferences: cuisinePreferences,
        }),
      });
      const data = await response.json();
      if (!response.ok) return { error: data.detail || "Onboarding failed" };
      return data;
    } catch (err) {
      return { error: "Network error" };
    }
  },

  skipOnboarding: async () => {
    try {
      const token = localStorage.getItem("authToken");
      const response = await fetch(`${API_BASE_URL}/onboarding/skip`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          ...(token && { Authorization: `Bearer ${token}` }),
        },
      });
      const data = await response.json();
      if (!response.ok) return { error: data.detail || "Skip failed" };
      return data;
    } catch (err) {
      return { error: "Network error" };
    }
  },

  loginAfterVerification: async (email, password) => {
    try {
      const response = await fetch(`${API_BASE_URL}/auth/login`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, password }),
      });
      const data = await response.json();
      if (!response.ok) return { error: data.detail || "Login failed" };
      if (data.access_token) {
        localStorage.setItem("authToken", data.access_token);
      }
      return data;
    } catch (err) {
      return { error: "Network error" };
    }
  }
};

// Auth views enum
const AUTH_VIEWS = {
  LOGIN: 'login',
  SIGNUP: 'signup',
  VERIFY_EMAIL: 'verify-email',
  FORGOT_PASSWORD: 'forgot-password',
  ONBOARDING: 'onboarding'
};

export default function AuthPage() {
  const navigate = useNavigate();
  const location = useLocation();

  // Determine initial view from URL path
  const getInitialView = () => {
    const path = location.pathname.split('/').pop();
    if (Object.values(AUTH_VIEWS).includes(path)) {
      return path;
    }
    return AUTH_VIEWS.LOGIN;
  };

  const [currentView, setCurrentView] = useState(getInitialView());
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState(''); // Store for post-verification login
  const [user, setUser] = useState(null);

  // Update URL when view changes
  useEffect(() => {
    const newPath = `/auth/${currentView}`;
    if (location.pathname !== newPath) {
      navigate(newPath, { replace: true });
    }
  }, [currentView, navigate, location.pathname]);

  // Handle successful login
  const handleLoginSuccess = (userData) => {
    setUser(userData);
    // Check if onboarding is needed
    if (!userData.user?.onboarding_completed) {
      setCurrentView(AUTH_VIEWS.ONBOARDING);
    } else {
      navigate('/app');
    }
  };

  // Handle signup - go to email verification
  const handleSignupSuccess = (userEmail, userPassword) => {
    setEmail(userEmail);
    setPassword(userPassword);
    setCurrentView(AUTH_VIEWS.VERIFY_EMAIL);
  };

  // Handle email verification success
  const handleVerificationSuccess = async () => {
    // Auto-login after verification
    const result = await authApi.loginAfterVerification(email, password);
    if (!result.error) {
      setUser(result.user);
      setCurrentView(AUTH_VIEWS.ONBOARDING);
    } else {
      // Fallback to login page if auto-login fails
      setCurrentView(AUTH_VIEWS.LOGIN);
    }
  };

  // Handle onboarding completion
  const handleOnboardingComplete = () => {
    navigate('/app');
  };

  // Handle forgot password flow
  const handleForgotPasswordSuccess = () => {
    setCurrentView(AUTH_VIEWS.LOGIN);
  };

  // Page transition variants
  const pageVariants = {
    initial: { opacity: 0, x: 20 },
    animate: { opacity: 1, x: 0 },
    exit: { opacity: 0, x: -20 }
  };

  return (
    <div className="min-h-screen relative overflow-hidden">
      {/* Background Gradient */}
      <div className="absolute inset-0 bg-gradient-to-br from-orange-600/95 via-orange-500/90 to-orange-400/80" />

      {/* Background Food Image */}
      <div className="absolute inset-0">
        <img
          src="https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=1920&q=80"
          alt=""
          className="w-full h-full object-cover opacity-20"
        />
      </div>

      {/* Floating Food Elements (except on onboarding) */}
      {currentView !== AUTH_VIEWS.ONBOARDING && <FloatingFood />}

      {/* Content */}
      <div className="relative z-10 min-h-screen flex items-center justify-center p-4">
        <AnimatePresence mode="wait">
          <motion.div
            key={currentView}
            variants={pageVariants}
            initial="initial"
            animate="animate"
            exit="exit"
            transition={{ duration: 0.3 }}
            className="w-full max-w-md"
          >
            {currentView === AUTH_VIEWS.LOGIN && (
              <LoginForm
                onSuccess={handleLoginSuccess}
                onSwitchToSignup={() => setCurrentView(AUTH_VIEWS.SIGNUP)}
                onForgotPassword={() => setCurrentView(AUTH_VIEWS.FORGOT_PASSWORD)}
                api={authApi}
              />
            )}

            {currentView === AUTH_VIEWS.SIGNUP && (
              <SignupForm
                onSuccess={handleSignupSuccess}
                onSwitchToLogin={() => setCurrentView(AUTH_VIEWS.LOGIN)}
                api={authApi}
              />
            )}

            {currentView === AUTH_VIEWS.VERIFY_EMAIL && (
              <EmailVerification
                email={email}
                onSuccess={handleVerificationSuccess}
                onBack={() => setCurrentView(AUTH_VIEWS.LOGIN)}
                api={authApi}
              />
            )}

            {currentView === AUTH_VIEWS.FORGOT_PASSWORD && (
              <ForgotPassword
                onSuccess={handleForgotPasswordSuccess}
                onBack={() => setCurrentView(AUTH_VIEWS.LOGIN)}
                api={authApi}
              />
            )}

            {currentView === AUTH_VIEWS.ONBOARDING && (
              <OnboardingBubbles
                onComplete={handleOnboardingComplete}
                api={authApi}
              />
            )}
          </motion.div>
        </AnimatePresence>
      </div>
    </div>
  );
}
