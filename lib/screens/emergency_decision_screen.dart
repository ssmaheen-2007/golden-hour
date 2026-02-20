import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'first_aid_screen.dart';

class EmergencyDecisionScreen extends StatelessWidget {
  const EmergencyDecisionScreen({super.key});

  static const Color primaryRed = Color(0xFFD32F2F);

  Future<void> _callEmergency() async {
    final Uri callUri = Uri(scheme: 'tel', path: '112');
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          "Emergency Action",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text(
                "Choose Immediate Action",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 50),

              // ALERT 112 BUTTON
              SizedBox(
                width: double.infinity,
                height: 65,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryRed,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: _callEmergency,
                  icon: const Icon(Icons.call, color: Colors.white),
                  label: const Text(
                    "ALERT 112",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // GIVE FIRST AID BUTTON
              SizedBox(
                width: double.infinity,
                height: 65,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: primaryRed, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FirstAidScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.medical_services, color: primaryRed),
                  label: const Text(
                    "GIVE FIRST AID",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryRed,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}