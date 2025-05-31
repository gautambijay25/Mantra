/* Provides UI components for building a Flutter app. */
import 'package:flutter/material.dart';
/*A package used for playing audio files in a Flutter app. */
import 'package:audioplayers/audioplayers.dart';

/* The intl package is used for internationalization and formatting dates, numbers, and currencies. */
import 'package:intl/intl.dart';

/*Reading user input from the console*/
import 'dart:io';

/* This is the main function where execution starts when the app runs. */
void main() {
  /*
  •runApp() is a built-in Flutter function that takes a widget and makes it the root of the widget tree.
  • Mantra() is the widget being used as the main app widget (it should be a class that extends StatelessWidget or StatefulWidget).
  • This widget defines the structure and UI of the app. */

  runApp(Mantra());
}

/*
1️⃣ StatelessWidget 🟢
  • Does not change over time (immutable).
  • Used for UI elements that remain the same once built.
  • Example: A simple text or icon that doesn’t change dynamically.
 */

/*
2️⃣ StatefulWidget 🔴
  • Can change dynamically (mutable).
  • Used for interactive elements (buttons, forms, animations).
  • Requires a separate State class to manage changes.
*/

/*
🔥 Key Differences
 _________________________________________________________________________
| Feature         StatelessWidget        StatefulWidget                   |
|_________________________________________________________________________|
| Can change?          No                                   Yes           |
| Has state?           No                       Yes (inside State class)  |
| Performance         Faster                    Slightly heavier          |
| Usage               Static UI                 Interactive UI            |
|_________________________________________________________________________|
*/

/*
When to Use What?
  • ✅ Use StatelessWidget when your UI doesn’t change (e.g., static text, logos, icons).
  • ✅ Use StatefulWidget when your UI needs to update (e.g., forms, buttons, animations).
*/

class Mantra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Roboto'),
      home: MantraHomePage(),
    );
  }
}

class MantraHomePage extends StatefulWidget {
  @override
  _MantraHomePageState createState() => _MantraHomePageState();
}

class _MantraHomePageState extends State<MantraHomePage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  int currentIndex = 0;
  String? currentPlaying;
  late String today;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  /*
	•	It’s a map (or dictionary) where:
	•	The key is a String representing the day of the week (e.g., 'Monday').
	•	The value is a String representing the deities or gods associated with that day.
*/

  final Map<String, String> dayDeities = {
    'Sunday': 'Raviwar - Sun God, Lord Vishnu, Lord Hanuman',
    'Monday': 'Somwar - Lord Shiva',
    'Tuesday': 'Mangalwar - Lord Hanuman, Durga, Kartikeya',
    'Wednesday': 'Budhwar - Lord Krishna, Lord Ganesha',
    'Thursday': 'Guruvar - Lord Vishnu, Sai Baba, Brihaspati Dev',
    'Friday': 'Shukrawar - Goddess Lakshmi, Durga, Santoshi Mata',
    'Saturday': 'Shaniwar - Lord Shani, Hanuman, Bhairava',
  };

  /*
✅ Outer Layer
	•	Type: Map<String, ...>
	•	Purpose: Maps each day of the week (e.g., "Sunday", "Monday", etc.) to a list of audio items.
	•	Example Key: 'Monday'

✅ Middle Layer
	•	Type: List<...>
	•	Purpose: A list of audio entries for that day.
	•	Each entry in the list represents one audio item (like a mantra or aarti).

✅ Inner Layer
	•	Type: Map<String, String>
	•	Purpose: Each map contains two string key-value pairs:
	•	'name': the title of the audio.
	•	'path': the path to the audio file in the assets directory.
*/

  final Map<String, List<Map<String, String>>> audioMap = {
    'Sunday': [
      {
        'name': 'Surya Gayatri Mantra',
        'path': 'assets/audio/1_Surya_Dev_Gayatri_Mantra.mp3',
      },

      {'name': 'Aditya Hrudaya', 'path': 'assets/audio/1_Aditya_Hrudaya.mp3'},

      {
        'name': 'Surya Tantrik Beej Mantra 108 Times',
        'path': 'assets/audio/1_Surya_Tantrik Beej_Mantra.mp3',
      },

      {
        'name': 'Om Jai Jagdish Hare (Aarti)',
        'path': 'assets/audio/1_Om_Jai_Jagdish_Hare_Aarti.mp3',
      },

      {'name': 'Surya Chalisa', 'path': 'assets/audio/1_Surya_Chalisa.mp3'},
    ],

    'Monday': [
      {
        'name': 'Om Jai Shiv Omkara',
        'path': 'assets/audio/2_Om_Jai_Shiv_Omkara.mp3',
      },

      {
        'name': 'Maha Mrityunjaya Mantra',
        'path': 'assets/audio/2_Mahamrityunjay_Mantra.mp3',
      },

      {'name': 'Lingashtakam', 'path': 'assets/audio/2_Lingashtakam.mp3'},

      {'name': 'Rudrashtakam', 'path': 'assets/audio/2_Shiv_Rudrashtakam.mp3'},

      {'name': 'Shiva Tandava', 'path': 'assets/audio/2_Shiva_Tandava.mp3'},

      {'name': 'Shiv Chalisa', 'path': 'assets/audio/2_Shiv_Chalisa.mp3'},
    ],

    'Tuesday': [
      {'name': 'Hanuman Aarti', 'path': 'assets/audio/3_hanuman_Aarti.mp3'},

      {'name': 'Hanuman Chalisa', 'path': 'assets/audio/3_Hanuman_Chalisa.mp3'},

      {
        'name': 'Bajrang Baan',
        'path': 'assets/audio/3_Bajrang_Baan  (Hanuman).mp3',
      },

      {'name': 'Aigiri Nandini', 'path': 'assets/audio/3_Aigiri Nandini.mp3'},

      {
        'name': 'Durga Chalisa',
        'path': 'assets/audio/3_Durga_Chalisa (Namo Namo Durge).mp3',
      },

      {
        'name': 'Subramanya Ashtakam (for Lord Kartikeya)',
        'path': 'assets/audio/3_Sri_Subramanya_Ashtakam.mp3',
      },

      {
        'name': 'Om Jai Ambe Gauri (Durga Aarti)',
        'path': 'assets/audio/3_Jai_Ambe_Gauri(Durga Aarti).mp3',
      },
    ],

    'Wednesday': [
      {
        'name': ' Ganesh Aarti - Jai Ganesh Jai Ganesh Deva',
        'path': 'assets/audio/4_Jai_Ganesh Deva(Aarti).mp3',
      },

      {
        'name': 'Gajanan Maharaj Aarti',
        'path': 'assets/audio/4_GAJANAN_MA_ARAJ(AARTI).mp3',
      },

      {
        'name': 'Krishna Aarti - Om Jai Jagdish Hare',
        'path': 'assets/audio/4_ Om_Jai Jagdish_Hare(Aarti).mp3',
      },

      {'name': 'Krishna Bhajan', 'path': 'assets/audio/4_Krishna_Bhajan.mp3'},

      {
        'name': 'Govind Damodar Madhaveti Stotra (Krishna Bhajan)',
        'path': 'assets/audio/4_Govind_Damodar(Stotra).mp3',
      },

      {
        'name': 'Vishnu Sahasranamam',
        'path': 'assets/audio/4_Vishnu_Sahasranamam.mp3',
      },
    ],

    'Thursday': [
      {
        'name': 'Shri Sai Baba Aarti',
        'path': 'assets/audio/5_Aarti_Saibaba.mp3',
      },

      {'name': 'Sai Chalisa', 'path': 'assets/audio/5_Sai_Chalisa.mp3'},

      {'name': 'Guru Stotram', 'path': 'assets/audio/5_Guru_Stotram.mp3'},

      {
        'name': 'Dakshinamurthy Stotra ( Brihaspati Dev)',
        'path': 'assets/audio/5_Dakshinamurthy_Stotram.mp3',
      },

      {
        'name': 'Om Namo Bhagavate Vasudevaya',
        'path': 'assets/audio/5_OM_Namo_Bhagavate_Vasudevaya_11_Times.mp3',
      },
    ],

    'Friday': [
      {'name': 'Lakshmi Aarti', 'path': 'assets/audio/6_Laxmi_Mata_Aarti.mp3'},

      {'name': 'Lakshmi Bhajan', 'path': 'assets/audio/6_Lakshmi.mp3'},

      {
        'name': 'Kanakadhara Stotra (Lakshmi Devi Stotra)',
        'path': 'assets/audio/6_Kanakadhara_Stotram.mp3',
      },

      {
        'name': 'Om Shreem Mahalakshmi Mantra',
        'path':
            'assets/audio/6_Maha_Laxmi Mantra _ Om_Shreem Mahalakshmiyei Namaha _108.mp3',
      },

      {
        'name': 'Annapurna Stotra',
        'path': 'assets/audio/6_Annapurna_Stotram.mp3',
      },

      {
        'name': 'Santoshi Mata Vrat Katha',
        'path': 'assets/audio/6_Santoshi_Mata_Vrat_Katha_Avam_Aarti.mp3',
      },
    ],

    'Saturday': [
      {'name': 'Shani Dev Aarti', 'path': 'assets/audio/7_Shani_Dev_Aarti.mp3'},

      {'name': 'Shani Chalisa', 'path': 'assets/audio/7_Shani_Chalisa.mp3'},

      {'name': 'Shani Stotram', 'path': 'assets/audio/7_Shani_Stotram.mp3'},

      {
        'name': 'Kaal Bhairav Ashtakam',
        'path': 'assets/audio/7_Kaal_Bhairav_Ashtakam.mp3',
      },

      {
        'name': 'Bhairav Chalisa',
        'path': 'assets/audio/7_Batuk_Bhairav_Chalisa.mp3',
      },

      {'name': 'Hanuman Chalisa', 'path': 'assets/audio/7_Hanuman_Chalisa.mp3'},
    ],
  };

  @override
  void initState() {
    super.initState();
    //Tody extract from EEEE format
    today = DateFormat('EEEE').format(DateTime.now());
    //This is used to give manual day
    //today = 'Saturday';
    _audioPlayer.onPlayerComplete.listen((event) {
      _playNext();
    });
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
      });
    });
    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _position = position;
      });
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String minutes = twoDigits(duration.inMinutes);
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  void _toggleAudio(int index) async {
    List<Map<String, String>> songs = audioMap[today] ?? [];
    if (songs.isEmpty || index >= songs.length) return;

    try {
      if (isPlaying && currentIndex == index) {
        await _audioPlayer.pause();
        setState(() {
          isPlaying = false;
        });
      } else {
        await _audioPlayer.stop();
        await _audioPlayer.play(
          AssetSource(songs[index]['path']!.replaceFirst('assets/', '')),
        );
        setState(() {
          isPlaying = true;
          currentPlaying = songs[index]['name'];
          currentIndex = index;
        });
      }
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  void _playNext() {
    List<Map<String, String>> songs = audioMap[today] ?? [];
    if (songs.isEmpty) return;
    int nextIndex = (currentIndex + 1) % songs.length;
    _toggleAudio(nextIndex);
  }

  void _playPrevious() {
    List<Map<String, String>> songs = audioMap[today] ?? [];
    if (songs.isEmpty) return;
    int prevIndex = (currentIndex - 1 + songs.length) % songs.length;
    _toggleAudio(prevIndex);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _exitApp() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Exit App"),
            content: Text("Are you sure you want to exit?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Cancel"),
              ),
              TextButton(onPressed: () => exit(0), child: Text("Exit")),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> songs = audioMap[today] ?? [];
    String deities = dayDeities[today] ?? "";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ॐ Mantra ॐ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.white),
            onPressed: _exitApp,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade200, Colors.orange.shade600],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Today is $today ",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,

                color: Colors.white,
              ),
            ),

            Text(
              deities,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,

                color: Colors.white,
              ),
            ),

            SizedBox(height: 10),
            Text(
              isPlaying ? "Now Playing: $currentPlaying" : "",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Slider(
                    min: 0,
                    max: _duration.inSeconds.toDouble(),
                    value: _position.inSeconds.toDouble(),
                    onChanged: (value) async {
                      await _audioPlayer.seek(Duration(seconds: value.toInt()));
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDuration(_position),
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        _formatDuration(_duration),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.skip_previous,
                    size: 40,
                    color: Colors.white,
                  ),
                  onPressed: _playPrevious,
                ),
                IconButton(
                  icon: Icon(
                    isPlaying
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_fill,
                    size: 50,
                    color: Colors.white,
                  ),
                  onPressed: () => _toggleAudio(currentIndex),
                ),
                IconButton(
                  icon: Icon(Icons.skip_next, size: 40, color: Colors.white),
                  onPressed: _playNext,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.music_note, color: Colors.deepOrange),
                      title: Text(
                        songs[index]['name']!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: Icon(
                        isPlaying && currentIndex == index
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_fill,
                        color: Colors.deepOrange,
                      ),
                      onTap: () => _toggleAudio(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
