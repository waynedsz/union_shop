import 'package:flutter/material.dart';

class HomeHero extends StatelessWidget {
  const HomeHero({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.imageUrl,
    required this.onButtonPressed,
  });

  final String title;
  final String subtitle;
  final String buttonText;
  final String imageUrl;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black54,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width < 360 ? 16 : 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width < 360 ? 22 : 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.width < 360 ? 8 : 12),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width < 360 ? 14 : 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                      height:
                          MediaQuery.of(context).size.width < 360 ? 16 : 24),
                  ElevatedButton(
                    onPressed: onButtonPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4d2963),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical:
                            MediaQuery.of(context).size.width < 360 ? 8 : 12,
                      ),
                    ),
                    child: Text(
                      buttonText,
                      style: const TextStyle(letterSpacing: 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
