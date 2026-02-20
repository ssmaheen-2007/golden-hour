import 'dart:async';
import 'package:flutter/material.dart';

class CprFlowScreen extends StatefulWidget {
  const CprFlowScreen({super.key});

  @override
  State<CprFlowScreen> createState() => _CprFlowScreenState();
}

class _CprFlowScreenState extends State<CprFlowScreen> {
  int _cycleSeconds = 120;
  Timer? _cycleTimer;

  void startCycle() {
    _cycleTimer?.cancel();
    _cycleSeconds = 120;

    _cycleTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _cycleSeconds--;
        if (_cycleSeconds <= 0) {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _cycleTimer?.cancel();
    super.dispose();
  }

  String get cycleFormatted {
    final m = (_cycleSeconds ~/ 60).toString().padLeft(2, '0');
    final s = (_cycleSeconds % 60).toString().padLeft(2, '0');
    return "$m:$s";
  }

  Widget ageButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: startCycle,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F4F6),
        elevation: 0,
        title: const Text("CPR Guidance"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text(
              "Who is affected?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 20),

            ageButton("Adult"),
            ageButton("Child"),
            ageButton("Infant"),

            const SizedBox(height: 40),

            if (_cycleSeconds < 120)
              Column(
                children: [
                  const Text("Compression Cycle"),
                  const SizedBox(height: 10),
                  Text(
                    cycleFormatted,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD32F2F),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
