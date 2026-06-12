# 🔐 Keystore Setup Guide

## What is a Keystore?
A keystore is a security file used to sign your Android apps. **NEVER LOSE THIS FILE!**

---

## Option 1: Automatic Generation (Linux/Mac)

```bash
# Run the keystore generator script
bash generate_keystore.sh
```

Follow the prompts and enter:
- Keystore password (min 6 characters)
- Key password (can be same as keystore)
- Your organization details

---

## Option 2: Manual Generation

### Step 1: Generate Keystore

```bash
keytool -genkey -v     -keystore upload-keystore.jks     -keyalg RSA     -keysize 2048     -validity 10000     -alias upload     -storetype JKS
```

### Step 2: Move Keystore

```bash
# Move keystore to android folder
mv upload-keystore.jks android/
```

### Step 3: Create key.properties

Create file `android/key.properties`:

```properties
storePassword=YOUR_STORE_PASSWORD
keyPassword=YOUR_KEY_PASSWORD
keyAlias=upload
storeFile=../upload-keystore.jks
```

**⚠️ IMPORTANT:**
- NEVER commit `key.properties` or `upload-keystore.jks` to git!
- Add them to `.gitignore`
- Keep backups in a secure location

---

## Option 3: Using Android Studio

1. Open Android Studio
2. Build → Generate Signed Bundle/APK
3. Create new keystore
4. Fill in the details
5. Save the keystore file

---

## Verification

Verify your keystore:

```bash
keytool -list -v     -keystore android/upload-keystore.jks     -alias upload
```

---

## For Google Play Store (App Signing)

1. Build AAB (not APK):
   ```bash
   flutter build appbundle --flavor customer --release
   ```

2. Go to [Google Play Console](https://play.google.com/console)

3. Create new app

4. Go to Setup → App Integrity → App Signing

5. Upload your keystore or let Google manage it

6. Upload your AAB file

---

## For App Store (iOS)

1. Build iOS:
   ```bash
   flutter build ios --flavor customer --release
   ```

2. Open Xcode:
   ```bash
   open ios/Runner.xcworkspace
   ```

3. Product → Archive

4. Distribute App → App Store Connect

5. Follow the wizard

---

## 🔒 Security Best Practices

1. **Backup your keystore** in multiple secure locations
2. **Use strong passwords** (min 8 characters, mixed case, numbers)
3. **Never share** keystore files or passwords
4. **Store offline** in encrypted storage
5. **Use different keystores** for different apps

---

## 📞 Support

If you lose your keystore, you **CANNOT** update your app on Google Play!
Contact Google Play Support for assistance.
