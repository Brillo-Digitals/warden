import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:warden/warden_brain.dart';

void main() {
  runApp(const WardenApp());
}

class WardenApp extends StatelessWidget {
  const WardenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warden',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF2CFFFF),
        fontFamily: 'Source Sans 3',
        scaffoldBackgroundColor: const Color(0xFF050A0D),
      ),
      home: const TerminalWrapper(child: WardenPage()),
    );
  }
}

class TerminalWrapper extends StatelessWidget {
  final Widget child;
  const TerminalWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/bg_img.png',
              fit: BoxFit.cover,
              color: Colors.black.withAlpha(180),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          child,
          // Scanlines
          IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: List.generate(
                    100,
                    (index) => index % 2 == 0
                        ? Colors.black.withAlpha(15)
                        : Colors.transparent,
                  ),
                  stops: List.generate(100, (index) => index / 100),
                ),
              ),
            ),
          ),
          // CRT Flicker effect
          const IgnorePointer(child: FlickerOverlay()),
        ],
      ),
    );
  }
}

class FlickerOverlay extends StatefulWidget {
  const FlickerOverlay({super.key});

  @override
  State<FlickerOverlay> createState() => _FlickerOverlayState();
}

class _FlickerOverlayState extends State<FlickerOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 0.03).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          color: Colors.white.withAlpha((_animation.value * 255).toInt()),
        );
      },
    );
  }
}

class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final Duration durationPerChar;

  const TypewriterText({
    super.key,
    required this.text,
    required this.style,
    this.textAlign = TextAlign.center,
    this.durationPerChar = const Duration(milliseconds: 30),
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  String _displayedText = "";
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  @override
  void didUpdateWidget(TypewriterText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _startAnimation();
    }
  }

  void _startAnimation() {
    _timer?.cancel();
    _displayedText = "";
    int charIndex = 0;
    _timer = Timer.periodic(widget.durationPerChar, (timer) {
      if (charIndex < widget.text.length) {
        setState(() {
          _displayedText += widget.text[charIndex];
          charIndex++;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayedText,
      textAlign: widget.textAlign,
      style: widget.style,
    );
  }
}

class WardenPage extends StatefulWidget {
  const WardenPage({super.key});

  @override
  State<WardenPage> createState() => _WardenPageState();
}

class _WardenPageState extends State<WardenPage> {
  final AudioPlayer _bgmPlayer = AudioPlayer();
  final AudioPlayer _sfxPlayer = AudioPlayer();

  bool showMenuWarning = false;
  bool isGamePage = false;
  bool isGameInfo = false;
  bool isMenuDisplay = false;
  bool playSound = true;
  WardenBrain wardenInfo = WardenBrain();

  @override
  void initState() {
    super.initState();
    if (playSound) {
      _playBackgroundMusic();
    }
  }

  @override
  void dispose() {
    _bgmPlayer.dispose();
    _sfxPlayer.dispose();
    super.dispose();
  }

  Future<void> _playBackgroundMusic() async {
    await _bgmPlayer.stop();
    await _bgmPlayer.setReleaseMode(ReleaseMode.loop);
    await _bgmPlayer.setVolume(0.3);
    await _bgmPlayer.play(AssetSource('warden_music.mp3'));
  }

  Future<void> _stopBackgroundMusic() async {
    await _bgmPlayer.stop();
  }

  Future<void> _playButtonSound() async {
    await _sfxPlayer.play(AssetSource('warden_button_sound.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          isGamePage ? gamePage() : homePage(),
          if (showMenuWarning) menuWarning(),
          if (isGameInfo) gameInfo(),
          if (isMenuDisplay) displayMenu(),
        ],
      ),
    );
  }

  Widget gamePage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () async {
                  if (playSound) {
                    await _stopBackgroundMusic();
                  } else {
                    await _playBackgroundMusic();
                  }
                  setState(() {
                    playSound = !playSound;
                  });
                },
                icon: Icon(
                  playSound ? Icons.volume_up : Icons.volume_off,
                  color: const Color(0xFF2CFFFF),
                  size: 30,
                ),
              ),
              const Text(
                'WARDEN OS v1.0.4',
                style: TextStyle(
                  color: Color(0xFF2CFFFF),
                  fontFamily: 'Orbitron',
                  fontSize: 12,
                  letterSpacing: 2,
                ),
              ),
              TextButton(
                onPressed: () {
                  _playButtonSound();
                  setState(() {
                    showMenuWarning = true;
                  });
                },
                child: const Text(
                  'EXIT',
                  style: TextStyle(
                    color: Color(0xFF2CFFFF),
                    fontFamily: 'Orbitron',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Divider(color: Color(0xFF2CFFFF), thickness: 1),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(76),
                border: Border.all(color: const Color(0xFF2CFFFF), width: 1),
              ),
              child: SingleChildScrollView(
                child: TypewriterText(
                  text: wardenInfo.getScene(),
                  style: const TextStyle(
                    color: Color(0xFF2CFFFF),
                    fontSize: 22,
                    fontFamily: 'Source Sans 3',
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          ...List.generate(wardenInfo.getChoiceCount(), (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: SizedBox(
                height: 60,
                child: OutlinedButton(
                  onPressed: () {
                    _playButtonSound();
                    setState(() {
                      wardenInfo.nextScene(index + 1);
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xFF2CFFFF),
                      width: 1.5,
                    ),
                    shape: const RoundedRectangleBorder(),
                    backgroundColor: Colors.transparent,
                  ),
                  child: Text(
                    wardenInfo.getChoice(index + 1).toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF2CFFFF),
                      fontFamily: 'Orbitron',
                      letterSpacing: 2,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget homePage() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          const Center(
            child: Image(
              image: AssetImage('images/warden_logo_rb.png'),
              height: 200,
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'REWRITE THE FUTURE',
              style: TextStyle(
                color: Color(0xFF2CFFFF),
                fontFamily: 'Orbitron',
                letterSpacing: 5,
                fontSize: 16,
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 60,
            child: OutlinedButton(
              onPressed: () {
                _playButtonSound();
                setState(() {
                  isMenuDisplay = true;
                });
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF2CFFFF), width: 2),
                shape: const RoundedRectangleBorder(),
              ),
              child: const Text(
                'BOOT PROTOCOL',
                style: TextStyle(
                  color: Color(0xFF2CFFFF),
                  fontFamily: 'Orbitron',
                  letterSpacing: 4,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 60,
            child: OutlinedButton(
              onPressed: () {
                _playButtonSound();
                setState(() {
                  isGameInfo = true;
                });
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF2CFFFF), width: 1),
                shape: const RoundedRectangleBorder(),
              ),
              child: const Text(
                'SYSTEM INFO',
                style: TextStyle(
                  color: Color(0xFF2CFFFF),
                  fontFamily: 'Orbitron',
                  letterSpacing: 4,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget menuWarning() {
    return Container(
      color: Colors.black.withAlpha(230),
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 2),
            color: const Color(0xFF050A0D),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'TERMINATE SESSION?',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontFamily: 'Orbitron',
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _playButtonSound();
                        setState(() {
                          showMenuWarning = false;
                          isGamePage = false;
                          wardenInfo.restart();
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                      ),
                      child: const Text(
                        'YES',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _playButtonSound();
                        setState(() {
                          showMenuWarning = false;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF2CFFFF)),
                      ),
                      child: const Text(
                        'CANCEL',
                        style: TextStyle(color: Color(0xFF2CFFFF)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget gameInfo() {
    return Container(
      color: const Color(0xFF050A0D),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/bg_img.png',
              fit: BoxFit.cover,
              color: Colors.black.withAlpha(204),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'SYSTEM ARCHITECT',
                  style: TextStyle(
                    color: Color(0xFF2CFFFF),
                    fontSize: 18,
                    fontFamily: 'Orbitron',
                    letterSpacing: 3,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'ADESIYAN UTHMAN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 40),
                const Divider(color: Color(0xFF2CFFFF)),
                const ListTile(
                  leading: Icon(Icons.code, color: Color(0xFF2CFFFF)),
                  title: Text(
                    'Warden Engine v2.0.1',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.email, color: Color(0xFF2CFFFF)),
                  title: Text(
                    'uthmanadesiyan112@gmail.com',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: OutlinedButton(
                    onPressed: () {
                      _playButtonSound();
                      setState(() {
                        isGameInfo = false;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF2CFFFF)),
                    ),
                    child: const Text(
                      'BACK TO CONSOLE',
                      style: TextStyle(
                        color: Color(0xFF2CFFFF),
                        fontFamily: 'Orbitron',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget displayMenu() {
    return Container(
      color: const Color(0xFF050A0D),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            const Text(
              'SELECT PROTOCOL',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF2CFFFF),
                fontFamily: 'Orbitron',
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      height: 60,
                      child: OutlinedButton(
                        onPressed: () {
                          _playButtonSound();
                          setState(() {
                            wardenInfo.selectLevel(index);
                            isMenuDisplay = false;
                            isGamePage = true;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(0xFF2CFFFF),
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          wardenInfo.getTitle(index),
                          style: const TextStyle(
                            color: Color(0xFF2CFFFF),
                            fontFamily: 'Orbitron',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 60,
              child: OutlinedButton(
                onPressed: () {
                  _playButtonSound();
                  setState(() {
                    isMenuDisplay = false;
                  });
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white54),
                ),
                child: const Text(
                  'RETURN',
                  style: TextStyle(
                    color: Colors.white70,
                    fontFamily: 'Orbitron',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
