import { Link } from 'react-router-dom';
import { ArrowLeft } from 'lucide-react';

export default function PrivacyPolicy() {
  return (
    <div className="min-h-screen bg-[#FFF8E8]">
      {/* Header */}
      <header className="bg-white shadow-sm border-b border-gray-200">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 py-4">
          <Link
            to="/"
            className="inline-flex items-center gap-2 text-orange-600 hover:text-orange-700 transition"
          >
            <ArrowLeft className="w-5 h-5" />
            <span>Back to Home</span>
          </Link>
        </div>
      </header>

      {/* Content */}
      <main className="max-w-4xl mx-auto px-4 sm:px-6 py-12">
        <h1 className="text-4xl font-bold text-gray-900 mb-8">Privacy Policy</h1>

        <div className="prose prose-orange max-w-none space-y-6 text-gray-700">
          <p className="text-lg text-gray-600">
            Last updated: {new Date().toLocaleDateString('en-US', { month: 'long', day: 'numeric', year: 'numeric' })}
          </p>

          <section>
            <h2 className="text-2xl font-semibold text-gray-900 mt-8 mb-4">1. Introduction</h2>
            <p>
              Welcome to Foood ("we," "our," or "us"). We are committed to protecting your personal information
              and your right to privacy. This Privacy Policy explains how we collect, use, disclose, and
              safeguard your information when you use our mobile application and website (collectively, the "Service").
            </p>
          </section>

          <section>
            <h2 className="text-2xl font-semibold text-gray-900 mt-8 mb-4">2. Information We Collect</h2>
            <h3 className="text-xl font-medium text-gray-800 mt-4 mb-2">Personal Information</h3>
            <p>When you register for an account, we collect:</p>
            <ul className="list-disc pl-6 mt-2 space-y-1">
              <li>Name</li>
              <li>Email address</li>
              <li>Password (encrypted)</li>
            </ul>

            <h3 className="text-xl font-medium text-gray-800 mt-4 mb-2">Usage Data</h3>
            <p>We automatically collect certain information when you use the Service:</p>
            <ul className="list-disc pl-6 mt-2 space-y-1">
              <li>Device information (type, operating system)</li>
              <li>Browser type</li>
              <li>Usage patterns and preferences</li>
              <li>IP address</li>
            </ul>

            <h3 className="text-xl font-medium text-gray-800 mt-4 mb-2">Recipe Data</h3>
            <p>
              We store the recipes, meal plans, and shopping lists you create within the app.
              This data is associated with your account and is used solely to provide our Service to you.
            </p>
          </section>

          <section>
            <h2 className="text-2xl font-semibold text-gray-900 mt-8 mb-4">3. How We Use Your Information</h2>
            <p>We use the collected information to:</p>
            <ul className="list-disc pl-6 mt-2 space-y-1">
              <li>Provide, operate, and maintain our Service</li>
              <li>Create and manage your account</li>
              <li>Send you important updates and notifications</li>
              <li>Respond to your comments and questions</li>
              <li>Improve our Service based on usage patterns</li>
              <li>Display relevant advertisements (see Advertising section)</li>
            </ul>
          </section>

          <section>
            <h2 className="text-2xl font-semibold text-gray-900 mt-8 mb-4">4. Advertising</h2>
            <p>
              Our Service displays advertisements provided by third-party ad networks. These networks may use
              cookies and similar technologies to collect information about your browsing activities to provide
              you with relevant advertisements. The ad networks we work with include:
            </p>
            <ul className="list-disc pl-6 mt-2 space-y-1">
              <li>Adsterra (web)</li>
              <li>Google AdMob (mobile)</li>
            </ul>
            <p className="mt-2">
              You can opt out of personalized advertising by adjusting your device settings or visiting
              the ad network's opt-out pages.
            </p>
          </section>

          <section>
            <h2 className="text-2xl font-semibold text-gray-900 mt-8 mb-4">5. Data Sharing</h2>
            <p>We do not sell your personal information. We may share your information only in these cases:</p>
            <ul className="list-disc pl-6 mt-2 space-y-1">
              <li>With your consent</li>
              <li>To comply with legal obligations</li>
              <li>To protect our rights and safety</li>
              <li>With service providers who assist in operating our Service (e.g., hosting, email)</li>
            </ul>
          </section>

          <section>
            <h2 className="text-2xl font-semibold text-gray-900 mt-8 mb-4">6. Data Security</h2>
            <p>
              We implement appropriate technical and organizational security measures to protect your personal
              information. However, no method of transmission over the Internet or electronic storage is 100%
              secure, and we cannot guarantee absolute security.
            </p>
          </section>

          <section>
            <h2 className="text-2xl font-semibold text-gray-900 mt-8 mb-4">7. Your Rights</h2>
            <p>You have the right to:</p>
            <ul className="list-disc pl-6 mt-2 space-y-1">
              <li>Access your personal data</li>
              <li>Correct inaccurate data</li>
              <li>Request deletion of your data</li>
              <li>Export your data</li>
              <li>Withdraw consent at any time</li>
            </ul>
            <p className="mt-2">
              To exercise these rights, please contact us at the email address below.
            </p>
          </section>

          <section>
            <h2 className="text-2xl font-semibold text-gray-900 mt-8 mb-4">8. Cookies</h2>
            <p>
              We use cookies and similar tracking technologies to track activity on our Service and store
              certain information. You can instruct your browser to refuse all cookies or to indicate when
              a cookie is being sent.
            </p>
          </section>

          <section>
            <h2 className="text-2xl font-semibold text-gray-900 mt-8 mb-4">9. Children's Privacy</h2>
            <p>
              Our Service is not intended for children under 13. We do not knowingly collect personal
              information from children under 13. If you believe we have collected information from a child
              under 13, please contact us immediately.
            </p>
          </section>

          <section>
            <h2 className="text-2xl font-semibold text-gray-900 mt-8 mb-4">10. Changes to This Policy</h2>
            <p>
              We may update this Privacy Policy from time to time. We will notify you of any changes by
              posting the new Privacy Policy on this page and updating the "Last updated" date.
            </p>
          </section>

          <section>
            <h2 className="text-2xl font-semibold text-gray-900 mt-8 mb-4">11. Contact Us</h2>
            <p>
              If you have any questions about this Privacy Policy, please contact us:
            </p>
            <ul className="list-disc pl-6 mt-2 space-y-1">
              <li>By email: support@foood.app</li>
            </ul>
          </section>
        </div>
      </main>

      {/* Footer */}
      <footer className="bg-white border-t border-gray-200 py-8 mt-12">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 text-center text-gray-500">
          <p>Foood - Your Meal Planning Companion</p>
        </div>
      </footer>
    </div>
  );
}
