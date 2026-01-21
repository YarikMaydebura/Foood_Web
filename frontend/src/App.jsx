import { Routes, Route, Navigate } from "react-router-dom";
import RecipeManager from "./RecipeManager";
import LandingPage from "./pages/LandingPage";
import AuthPage from "./components/auth/AuthPage";
import PrivacyPolicy from "./pages/PrivacyPolicy";
import RecipeDetailPage from "./pages/RecipeDetailPage";

export default function App() {
  return (
    <Routes>
      <Route path="/" element={<LandingPage />} />
      <Route path="/app/*" element={<RecipeManager />} />
      <Route path="/auth/*" element={<AuthPage />} />
      <Route path="/privacy" element={<PrivacyPolicy />} />
      {/* Public recipe detail page - accessible without login */}
      <Route path="/recipe/:slug" element={<RecipeDetailPage />} />
      {/* Redirect /login and /signup to new auth routes */}
      <Route path="/login" element={<Navigate to="/auth/login" replace />} />
      <Route path="/signup" element={<Navigate to="/auth/signup" replace />} />
    </Routes>
  );
}
