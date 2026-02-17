import 'package:flutter/material.dart';
import 'emergency_decision_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.10, end: 0.25).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: Center( // ✅ TRUE vertical + horizontal centering
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min, // ✅ Prevents stretching
              children: [

                // Brand
                const Text(
                  "GOLDEN HOUR",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  "Emergency Response",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    letterSpacing: 1,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 40),

                // Directive
                const Text(
                  "If this is an emergency,\nact immediately.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 60),

                // Animated Panic Button with Pulse Fade Halo
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [

                        // 🔴 Fading Halo
                        Transform.scale(
                          scale: _scaleAnimation.value,
                          child: Container(
                            width: 230,
                            height: 230,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFB71C1C)
                                  .withOpacity(_opacityAnimation.value),
                            ),
                          ),
                        ),

                        // Main Button
                        SizedBox(
                          width: 190,
                          height: 190,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB71C1C),
                              shape: const CircleBorder(),
                              elevation: 14,
                              shadowColor: Colors.black38,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const EmergencyDecisionScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "HELP\nNOW",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.8,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 40),

                const Text(
                  "Tap to begin immediate assistance",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
