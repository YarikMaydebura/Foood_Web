import { motion, AnimatePresence } from 'framer-motion';
import { useState } from 'react';
import { useInView } from 'react-intersection-observer';
import { Plus, Minus } from 'lucide-react';

const faqs = [
  {
    question: "What is Foood?",
    answer: "Foood is an all-in-one meal planning platform that helps you organize recipes, plan weekly meals, and generate smart shopping lists. It's designed to make cooking at home easier and more enjoyable."
  },
  {
    question: "How much does it cost?",
    answer: "Foood costs $4.99/month with a 7-day free trial. No credit card required for the trial. You can cancel anytime with no questions asked."
  },
  {
    question: "Is there a free trial?",
    answer: "Yes! We offer a 7-day free trial so you can explore all features risk-free. No credit card required to start your trial."
  },
  {
    question: "Can I import recipes from other apps or websites?",
    answer: "Absolutely! You can import recipes from virtually any website using our browser extension, or manually add your own recipes. We also support importing from popular recipe apps."
  },
  {
    question: "How does the shopping list feature work?",
    answer: "Once you've planned your meals for the week, Foood automatically generates a shopping list with all ingredients needed. The list is organized by category (produce, dairy, etc.) and consolidates duplicate items across recipes."
  },
  {
    question: "Can I share recipes with family and friends?",
    answer: "Yes! You can easily share individual recipes or entire meal plans via link. Recipients don't need a Foood account to view shared recipes."
  },
  {
    question: "Is my data secure?",
    answer: "Absolutely. All your data is encrypted and securely stored. We never share your personal information or recipes with third parties. You own your data and can export it anytime."
  },
  {
    question: "Can I cancel my subscription anytime?",
    answer: "Yes, you can cancel your subscription anytime from your account settings. There are no cancellation fees, and you'll have access until the end of your billing period."
  }
];

const FAQItem = ({ faq, index, isOpen, onToggle }) => {
  const bgColors = [
    'bg-cream',
    'bg-cream-peachy',
    'bg-orange-50',
    'bg-yellow-50',
  ];

  const bgColor = bgColors[index % bgColors.length];

  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      whileInView={{ opacity: 1, y: 0 }}
      viewport={{ once: true }}
      transition={{ delay: index * 0.05 }}
      className={`${bgColor} rounded-2xl overflow-hidden border border-orange-100/50`}
    >
      <motion.button
        onClick={onToggle}
        className="w-full px-6 lg:px-8 py-6 flex items-center justify-between gap-4 text-left transition-colors hover:bg-orange-50/50"
      >
        <span className="font-bold text-lg lg:text-xl text-[#4A3728] pr-4">
          {faq.question}
        </span>
        <motion.div
          animate={{ rotate: isOpen ? 45 : 0 }}
          transition={{ duration: 0.2 }}
          className="flex-shrink-0 w-8 h-8 bg-orange-500 rounded-full flex items-center justify-center"
        >
          {isOpen ? (
            <Minus className="w-5 h-5 text-white" />
          ) : (
            <Plus className="w-5 h-5 text-white" />
          )}
        </motion.div>
      </motion.button>

      <AnimatePresence>
        {isOpen && (
          <motion.div
            initial={{ height: 0, opacity: 0 }}
            animate={{ height: 'auto', opacity: 1 }}
            exit={{ height: 0, opacity: 0 }}
            transition={{ duration: 0.3 }}
            className="overflow-hidden"
          >
            <div className="px-6 lg:px-8 pb-6 text-[#6B5344] text-base lg:text-lg leading-relaxed">
              {faq.answer}
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </motion.div>
  );
};

export default function FAQSection() {
  const [openIndex, setOpenIndex] = useState(0);
  const [ref, inView] = useInView({
    threshold: 0.1,
    triggerOnce: true
  });

  const handleToggle = (index) => {
    setOpenIndex(openIndex === index ? -1 : index);
  };

  return (
    <section id="faq" className="py-24 bg-gradient-to-b from-white to-orange-50 relative overflow-hidden">
      {/* Background Pattern */}
      <div className="absolute inset-0 opacity-5">
        <div className="absolute inset-0" style={{
          backgroundImage: `url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23FF8C00' fill-opacity='1'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E")`,
        }} />
      </div>

      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        {/* Section Header */}
        <motion.div
          ref={ref}
          initial={{ opacity: 0, y: 30 }}
          animate={inView ? { opacity: 1, y: 0 } : {}}
          transition={{ duration: 0.7 }}
          className="text-center mb-16"
        >
          <span className="inline-block px-4 py-1 bg-orange-100 text-orange-600 rounded-full text-sm font-medium mb-4">
            FAQ
          </span>
          <h2 className="font-playfair text-4xl sm:text-5xl lg:text-6xl font-bold text-[#4A3728] mb-4">
            Common Questions
          </h2>
          <p className="text-xl text-[#6B5344]">
            Everything you need to know about Foood
          </p>
        </motion.div>

        {/* FAQ Accordion */}
        <div className="space-y-4">
          {faqs.map((faq, index) => (
            <FAQItem
              key={index}
              faq={faq}
              index={index}
              isOpen={openIndex === index}
              onToggle={() => handleToggle(index)}
            />
          ))}
        </div>

        {/* Contact CTA */}
        <motion.div
          initial={{ opacity: 0 }}
          whileInView={{ opacity: 1 }}
          viewport={{ once: true }}
          transition={{ delay: 0.5 }}
          className="mt-16 text-center p-8 bg-gradient-to-br from-orange-50 to-yellow-50 rounded-2xl border border-orange-100"
        >
          <h3 className="font-playfair text-2xl font-bold text-[#4A3728] mb-2">
            Still have questions?
          </h3>
          <p className="text-[#6B5344] mb-4">
            We're here to help! Get in touch with our friendly support team.
          </p>
          <motion.a
            href="mailto:support@foood.app"
            whileHover={{ scale: 1.05 }}
            whileTap={{ scale: 0.95 }}
            className="inline-block px-6 py-3 bg-gradient-to-r from-orange-500 to-orange-600 text-white font-semibold rounded-xl shadow-lg hover:shadow-xl transition-all"
          >
            Contact Support
          </motion.a>
        </motion.div>
      </div>
    </section>
  );
}
