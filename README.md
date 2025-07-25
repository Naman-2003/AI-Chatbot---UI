# 🎙️ AI Voice Chatbot App

A cross-platform AI-powered **voice chatbot** app with a **FastAPI backend** and a **Flutter-based mobile UI**. Speak to your device — get intelligent audio responses instantly!

---

## ✅ Features

- 🎤 **Voice Input**: Record user speech via microphone in the Flutter app.
- 🔁 **Real-Time Communication**: Audio sent to the FastAPI backend via `MultipartRequest`.
- 🧠 **AI Understanding**: Transcription with Whisper, response via OpenAI/OpenRouter.
- 🔊 **Voice Reply**: Converts AI-generated response into human-like audio.
- 📲 **Seamless Playback**: Flutter plays the audio response.

---

## 🧩 Tech Stack

### 🔹 Frontend: Flutter

| Dependency         | Description                           |
|--------------------|---------------------------------------|
| `http`             | API communication                     |
| `provider`         | State management                      |
| `record`           | Voice recording                       |
| `audioplayers`     | Playing audio responses               |
| `permission_handler` | Microphone and storage permissions |
| `path_provider`    | Storage access                        |
| `mime`             | Audio file type handling              |

### Required Android Permissions

```xml
<uses-permission android:name="android.permission.RECORD_AUDIO"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
🔹 Backend: FastAPI (Python)
Package	Use
fastapi	API framework
uvicorn	ASGI server
openai	AI text generation (OpenAI/OpenRouter)
python-dotenv	Environment variables
pydub	Audio processing
ffmpeg-python	Audio format conversion
whisper	Speech-to-text transcription
requests	HTTP calls to external APIs

🔄 Communication Flow
mermaid
Copy
Edit
sequenceDiagram
    participant User
    participant Flutter App
    participant FastAPI Server
    participant OpenAI/OpenRouter
    participant TTS Engine

    User->>Flutter App: Tap mic & speak
    Flutter App->>Flutter App: Record audio (.wav / .mp3)
    Flutter App->>FastAPI Server: Send audio via Multipart POST /chat
    FastAPI Server->>FastAPI Server: Transcribe using Whisper
    FastAPI Server->>OpenAI/OpenRouter: Send text → Get reply
    FastAPI Server->>TTS Engine: Convert text → audio
    FastAPI Server->>Flutter App: Send audio response
    Flutter App->>Flutter App: Play response to user
📦 API Endpoint
POST /chat
Request: multipart/form-data

audio: recorded voice file

Response: audio file (.mp3 or .wav)

🚀 Getting Started
Backend
bash
Copy
Edit
git clone <repo-url>
cd backend
python -m venv venv
source venv/bin/activate  # or venv\Scripts\activate on Windows
pip install -r requirements.txt
uvicorn main:app --reload
Flutter App
bash
Copy
Edit
cd flutter_app
flutter pub get
flutter run
✅ Ensure you have Flutter SDK and a working Android/iOS setup.

📁 Project Structure
css
Copy
Edit
📦 ai_voice_chatbot
 ┣ 📂 backend
 ┃ ┣ 📜 main.py
 ┃ ┣ 📜 utils.py
 ┃ ┗ 📜 requirements.txt
 ┣ 📂 flutter_app
 ┃ ┣ 📂 lib
 ┃ ┃ ┣ 📜 main.dart
 ┃ ┃ ┣ 📜 chat_screen.dart
 ┃ ┃ ┗ 📜 audio_service.dart
 ┃ ┣ 📜 pubspec.yaml
 ┗ 📜 README.md
