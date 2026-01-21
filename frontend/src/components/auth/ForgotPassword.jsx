import { useState, useRef, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { ArrowLeft, Mail, Lock, Eye, EyeOff, Check, KeyRound } from 'lucide-react';

const STEPS = {
  EMAIL: 'email',
  CODE: 'code',
  NEW_PASSWORD: 'new_password',
  SUCCESS: 'success'
};

export default function ForgotPassword({ onSuccess, onBack, api }) {
  const [step, setStep] = useState(STEPS.EMAIL);
  const [email, setEmail] = useState('');
  const [code, setCode] = useState(['', '', '', '', '', '']);
  const [newPassword, setNewPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [showPassword, setShowPassword] = useState(false);
  const [showConfirmPassword, setShowConfirmPassword] = useState(false);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const inputRefs = useRef([]);

  // Password validation (must match backend requirements)
  const passwordChecks = {
    length: newPassword.length >= 8,
    hasUppercase: /[A-Z]/.test(newPassword),
    hasLowercase: /[a-z]/.test(newPassword),
    hasNumber: /\d/.test(newPassword),
  };
  const allPasswordChecks = Object.values(passwordChecks).every(Boolean);
  const passwordsMatch = newPassword === confirmPassword && confirmPassword.length > 0;

  const handleEmailSubmit = async (e) => {
    e.preventDefault();
    if (!email || !email.includes('@')) {
      setError('Please enter a valid email');
      return;
    }

    setLoading(true);
    setError('');

    try {
      const result = await api.forgotPassword(email);
      if (result.error) {
        setError(result.error);
      } else {
        setStep(STEPS.CODE);
      }
    } catch (err) {
      setError('Connection error. Please try again.');
    } finally {
      setLoading(false);
    }
  };

  const handleCodeChange = (index, value) => {
    if (value && !/^\d$/.test(value)) return;

    const newCode = [...code];
    newCode[index] = value;
    setCode(newCode);
    setError('');

    if (value && index < 5) {
      inputRefs.current[index + 1]?.focus();
    }
  };

  const handleCodeKeyDown = (index, e) => {
    if (e.key === 'Backspace') {
      if (code[index] === '' && index > 0) {
        inputRefs.current[index - 1]?.focus();
      } else {
        const newCode = [...code];
        newCode[index] = '';
        setCode(newCode);
      }
    }
    if (e.key === 'ArrowLeft' && index > 0) {
      inputRefs.current[index - 1]?.focus();
    }
    if (e.key === 'ArrowRight' && index < 5) {
      inputRefs.current[index + 1]?.focus();
    }
  };

  const handleCodeSubmit = () => {
    const fullCode = code.join('');
    if (fullCode.length !== 6) {
      setError('Please enter the complete 6-digit code');
      return;
    }
    setError('');
    setStep(STEPS.NEW_PASSWORD);
  };

  // Auto-proceed when code is complete
  useEffect(() => {
    if (step === STEPS.CODE && code.every(d => d !== '')) {
      handleCodeSubmit();
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [code, step]);

  const handlePasswordSubmit = async (e) => {
    e.preventDefault();

    if (!allPasswordChecks) {
      setError('Password must be 8+ characters with uppercase, lowercase, and number');
      return;
    }
    if (newPassword !== confirmPassword) {
      setError('Passwords do not match');
      return;
    }

    setLoading(true);
    setError('');

    try {
      const result = await api.resetPassword(email, code.join(''), newPassword);
      if (result.error) {
        setError(result.error);
        // If code is invalid, go back to code step
        if (result.error.toLowerCase().includes('code')) {
          setCode(['', '', '', '', '', '']);
          setStep(STEPS.CODE);
        }
      } else {
        setStep(STEPS.SUCCESS);
      }
    } catch (err) {
      setError('Connection error. Please try again.');
    } finally {
      setLoading(false);
    }
  };

  const renderStep = () => {
    switch (step) {
      case STEPS.EMAIL:
        return (
          <motion.div
            initial={{ opacity: 0, x: 20 }}
            animate={{ opacity: 1, x: 0 }}
            exit={{ opacity: 0, x: -20 }}
          >
            <div className="text-center mb-8">
              <motion.div
                initial={{ scale: 0 }}
                animate={{ scale: 1 }}
                transition={{ type: 'spring', stiffness: 200, delay: 0.1 }}
                className="inline-flex items-center justify-center w-20 h-20 bg-gradient-to-br from-orange-100 to-orange-200 rounded-full mb-4"
              >
                <KeyRound className="w-10 h-10 text-orange-600" />
              </motion.div>
              <h1 className="font-playfair text-3xl font-bold text-gray-800 mb-2">Forgot Password?</h1>
              <p className="text-gray-600">
                No worries! Enter your email and we'll send you a reset code.
              </p>
            </div>

            <form onSubmit={handleEmailSubmit} className="space-y-5">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Email Address
                </label>
                <div className="relative">
                  <Mail className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400" />
                  <input
                    type="email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    placeholder="you@example.com"
                    className="w-full pl-12 pr-4 py-3.5 bg-gray-50 border border-gray-200 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-transparent transition-all text-gray-900 placeholder-gray-400"
                  />
                </div>
              </div>

              <motion.button
                type="submit"
                disabled={loading}
                whileHover={{ scale: loading ? 1 : 1.02 }}
                whileTap={{ scale: loading ? 1 : 0.98 }}
                className="w-full py-4 bg-gradient-to-r from-orange-500 to-orange-600 text-white font-semibold rounded-xl shadow-lg hover:shadow-xl transition-all disabled:opacity-70 disabled:cursor-not-allowed flex items-center justify-center gap-2"
              >
                {loading ? (
                  <>
                    <div className="w-5 h-5 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                    <span>Sending...</span>
                  </>
                ) : (
                  <span>Send Reset Code</span>
                )}
              </motion.button>
            </form>
          </motion.div>
        );

      case STEPS.CODE:
        return (
          <motion.div
            initial={{ opacity: 0, x: 20 }}
            animate={{ opacity: 1, x: 0 }}
            exit={{ opacity: 0, x: -20 }}
          >
            <div className="text-center mb-8">
              <motion.div
                initial={{ scale: 0 }}
                animate={{ scale: 1 }}
                transition={{ type: 'spring', stiffness: 200, delay: 0.1 }}
                className="inline-flex items-center justify-center w-20 h-20 bg-gradient-to-br from-orange-100 to-orange-200 rounded-full mb-4"
              >
                <Mail className="w-10 h-10 text-orange-600" />
              </motion.div>
              <h1 className="font-playfair text-3xl font-bold text-gray-800 mb-2">Enter Code</h1>
              <p className="text-gray-600">
                We've sent a 6-digit code to
                <br />
                <span className="font-semibold text-gray-800">{email}</span>
              </p>
            </div>

            <div className="flex justify-center gap-2 sm:gap-3 mb-6">
              {code.map((digit, index) => (
                <motion.input
                  key={index}
                  ref={(el) => (inputRefs.current[index] = el)}
                  type="text"
                  inputMode="numeric"
                  maxLength={1}
                  value={digit}
                  onChange={(e) => handleCodeChange(index, e.target.value)}
                  onKeyDown={(e) => handleCodeKeyDown(index, e)}
                  initial={{ opacity: 0, y: 20 }}
                  animate={{ opacity: 1, y: 0 }}
                  transition={{ delay: index * 0.05 }}
                  className={`w-12 h-14 sm:w-14 sm:h-16 text-center text-2xl font-bold border-2 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-orange-500 transition-all ${
                    digit ? 'border-orange-400 bg-orange-50' : 'border-gray-200 bg-gray-50'
                  } text-gray-900`}
                />
              ))}
            </div>

            <motion.button
              onClick={handleCodeSubmit}
              disabled={code.some(d => d === '')}
              whileHover={{ scale: 1.02 }}
              whileTap={{ scale: 0.98 }}
              className="w-full py-4 bg-gradient-to-r from-orange-500 to-orange-600 text-white font-semibold rounded-xl shadow-lg hover:shadow-xl transition-all disabled:opacity-70 disabled:cursor-not-allowed"
            >
              Continue
            </motion.button>

            <button
              onClick={() => setStep(STEPS.EMAIL)}
              className="w-full mt-4 py-3 text-gray-600 hover:text-gray-800 font-medium transition-colors"
            >
              Try a different email
            </button>
          </motion.div>
        );

      case STEPS.NEW_PASSWORD:
        return (
          <motion.div
            initial={{ opacity: 0, x: 20 }}
            animate={{ opacity: 1, x: 0 }}
            exit={{ opacity: 0, x: -20 }}
          >
            <div className="text-center mb-8">
              <motion.div
                initial={{ scale: 0 }}
                animate={{ scale: 1 }}
                transition={{ type: 'spring', stiffness: 200, delay: 0.1 }}
                className="inline-flex items-center justify-center w-20 h-20 bg-gradient-to-br from-orange-100 to-orange-200 rounded-full mb-4"
              >
                <Lock className="w-10 h-10 text-orange-600" />
              </motion.div>
              <h1 className="font-playfair text-3xl font-bold text-gray-800 mb-2">New Password</h1>
              <p className="text-gray-600">Create a strong password for your account.</p>
            </div>

            <form onSubmit={handlePasswordSubmit} className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  New Password
                </label>
                <div className="relative">
                  <Lock className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400" />
                  <input
                    type={showPassword ? 'text' : 'password'}
                    value={newPassword}
                    onChange={(e) => setNewPassword(e.target.value)}
                    placeholder="Enter new password"
                    className="w-full pl-12 pr-12 py-3.5 bg-gray-50 border border-gray-200 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-transparent transition-all text-gray-900 placeholder-gray-400"
                  />
                  <button
                    type="button"
                    onClick={() => setShowPassword(!showPassword)}
                    className="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600 transition-colors"
                  >
                    {showPassword ? <EyeOff className="w-5 h-5" /> : <Eye className="w-5 h-5" />}
                  </button>
                </div>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Confirm Password
                </label>
                <div className="relative">
                  <Lock className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400" />
                  <input
                    type={showConfirmPassword ? 'text' : 'password'}
                    value={confirmPassword}
                    onChange={(e) => setConfirmPassword(e.target.value)}
                    placeholder="Confirm new password"
                    className={`w-full pl-12 pr-12 py-3.5 bg-gray-50 border rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-transparent transition-all text-gray-900 placeholder-gray-400 ${
                      confirmPassword.length > 0
                        ? passwordsMatch
                          ? 'border-green-300 bg-green-50'
                          : 'border-red-300 bg-red-50'
                        : 'border-gray-200'
                    }`}
                  />
                  <button
                    type="button"
                    onClick={() => setShowConfirmPassword(!showConfirmPassword)}
                    className="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600 transition-colors"
                  >
                    {showConfirmPassword ? <EyeOff className="w-5 h-5" /> : <Eye className="w-5 h-5" />}
                  </button>
                </div>
                {confirmPassword.length > 0 && (
                  <p className={`mt-1 text-xs ${passwordsMatch ? 'text-green-600' : 'text-red-600'}`}>
                    {passwordsMatch ? 'Passwords match!' : 'Passwords do not match'}
                  </p>
                )}
              </div>

              <motion.button
                type="submit"
                disabled={loading || !passwordsMatch || !allPasswordChecks}
                whileHover={{ scale: loading ? 1 : 1.02 }}
                whileTap={{ scale: loading ? 1 : 0.98 }}
                className="w-full py-4 bg-gradient-to-r from-orange-500 to-orange-600 text-white font-semibold rounded-xl shadow-lg hover:shadow-xl transition-all disabled:opacity-70 disabled:cursor-not-allowed flex items-center justify-center gap-2 mt-6"
              >
                {loading ? (
                  <>
                    <div className="w-5 h-5 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                    <span>Resetting...</span>
                  </>
                ) : (
                  <span>Reset Password</span>
                )}
              </motion.button>
            </form>
          </motion.div>
        );

      case STEPS.SUCCESS:
        return (
          <motion.div
            initial={{ opacity: 0, scale: 0.9 }}
            animate={{ opacity: 1, scale: 1 }}
            className="text-center"
          >
            <motion.div
              initial={{ scale: 0 }}
              animate={{ scale: 1 }}
              transition={{ type: 'spring', stiffness: 200, delay: 0.1 }}
              className="inline-flex items-center justify-center w-20 h-20 bg-green-100 rounded-full mb-6"
            >
              <Check className="w-10 h-10 text-green-600" />
            </motion.div>
            <h1 className="font-playfair text-3xl font-bold text-gray-800 mb-2">Password Reset!</h1>
            <p className="text-gray-600 mb-8">
              Your password has been successfully reset. You can now sign in with your new password.
            </p>
            <motion.button
              onClick={onSuccess}
              whileHover={{ scale: 1.02 }}
              whileTap={{ scale: 0.98 }}
              className="w-full py-4 bg-gradient-to-r from-orange-500 to-orange-600 text-white font-semibold rounded-xl shadow-lg hover:shadow-xl transition-all"
            >
              Back to Sign In
            </motion.button>
          </motion.div>
        );

      default:
        return null;
    }
  };

  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      className="bg-white/95 backdrop-blur-sm rounded-3xl shadow-2xl p-8 md:p-10"
    >
      {/* Back Button */}
      {step !== STEPS.SUCCESS && (
        <button
          onClick={step === STEPS.EMAIL ? onBack : () => setStep(STEPS.EMAIL)}
          className="flex items-center gap-2 text-gray-600 hover:text-gray-800 transition-colors mb-6"
        >
          <ArrowLeft className="w-4 h-4" />
          <span className="text-sm">{step === STEPS.EMAIL ? 'Back to login' : 'Start over'}</span>
        </button>
      )}

      {/* Progress Indicator */}
      {step !== STEPS.SUCCESS && (
        <div className="flex items-center justify-center gap-2 mb-6">
          {[STEPS.EMAIL, STEPS.CODE, STEPS.NEW_PASSWORD].map((s, i) => (
            <div
              key={s}
              className={`h-2 rounded-full transition-all ${
                [STEPS.EMAIL, STEPS.CODE, STEPS.NEW_PASSWORD].indexOf(step) >= i
                  ? 'w-8 bg-orange-500'
                  : 'w-4 bg-gray-200'
              }`}
            />
          ))}
        </div>
      )}

      {/* Error Message */}
      {error && (
        <motion.div
          initial={{ opacity: 0, y: -10 }}
          animate={{ opacity: 1, y: 0 }}
          className="mb-6 p-4 bg-red-50 border border-red-200 text-red-700 rounded-xl text-sm text-center"
        >
          {error}
        </motion.div>
      )}

      {/* Step Content */}
      <AnimatePresence mode="wait">
        {renderStep()}
      </AnimatePresence>
    </motion.div>
  );
}
