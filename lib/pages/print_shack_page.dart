import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/header.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/home_screen_widgets/navigation_controller.dart';
import 'package:union_shop/reusable_content/print_shack_widgets/print_shack_section_card.dart';
import 'package:union_shop/reusable_content/print_shack_widgets/print_shack_dropdown.dart';
import 'package:union_shop/reusable_content/print_shack_widgets/print_shack_preview_card.dart';
import 'package:union_shop/reusable_content/print_shack_widgets/print_shack_banner.dart';

class PrintShackPage extends StatefulWidget {
  const PrintShackPage({super.key});

  @override
  State<PrintShackPage> createState() => _PrintShackPageState();
}

class _PrintShackPageState extends State<PrintShackPage> {
  String _selectedProduct = 'T-Shirt';
  String _customMessage = '';
  String _selectedSize = 'M';
  String _selectedColor = 'Black';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Print Shack',
        onNavigateHome: () => NavigationController.goHome(context),
        onAboutPressed: () => NavigationController.goAbout(context),
        onLoginPressed: () => NavigationController.goLogin(context),
        onCartPressed: () => NavigationController.goCart(context),
        onSearchPressed: () {},
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              color: Colors.grey[50],
              child: SingleChildScrollView(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const PrintShackBanner(),
                          const SizedBox(height: 32),
                          const Center(
                            child: Text(
                              'Custom university printing made easy.',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          PrintShackSectionCard(
                            title: 'Choose a product',
                            child: PrintShackDropdown(
                              value: _selectedProduct,
                              items: const [
                                DropdownMenuItem(
                                    value: 'T-Shirt', child: Text('T-Shirt')),
                                DropdownMenuItem(
                                    value: 'Hoodie', child: Text('Hoodie')),
                                DropdownMenuItem(
                                    value: 'Mug', child: Text('Mug')),
                              ],
                              onChanged: (value) {
                                if (value != null)
                                  setState(() => _selectedProduct = value);
                              },
                            ),
                          ),
                          PrintShackSectionCard(
                            title: 'Custom message',
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  decoration: const InputDecoration(
                                    labelText: 'Enter custom message',
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {
                                    setState(() => _customMessage = value);
                                  },
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Message preview: $_customMessage',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ),
                          PrintShackSectionCard(
                            title: 'Select size',
                            child: PrintShackDropdown(
                              value: _selectedSize,
                              items: const [
                                DropdownMenuItem(
                                    value: 'S', child: Text('Small (S)')),
                                DropdownMenuItem(
                                    value: 'M', child: Text('Medium (M)')),
                                DropdownMenuItem(
                                    value: 'L', child: Text('Large (L)')),
                                DropdownMenuItem(
                                    value: 'XL', child: Text('XL')),
                              ],
                              onChanged: (value) {
                                if (value != null)
                                  setState(() => _selectedSize = value);
                              },
                            ),
                          ),
                          PrintShackSectionCard(
                            title: 'Select colour',
                            child: PrintShackDropdown(
                              value: _selectedColor,
                              items: const [
                                DropdownMenuItem(
                                    value: 'Black', child: Text('Black')),
                                DropdownMenuItem(
                                    value: 'White', child: Text('White')),
                                DropdownMenuItem(
                                    value: 'Red', child: Text('Red')),
                                DropdownMenuItem(
                                    value: 'Blue', child: Text('Blue')),
                              ],
                              onChanged: (value) {
                                if (value != null)
                                  setState(() => _selectedColor = value);
                              },
                            ),
                          ),
                          PrintShackPreviewCard(
                            product: _selectedProduct,
                            message: _customMessage,
                            size: _selectedSize,
                            color: _selectedColor,
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, '/print-shack-about'),
                              child: const Text(
                                'Learn more about Print Shack',
                                style: TextStyle(
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Footer(),
        ],
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
          child: SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4d2963),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Custom item added')),
                );
              },
              child: const Text(
                'Add Custom Item to Cart',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
