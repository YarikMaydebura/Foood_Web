import { useState, useRef, useEffect } from 'react';
import { motion } from 'framer-motion';
import { Mail, ArrowLeft, RefreshCw } from 'lucide-react';

export default function EmailVerification({ email, onSuccess, onBack, api }) {
  const [code, setCode] = useState(['', '', '', '', '', '']);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [resendCooldown, setResendCooldown] = useState(0);
  const inputRefs = useRef([]);

  // Resend cooldown timer
  useEffect(() => {
    if (resendCooldown > 0) {
      const timer = setTimeout(() => setResendCooldown(resendCooldown - 1), 1000);
      return () => clearTimeout(timer);
    }
  }, [resendCooldown]);

  // Auto-submit when all digits are entered
  useEffect(() => {
    if (code.every(digit => digit !== '')) {
      handleSubmit();
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [code]);

  const handleChange = (index, value) => {
    // Only allow digits
    if (value && !/^\d$/.test(value)) return;

    const newCode = [...code];
    newCode[index] = value;
    setCode(newCode);
    setError('');

    // Move to next input if value is entered
    if (value && index < 5) {
      inputRefs.current[index + 1]?.focus();
    }
  };

  const handleKeyDown = (index, e) => {
    // Handle backspace
    if (e.key === 'Backspace') {
      if (code[index] === '' && index > 0) {
        inputRefs.current[index - 1]?.focus();
      } else {
        const newCode = [...code];
        newCode[index] = '';
        setCode(newCode);
      }
    }
    // Handle paste
    if (e.key === 'v' && (e.ctrlKey || e.metaKey)) {
      e.preventDefault();
      navigator.clipboard.readText().then(text => {
        const digits = text.replace(/\D/g, '').slice(0, 6).split('');
        const newCode = [...code];
        digits.forEach((digit, i) => {
          if (i < 6) newCode[i] = digit;
        });
        setCode(newCode);
        // Focus the last filled input or the next empty one
        const lastIndex = Math.min(digits.length, 5);
        inputRefs.current[lastIndex]?.focus();
      });
    }
    // Handle arrow keys
    if (e.key === 'ArrowLeft' && index > 0) {
      inputRefs.current[index - 1]?.focus();
    }
    if (e.key === 'ArrowRight' && index < 5) {
      inputRefs.current[index + 1]?.focus();
    }
  };

  const handlePaste = (e) => {
    e.preventDefault();
    const text = e.clipboardData.getData('text');
    const digits = text.replace(/\D/g, '').slice(0, 6).split('');
    const newCode = [...code];
    digits.forEach((digit, i) => {
      if (i < 6) newCode[i] = digit;
    });
    setCode(newCode);
    // Focus the last filled input or the next empty one
    const lastIndex = Math.min(digits.length, 5);
    inputRefs.current[lastIndex]?.focus();
  };

  const handleSubmit = async () => {
    const fullCode = code.join('');
    if (fullCode.length !== 6) {
      setError('Please enter the complete 6-digit code');
      return;
    }

    setLoading(true);
    setError('');

    try {
      const result = await api.verifyEmail(email, fullCode);
      if (result.error) {
        setError(result.error);
        // Clear the code on error
        setCode(['', '', '', '', '', '']);
        inputRefs.current[0]?.focus();
      } else {
        onSuccess();
      }
    } catch (err) {
      setError('Connection error. Please try again.');
    } finally {
      setLoading(false);
    }
  };

  const handleResend = async () => {
    if (resendCooldown > 0) return;

    try {
      const result = await api.resendCode(email);
      if (result.error) {
        setError(result.error);
      } else {
        setResendCooldown(60); // 60 second cooldown
        setError('');
      }
    } catch (err) {
      setError('Failed to resend code. Please try again.');
    }
  };

  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      className="bg-white/95 backdrop-blur-sm rounded-3xl shadow-2xl p-8 md:p-10"
    >
      {/* Back Button */}
      <button
        onClick={onBack}
        className="flex items-center gap-2 text-gray-600 hover:text-gray-800 transition-colors mb-6"
      >
        <ArrowLeft className="w-4 h-4" />
        <span className="text-sm">Back to login</span>
      </button>

      {/* Icon and Title */}
      <div className="text-center mb-8">
        <motion.div
          initial={{ scale: 0 }}
          animate={{ scale: 1 }}
          transition={{ type: 'spring', stiffness: 200, delay: 0.1 }}
          className="inline-flex items-center justify-center w-20 h-20 bg-gradient-to-br from-orange-100 to-orange-200 rounded-full mb-4"
        >
          <Mail className="w-10 h-10 text-orange-600" />
        </motion.div>
        <h1 className="font-playfair text-3xl font-bold text-gray-800 mb-2">Check Your Email</h1>
        <p className="text-gray-600">
          We've sent a 6-digit code to
          <br />
          <span className="font-semibold text-gray-800">{email}</span>
        </p>
      </div>

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

      {/* Code Input */}
      <div className="flex justify-center gap-2 sm:gap-3 mb-6">
        {code.map((digit, index) => (
          <motion.input
            key={index}
            ref={(el) => (inputRefs.current[index] = el)}
            type="text"
            inputMode="numeric"
            maxLength={1}
            value={digit}
            onChange={(e) => handleChange(index, e.target.value)}
            onKeyDown={(e) => handleKeyDown(index, e)}
            onPaste={handlePaste}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: index * 0.05 }}
            className={`w-12 h-14 sm:w-14 sm:h-16 text-center text-2xl font-bold border-2 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-orange-500 transition-all ${
              digit ? 'border-orange-400 bg-orange-50' : 'border-gray-200 bg-gray-50'
            } text-gray-900`}
            disabled={loading}
          />
        ))}
      </div>

      {/* Verify Button */}
      <motion.button
        onClick={handleSubmit}
        disabled={loading || code.some(d => d === '')}
        whileHover={{ scale: loading ? 1 : 1.02 }}
        whileTap={{ scale: loading ? 1 : 0.98 }}
        className="w-full py-4 bg-gradient-to-r from-orange-500 to-orange-600 text-white font-semibold rounded-xl shadow-lg hover:shadow-xl transition-all disabled:opacity-70 disabled:cursor-not-allowed flex items-center justify-center gap-2"
      >
        {loading ? (
          <>
            <div className="w-5 h-5 border-2 border-white/30 border-t-white rounded-full animate-spin" />
            <span>Verifying...</span>
          </>
        ) : (
          <span>Verify Email</span>
        )}
      </motion.button>

      {/* Resend Code */}
      <div className="text-center mt-6">
        <p className="text-gray-600 mb-2">Didn't receive the code?</p>
        <button
          onClick={handleResend}
          disabled={resendCooldown > 0}
          className={`inline-flex items-center gap-2 font-semibold transition-colors ${
            resendCooldown > 0
              ? 'text-gray-400 cursor-not-allowed'
              : 'text-orange-600 hover:text-orange-700'
          }`}
        >
          <RefreshCw className={`w-4 h-4 ${resendCooldown > 0 ? '' : 'group-hover:rotate-180 transition-transform'}`} />
          {resendCooldown > 0 ? (
            <span>Resend in {resendCooldown}s</span>
          ) : (
            <span>Resend Code</span>
          )}
        </button>
      </div>

      {/* Help Text */}
      <p className="text-center text-sm text-gray-500 mt-6">
        Check your spam folder if you don't see the email.
      </p>
    </motion.div>
  );
}
