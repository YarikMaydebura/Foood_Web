import { Routes, Route } from "react-router-dom";
import RecipeManager from "./RecipeManager";
import LandingPage from "./pages/LandingPage";

export default function App() {
  return (
    <Routes>
      <Route path="/" element={<LandingPage />} />
      <Route path="/app/*" element={<RecipeManager />} />
    </Routes>
  );
}
