# 🍽️ Restaurant System - Complete 3-App Solution

## 📱 التطبيقات الثلاثة

| التطبيق | الوصف | اللون |
|---------|-------|-------|
| **Foodie** (Customer) | تطبيق العميل للطلب والحجز | 🟠 برتقالي |
| **FastDelivery** (Delivery) | تطبيق المندوب للتوصيل | 🟢 أخضر |
| **RestaurantManager** (Admin) | لوحة تحكم الإدمن | 🔵 أزرق |

---

## 🚀 طريقة البناء والنشر

### 1️⃣ تثبيت المتطلبات

```bash
flutter pub get
```

### 2️⃣ بناء تطبيق العميل (Customer)

**Android APK:**
```bash
flutter build apk --flavor customer --release
```
**Android App Bundle (AAB) للنشر على Google Play:**
```bash
flutter build appbundle --flavor customer --release
```
**iOS:**
```bash
flutter build ios --flavor customer --release
```

### 3️⃣ بناء تطبيق المندوب (Delivery)

**Android APK:**
```bash
flutter build apk --flavor delivery --release
```
**Android App Bundle (AAB):**
```bash
flutter build appbundle --flavor delivery --release
```
**iOS:**
```bash
flutter build ios --flavor delivery --release
```

### 4️⃣ بناء تطبيق الإدمن (Admin)

**Android APK:**
```bash
flutter build apk --flavor admin --release
```
**Android App Bundle (AAB):**
```bash
flutter build appbundle --flavor admin --release
```
**iOS:**
```bash
flutter build ios --flavor admin --release
```

---

## 📁 هيكل المشروع

```
lib/
├── admin/              ← تطبيق الإدمن
│   ├── screens/
│   │   ├── auth/
│   │   ├── dashboard/
│   │   ├── orders/
│   │   ├── products/
│   │   ├── customers/
│   │   ├── delivery/
│   │   ├── reservations/
│   │   ├── promotions/
│   │   ├── reports/
│   │   └── settings/
│   ├── widgets/
│   ├── models/
│   └── providers/
│
├── customer/           ← تطبيق العميل
│   ├── screens/
│   │   ├── auth/
│   │   ├── home/
│   │   ├── menu/
│   │   ├── cart/
│   │   ├── checkout/
│   │   ├── orders/
│   │   ├── profile/
│   │   ├── reservation/
│   │   └── tracking/
│   ├── widgets/
│   ├── models/
│   └── providers/
│
├── delivery/           ← تطبيق المندوب
│   ├── screens/
│   │   ├── auth/
│   │   ├── home/
│   │   ├── orders/
│   │   ├── wallet/
│   │   ├── profile/
│   │   └── tracking/
│   ├── widgets/
│   ├── models/
│   └── providers/
│
└── shared/             ← الملفات المشتركة
    ├── themes/
    ├── models/
    ├── services/
    ├── utils/
    ├── widgets/
    └── constants/
```

---

## ✨ المميزات

### 🍕 تطبيق العميل (Customer)
- ✅ تسجيل دخول بـ Gmail, Facebook, رقم هاتف + OTP
- ✅ قائمة منتجات عصرية مع بيتزا وكباب ومشويات
- ✅ 3 أنواع طلبات: توصيل / استلام / حجز طاولة
- ✅ اختيار الحجم والإضافات
- ✅ سلة تسوق مع حساب تلقائي
- ✅ طرق دفع متعددة: كاش، مدى، Apple Pay، STC Pay، فيزا
- ✅ تتبع الطلب لحظياً على الخريطة
- ✅ تقييم الطلبات
- ✅ وضع ليلي كامل
- ✅ دعم ذوي الاحتياجات الخاصة

### 🛵 تطبيق المندوب (Delivery)
- ✅ تسجيل دخول برقم هاتف + كود وظيفي + رخصة قيادة + رخصة مركبة
- ✅ عرض الطلبات المتاحة مع المسافة
- ✅ معرفة طريقة الدفع (كاش/مدفوع)
- ✅ تتبع على الخريطة
- ✅ نظام محفظة كاملة
- ✅ إحصائيات يومية وشهرية
- ✅ تأكيد سداد من الإدمن

### 👨‍💼 تطبيق الإدمن (Admin)
- ✅ لوحة تحكم شاملة مع إحصائيات ورسوم بيانية
- ✅ إدارة الطلبات والمنتجات والعملاء والمناديب
- ✅ إدارة الحجوزات
- ✅ نظام عروض وخصومات
- ✅ تقارير مفصلة
- ✅ تحكم كامل في الألوان والصور والأسماء
- ✅ تحكم في طرق الدفع
- ✅ تتبع الطلبات لحظياً
- ✅ فواتير إلكترونية

---

## 🎨 الألوان

| التطبيق | الأساسي | الثانوي | الخلفية |
|---------|---------|---------|---------|
| Customer | `#FF6B35` | `#FF8C42` | `#1A1A2E` |
| Delivery | `#00C853` | `#00E676` | `#1B5E20` |
| Admin | `#2979FF` | `#448AFF` | `#0D1B2A` |

---

## 🔧 الإعدادات

### Firebase
1. أنشئ مشروع في [Firebase Console](https://console.firebase.google.com)
2. فعل Authentication, Firestore, Storage, Messaging
3. حمل `google-services.json` إلى `android/app/`
4. حمل `GoogleService-Info.plist` إلى `ios/Runner/`

### Google Maps
1. احصل على API Key من [Google Cloud Console](https://console.cloud.google.com)
2. أضف المفتاح في `AndroidManifest.xml` و `AppDelegate.swift`

### Stripe (للمدفوعات)
1. أنشئ حساب في [Stripe](https://stripe.com)
2. أضف المفاتيح في الكود

---

## 📄 الترخيص

هذا المشروع مفتوح المصدر ومتاح للاستخدام الشخصي والتجاري.

---

## 📞 الدعم

لأي استفسارات أو مشاكل، يرجى التواصل.

**صنع بـ ❤️ Flutter**
