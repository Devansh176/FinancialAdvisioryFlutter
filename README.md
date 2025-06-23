# 💰 Financial Advisory App – Flutter Frontend

A comprehensive **Flutter frontend** for a **Financial Advisory Application**, designed to help users manage income, expenses, investments, and monitor their financial health. This frontend integrates various financial tools like **SIP calculator**, transaction history, balance charts, and user profile management.

---

## 🎯 Features

- 📊 View detailed statistics on **income** and **expenses**
- 📈 Track **balance history** with interactive charts
- 🔁 Record and manage **transactions**
- 🧮 Built-in **SIP Calculator** for investment planning
- 👤 User authentication screens (Login & Signup)
- 🏦 Dashboard with visual financial summaries
- 📅 Expense and income breakdown views
- 📂 Modular widget structure for clean code

---

## 🧩 Folder Structure

```
lib/
├── Finance_Model/
│   └── Finance_model.dart          # Data model for transactions and finances
├── widgets/
│   └── charts.dart                 # Charts for balance visualization
├── BalanceHistory.dart             # Historical balance screen
├── Expense.dart                    # Expense list view
├── Income.dart                     # Income view
├── Expense_Income.dart             # Combined income/expense overview
├── SipCalculator.dart              # SIP calculation logic
├── SipCalci.dart                   # SIP calculator UI
├── Statistics.dart                 # Financial statistics dashboard
├── Transaction.dart                # Transaction screen
├── MyProfile.dart                  # User profile management
├── HomePage.dart                   # Main dashboard UI
├── FirstPage.dart                  # App intro/landing
├── login.dart                      # Login screen
├── signUp.dart                     # Signup screen
├── main.dart                       # App entry point
```

---

## 🚀 Getting Started

### ✅ Prerequisites

- Flutter SDK installed
- Android Studio / VS Code
- Backend API or mock data for testing (Spring Boot, Firebase, etc.)

### 🔧 Setup Instructions

```bash
# 1. Clone the repository
git clone https://github.com/your-username/financial_advisory_flutter.git
cd financial_advisory_flutter

# 2. Get dependencies
flutter pub get

# 3. Run the app
flutter run
```

---

## 📦 Key Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  charts_flutter: ^0.12.0          # For data visualization
  provider: ^6.1.0                 # State management (optional)
  intl: ^0.19.0                    # Date formatting
```

*(Adjust versions as per your `pubspec.yaml` if needed.)*

---

## 🧠 Future Enhancements

- 🔐 OAuth or Firebase Authentication
- ☁️ Integration with REST API for live data
- 🔔 Financial notifications or reminders
- 📊 Budget planning and credit score tracker
- 🌙 Dark mode support

---

## 👨‍💻 Author

**Devansh Dhopte**  
Crafted as a scalable financial planner and tracker app using modern Flutter architecture.

---

> _"Empower your finances with clear insights and smart planning."_  
