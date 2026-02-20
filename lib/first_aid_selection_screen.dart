import 'package:flutter/material.dart';

class FirstAidSelectionScreen extends StatelessWidget {
  const FirstAidSelectionScreen({super.key});

  static const Color primaryRed = Color(0xFFD32F2F);

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
          "First Aid Type",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "What is the situation?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 50),

            Row(
              children: [

                // UNCONSCIOUS
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 150,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: primaryRed,
                          width: 2,
                        ),
                      ),
                      child: const Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Icon(Icons.airline_seat_flat,
                              size: 50,
                              color: Color(0xFFD32F2F)),
                          SizedBox(height: 15),
                          Text(
                            "Unconscious",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFFD32F2F),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // TRAUMA
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 150,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: primaryRed,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Icon(Icons.healing,
                              size: 50,
                              color: Colors.white),
                          SizedBox(height: 15),
                          Text(
                            "Trauma",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
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