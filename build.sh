#!/usr/bin/env bash
# Локальная сборка APK. Нужны: Node.js 18+, JDK 17, Android SDK (ANDROID_HOME) или Android Studio.
set -e
npm install
[ -d android ] || npx cap add android
npx capacitor-assets generate --android
npx cap sync android
(cd android && chmod +x gradlew && ./gradlew assembleDebug)
echo "Готово: android/app/build/outputs/apk/debug/app-debug.apk"
