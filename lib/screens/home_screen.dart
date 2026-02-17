import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

            const SizedBox(height: 20),

            const Text(
              "Golden Hour",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [

                    // Animated expanding ring
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        double value = _controller.value;

                        return Container(
                          width: 220 + (value * 80),
                          height: 220 + (value * 80),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red.withValues(
                              alpha: 0.4 * (1 - value),
                            ),
                          ),
                        );
                      },
                    ),

                    // Main Button
                    GestureDetector(
                      onTap: () {
                        print("Help Now Pressed");
                      },
                      child: Container(
                        width: 220,
                        height: 220,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: const Icon(
                          Icons.warning_rounded,
                          color: Colors.white,
                          size: 90,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "About & Settings",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
