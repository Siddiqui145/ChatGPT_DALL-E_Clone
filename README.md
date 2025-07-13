# 🤖 ChatGPT_DALL-E_CLONE - AI Voice Assistant App

Allen is a smart AI-powered voice assistant built using **Flutter**, **ChatGPT**, and **DALL·E**. It listens to your voice commands, understands what you need, and responds accordingly — either by generating text-based responses (via ChatGPT) or AI-generated images (via DALL·E).

## 🚀 Features

- 🎙️ **Voice Recognition**: Converts speech to text using `speech_to_text`.
- 🧠 **ChatGPT Integration**: Understands your queries and returns intelligent responses.
- 🎨 **DALL·E Integration**: Generates images from text prompts using OpenAI's image generation API.
- 🔊 **Text-to-Speech**: Speaks out responses using `flutter_tts`.
- 💡 **Animated UI**: Smooth, engaging animations using `animate_do`.
- 🎯 **Real-Time Feedback**: Displays generated content (text/image) dynamically.
- 🛠️ Fully customizable & extendable.

## 📱 Screenshots
 |![ChatGPT_DALL-E_Clone](https://github.com/user-attachments/assets/f06c4e0c-4521-444f-8c46-27b32c95610c)


---

## 🧩 Tech Stack

- **Flutter** (Frontend)
- **OpenAI API** (`gpt-3.5-turbo` & DALL·E)
- **Packages Used**:
  - [`speech_to_text`](https://pub.dev/packages/speech_to_text)
  - [`flutter_tts`](https://pub.dev/packages/flutter_tts)
  - [`http`](https://pub.dev/packages/http)
  - [`animate_do`](https://pub.dev/packages/animate_do)

---

## 🔧 Installation

1. **Clone the repo**
   ```bash
   git clone https://github.com/Siddiqui145/ChatGPT_DALL-E_Clone.git
   cd ChatGPT_DALL-E_Clone
   
2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Set up your OpenAI API key**

   * Create a file named `secrets.dart` inside `lib/`
   * Add the following content:

     ```dart
     const openAIKey = 'your-openai-api-key';
     ```

4. **Run the app**

   ```bash
   flutter run
   ````

---

## 🛡️ Permissions Required

Ensure you add microphone and internet permissions in your `AndroidManifest.xml` and `Info.plist` files.

### Android (`android/app/src/main/AndroidManifest.xml`)

```xml
<uses-permission android:name="android.permission.RECORD_AUDIO"/>
<uses-permission android:name="android.permission.INTERNET"/>
```

### iOS (`ios/Runner/Info.plist`)

```xml
<key>NSMicrophoneUsageDescription</key>
<string>This app needs access to the microphone for voice input.</string>
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsArbitraryLoads</key><true/>
</dict>
```

---

## 📦 Project Structure

```
lib/
├── main.dart
├── home_screen.dart        # UI and state management
├── open_ai_service.dart    # ChatGPT & DALL·E API integration
├── pallete.dart            # Color palette
├── secrets.dart            # API Key (excluded from version control)
assets/
└── images/
    └── virtualAssistant.png
```

---

## ✨ Future Improvements

* 🌍 Support multiple languages
* 📱 Responsive layout for tablets
* 🔐 Secure API key storage
* 📥 Voice command history/log

---

## 🙌 Acknowledgements

* OpenAI for GPT and DALL·E APIs
* Flutter community and plugins developers
* [Flutter Animate\_do package](https://pub.dev/packages/animate_do)

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Taha Siddiqui**
[GitHub](https://github.com/Siddiqui145)

---

### ✅ Next Steps

- Replace `your-openai-api-key`, `your-username`, and `Your Name` with your actual credentials.
- Add real screenshots if possible in `assets/screenshots/`.
- Consider adding `.gitignore` for `secrets.dart`.
