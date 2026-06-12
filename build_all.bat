@echo off
chcp 65001 >nul
title Restaurant System - Build Tool

echo 🚀 Restaurant System - Windows Build Tool
echo ==========================================
echo.

REM Check Flutter
flutter --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Flutter not found!
    echo    Install from: https://flutter.dev/docs/get-started/install
    pause
    exit /b 1
)

echo ✅ Flutter found
echo.

:menu
echo ==========================================
echo Select what to build:
echo ==========================================
echo.
echo 1. 🍕 Customer App (Foodie) - APK
echo 2. 🛵 Delivery App (FastDelivery) - APK
echo 3. 👨‍💼 Admin App (RestaurantManager) - APK
echo 4. 📦 Build ALL APKS
echo.
echo 5. 🍕 Customer App - AAB (Play Store)
echo 6. 🛵 Delivery App - AAB (Play Store)
echo 7. 👨‍💼 Admin App - AAB (Play Store)
echo 8. 📦 Build ALL AABS
echo.
echo 9. 🧹 Clean Build Cache
echo 10. 🚪 Exit
echo.
echo ==========================================
set /p choice="Enter your choice (1-10): "
echo.

if "%choice%"=="1" goto build_customer_apk
if "%choice%"=="2" goto build_delivery_apk
if "%choice%"=="3" goto build_admin_apk
if "%choice%"=="4" goto build_all_apk
if "%choice%"=="5" goto build_customer_aab
if "%choice%"=="6" goto build_delivery_aab
if "%choice%"=="7" goto build_admin_aab
if "%choice%"=="8" goto build_all_aab
if "%choice%"=="9" goto clean_build
if "%choice%"=="10" goto exit

echo ❌ Invalid choice!
goto menu

:build_customer_apk
echo 📦 Building Foodie APK...
flutter build apk --flavor customer --release
if errorlevel 1 (
    echo ❌ Build failed!
) else (
    echo ✅ Foodie APK built successfully!
    echo 📁 Location: buildpp\outputslutter-apkpp-customer-release.apk
)
goto menu

:build_delivery_apk
echo 📦 Building FastDelivery APK...
flutter build apk --flavor delivery --release
if errorlevel 1 (
    echo ❌ Build failed!
) else (
    echo ✅ FastDelivery APK built successfully!
    echo 📁 Location: buildpp\outputslutter-apkpp-delivery-release.apk
)
goto menu

:build_admin_apk
echo 📦 Building RestaurantManager APK...
flutter build apk --flavor admin --release
if errorlevel 1 (
    echo ❌ Build failed!
) else (
    echo ✅ RestaurantManager APK built successfully!
    echo 📁 Location: buildpp\outputslutter-apkpp-admin-release.apk
)
goto menu

:build_all_apk
echo 📦 Building ALL APKs...
flutter build apk --flavor customer --release
flutter build apk --flavor delivery --release
flutter build apk --flavor admin --release
echo ✅ All APKs built!
goto menu

:build_customer_aab
echo 📦 Building Foodie AAB...
flutter build appbundle --flavor customer --release
if errorlevel 1 (
    echo ❌ Build failed!
) else (
    echo ✅ Foodie AAB built successfully!
)
goto menu

:build_delivery_aab
echo 📦 Building FastDelivery AAB...
flutter build appbundle --flavor delivery --release
if errorlevel 1 (
    echo ❌ Build failed!
) else (
    echo ✅ FastDelivery AAB built successfully!
)
goto menu

:build_admin_aab
echo 📦 Building RestaurantManager AAB...
flutter build appbundle --flavor admin --release
if errorlevel 1 (
    echo ❌ Build failed!
) else (
    echo ✅ RestaurantManager AAB built successfully!
)
goto menu

:build_all_aab
echo 📦 Building ALL AABs...
flutter build appbundle --flavor customer --release
flutter build appbundle --flavor delivery --release
flutter build appbundle --flavor admin --release
echo ✅ All AABs built!
goto menu

:clean_build
echo 🧹 Cleaning build cache...
flutter clean
flutter pub get
echo ✅ Clean complete!
goto menu

:exit
echo 👋 Goodbye!
pause
exit /b 0
