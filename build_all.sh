#!/bin/bash

echo "🚀 Restaurant System - Complete Build Script"
echo "============================================"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored text
print_green() { echo -e "${GREEN}$1${NC}"; }
print_red() { echo -e "${RED}$1${NC}"; }
print_yellow() { echo -e "${YELLOW}$1${NC}"; }
print_blue() { echo -e "${BLUE}$1${NC}"; }

# Check Flutter
if ! command -v flutter &> /dev/null; then
    print_red "❌ Flutter not found!"
    echo "   Install from: https://flutter.dev/docs/get-started/install"
    exit 1
fi

print_green "✅ Flutter found: $(flutter --version | head -1)"
echo ""

# Function to build APK
build_apk() {
    local flavor=$1
    local app_name=$2

    print_blue "📦 Building $app_name APK..."
    echo ""

    flutter build apk --flavor $flavor --release

    if [ $? -eq 0 ]; then
        print_green "✅ $app_name APK built successfully!"
        echo "📁 Location: build/app/outputs/flutter-apk/app-$flavor-release.apk"
        echo ""

        # Show APK size
        APK_PATH="build/app/outputs/flutter-apk/app-$flavor-release.apk"
        if [ -f "$APK_PATH" ]; then
            APK_SIZE=$(ls -lh $APK_PATH | awk '{ print $5 }')
            print_green "📊 APK Size: $APK_SIZE"
        fi
    else
        print_red "❌ Failed to build $app_name APK"
        return 1
    fi
    echo ""
}

# Function to build AAB (for Google Play)
build_aab() {
    local flavor=$1
    local app_name=$2

    print_blue "📦 Building $app_name AAB (App Bundle)..."
    echo ""

    flutter build appbundle --flavor $flavor --release

    if [ $? -eq 0 ]; then
        print_green "✅ $app_name AAB built successfully!"
        echo "📁 Location: build/app/outputs/bundle/${flavor}Release/app-$flavor-release.aab"
        echo ""

        # Show AAB size
        AAB_PATH="build/app/outputs/bundle/${flavor}Release/app-$flavor-release.aab"
        if [ -f "$AAB_PATH" ]; then
            AAB_SIZE=$(ls -lh $AAB_PATH | awk '{ print $5 }')
            print_green "📊 AAB Size: $AAB_SIZE"
        fi
    else
        print_red "❌ Failed to build $app_name AAB"
        return 1
    fi
    echo ""
}

# Function to build iOS
build_ios() {
    local flavor=$1
    local app_name=$2

    print_blue "📦 Building $app_name iOS..."
    echo ""

    flutter build ios --flavor $flavor --release

    if [ $? -eq 0 ]; then
        print_green "✅ $app_name iOS built successfully!"
        echo "📁 Location: build/ios/archive/"
        echo ""
    else
        print_red "❌ Failed to build $app_name iOS"
        return 1
    fi
    echo ""
}

# Menu
show_menu() {
    echo "============================================"
    print_yellow "Select what to build:"
    echo "============================================"
    echo ""
    echo "1. 🍕 Customer App (Foodie) - APK"
    echo "2. 🛵 Delivery App (FastDelivery) - APK"
    echo "3. 👨‍💼 Admin App (RestaurantManager) - APK"
    echo "4. 📦 Build ALL APKS"
    echo ""
    echo "5. 🍕 Customer App - AAB (Play Store)"
    echo "6. 🛵 Delivery App - AAB (Play Store)"
    echo "7. 👨‍💼 Admin App - AAB (Play Store)"
    echo "8. 📦 Build ALL AABS"
    echo ""
    echo "9. 🍕 Customer App - iOS"
    echo "10. 🛵 Delivery App - iOS"
    echo "11. 👨‍💼 Admin App - iOS"
    echo "12. 📦 Build ALL iOS"
    echo ""
    echo "13. 🔐 Generate Keystore"
    echo "14. 🧹 Clean Build Cache"
    echo "15. 🚪 Exit"
    echo ""
    echo "============================================"
}

# Main loop
while true; do
    show_menu
    read -p "Enter your choice (1-15): " choice
    echo ""

    case $choice in
        1)
            build_apk "customer" "Foodie"
            ;;
        2)
            build_apk "delivery" "FastDelivery"
            ;;
        3)
            build_apk "admin" "RestaurantManager"
            ;;
        4)
            print_yellow "🏗️ Building ALL APKs..."
            echo ""
            build_apk "customer" "Foodie"
            build_apk "delivery" "FastDelivery"
            build_apk "admin" "RestaurantManager"
            print_green "🎉 All APKs built successfully!"
            ;;
        5)
            build_aab "customer" "Foodie"
            ;;
        6)
            build_aab "delivery" "FastDelivery"
            ;;
        7)
            build_aab "admin" "RestaurantManager"
            ;;
        8)
            print_yellow "🏗️ Building ALL AABs..."
            echo ""
            build_aab "customer" "Foodie"
            build_aab "delivery" "FastDelivery"
            build_aab "admin" "RestaurantManager"
            print_green "🎉 All AABs built successfully!"
            ;;
        9)
            build_ios "customer" "Foodie"
            ;;
        10)
            build_ios "delivery" "FastDelivery"
            ;;
        11)
            build_ios "admin" "RestaurantManager"
            ;;
        12)
            print_yellow "🏗️ Building ALL iOS..."
            echo ""
            build_ios "customer" "Foodie"
            build_ios "delivery" "FastDelivery"
            build_ios "admin" "RestaurantManager"
            print_green "🎉 All iOS builds successful!"
            ;;
        13)
            echo "🔐 Running keystore generator..."
            bash generate_keystore.sh
            ;;
        14)
            print_yellow "🧹 Cleaning build cache..."
            flutter clean
            flutter pub get
            print_green "✅ Clean complete!"
            ;;
        15)
            print_green "👋 Goodbye!"
            exit 0
            ;;
        *)
            print_red "❌ Invalid choice! Please try again."
            ;;
    esac

    echo ""
    read -p "Press Enter to continue..."
    clear
done
