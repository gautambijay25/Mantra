# 🕉️ Mantra - A Devotional Audio App

🕉️**Mantra** is a Flutter-based mobile application that plays devotional mantras and aartis based on the current day of the week. Each day is associated with specific deities, and the app curates a list of relevant audio tracks for easy access and spiritual immersion.

## 📱 Features
- 📅 Automatically detects the current day.
- 🎧 Plays audio mantras and aartis categorized by weekday.
- ⏯️ Toggle play/pause of mantras.
- ⏭️ Play next or previous track in sequence.
- 🔁 Auto-plays the next track after one ends.
- ⏱️ Displays current position and duration of audio.
- 🧘‍♂️ Highlights deities worshipped on each day.
- ❌ Exit confirmation dialog.

## 🗂️ Folder Structure
assets/
└── audio/
└── .mp3
lib/
└── main.dart
pubspec.yaml


## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  audioplayers: ^0.20.1
  intl: ^0.18.1


🛠️ How to Run
	1.	Clone this repository:
git clone https://github.com/yourusername/mantra_app.git
cd mantra_app

	2.	Get packages:
flutter pub get

	3.	Run the app:
flutter run

📋 Notes
	•	Ensure all audio files are present under the assets/audio/ folder and listed correctly in pubspec.yaml.
	•	The app auto-detects the current weekday using intl and loads the associated mantras.
	•	You can override the current day manually by changing today = 'Saturday'; inside initState() for testing.

💡 Future Enhancements
	•	Add images of deities.
	•	Add looping and shuffle options.
	•	Add favorites or bookmarking.
	•	Integrate lyrics display or meaning of mantras.

🧘‍♀️ Inspiration

This app was created with a focus on spirituality, devotion, and mindfulness, especially to encourage daily prayer and meditation in a structured way.

📧 Contact

Author: Bijay Gautam
📬 Email: gautambijay25@gmail.com