import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/header.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallback() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'About Us',
        onNavigateHome: () => navigateToHome(context),
        onSearchPressed: placeholderCallback,
        onAboutPressed: () {
          // Already on About; you can keep this or no-op.
          Navigator.pushNamed(context, '/about');
        },
        onLoginPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        onCartPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final width = constraints.maxWidth;
                            final height = (width * 0.25).clamp(160.0, 260.0);
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                width: double.infinity,
                                constraints:
                                    const BoxConstraints(minHeight: 160.0),
                                height: height,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey.shade50,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.06),
                                      blurRadius: 14,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/about_banner.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          "About Union Shop",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.3,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Official University merchandise, curated for you.",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[700],
                                  ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          "Our mission",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Welcome to the Union Shop! We are on a mission to give you the best University branded products.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "What we offer",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "From apparel to accessories, we carefully curate items that let you show your university pride in style.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
