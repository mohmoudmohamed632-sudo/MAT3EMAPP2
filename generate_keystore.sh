#!/bin/bash

echo "🔐 Restaurant System - Keystore Generator"
echo "=========================================="
echo ""

# Check if keytool is available
if ! command -v keytool &> /dev/null; then
    echo "❌ keytool not found! Please install Java JDK."
    echo "   Download from: https://www.oracle.com/java/technologies/downloads/"
    exit 1
fi

# Default values
KEYSTORE_FILE="upload-keystore.jks"
KEY_ALIAS="upload"
VALIDITY_DAYS=10000

# Get user input
echo "Enter keystore details (press Enter for defaults):"
echo ""

read -p "Keystore file name [$KEYSTORE_FILE]: " input_file
KEYSTORE_FILE=${input_file:-$KEYSTORE_FILE}

read -p "Key alias [$KEY_ALIAS]: " input_alias
KEY_ALIAS=${input_alias:-$KEY_ALIAS}

read -p "Validity in days [$VALIDITY_DAYS]: " input_validity
VALIDITY_DAYS=${input_validity:-$VALIDITY_DAYS}

echo ""
echo "📝 You will be asked for:"
echo "   - Keystore password (min 6 characters)"
echo "   - Key password (can be same as keystore)"
echo "   - Organization details"
echo ""
read -p "Press Enter to continue..."

# Generate keystore
keytool -genkey -v     -keystore $KEYSTORE_FILE     -keyalg RSA     -keysize 2048     -validity $VALIDITY_DAYS     -alias $KEY_ALIAS     -storetype JKS

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Keystore created successfully!"
    echo "📁 File: $KEYSTORE_FILE"
    echo ""
    echo "📋 Next steps:"
    echo "   1. Move $KEYSTORE_FILE to android/ folder"
    echo "   2. Create android/key.properties with:"
    echo ""
    echo "storePassword=YOUR_STORE_PASSWORD"
    echo "keyPassword=YOUR_KEY_PASSWORD"
    echo "keyAlias=$KEY_ALIAS"
    echo "storeFile=../$KEYSTORE_FILE"
    echo ""
    echo "   3. Keep this file SAFE and secure!"
    echo "   4. NEVER commit keystore to git!"
else
    echo ""
    echo "❌ Failed to create keystore!"
    exit 1
fi
