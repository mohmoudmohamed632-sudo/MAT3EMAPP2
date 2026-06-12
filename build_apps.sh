#!/bin/bash

echo "🚀 Restaurant System - Build Script"
echo "===================================="
echo ""

# Function to build app
build_app() {
    local flavor=$1
    local app_name=$2

    echo "📦 Building $app_name..."
    echo ""

    # Build APK
    flutter build apk --flavor $flavor --release

    if [ $? -eq 0 ]; then
        echo "✅ $app_name APK built successfully!"
        echo "📁 Location: build/app/outputs/flutter-apk/app-$flavor-release.apk"
    else
        echo "❌ Failed to build $app_name"
    fi

    echo ""
}

# Menu
echo "Select app to build:"
echo "1. Customer App (Foodie)"
echo "2. Delivery App (FastDelivery)"
echo "3. Admin App (RestaurantManager)"
echo "4. Build All Apps"
echo "5. Build AAB for Play Store"
echo ""
read -p "Enter choice (1-5): " choice

case $choice in
    1)
        build_app "customer" "Foodie"
        ;;
    2)
        build_app "delivery" "FastDelivery"
        ;;
    3)
        build_app "admin" "RestaurantManager"
        ;;
    4)
        build_app "customer" "Foodie"
        build_app "delivery" "FastDelivery"
        build_app "admin" "RestaurantManager"
        echo "🎉 All apps built successfully!"
        ;;
    5)
        echo "Building AAB for Google Play Store..."
        flutter build appbundle --flavor customer --release
        flutter build appbundle --flavor delivery --release
        flutter build appbundle --flavor admin --release
        echo "✅ AAB files built!"
        ;;
    *)
        echo "Invalid choice!"
        exit 1
        ;;
esac
