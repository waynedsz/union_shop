import 'package:flutter/material.dart';
import 'package:union_shop/reusable_content/header.dart';
import 'package:union_shop/reusable_content/footer.dart';
import 'package:union_shop/reusable_content/home_screen_widgets/navigation_controller.dart';

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

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _sectionCard(Widget child) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }

  Widget _styledDropdown({
    required String value,
    required List<DropdownMenuItem<String>> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: value,
        items: items,
        isExpanded: true,
        underline: const SizedBox.shrink(),
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Print Shack',
        onNavigateHome: () => NavigationController.goHome(context),
        onSearchPressed: () => NavigationController.goSearch(context),
        onAboutPressed: () => NavigationController.goAbout(context),
        onLoginPressed: () => NavigationController.goLogin(context),
        onCartPressed: () => NavigationController.goCart(context),
        onPrintShackPressed: () => NavigationController.goPrintShack(context),
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              height: 160,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/print_banner.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
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
                          const SizedBox(height: 32),
                          _sectionCard(
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _sectionTitle('Choose a product'),
                                const SizedBox(height: 12),
                                _styledDropdown(
                                  value: _selectedProduct,
                                  items: const [
                                    DropdownMenuItem(
                                        value: 'T-Shirt',
                                        child: Text('T-Shirt')),
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
                              ],
                            ),
                          ),
                          _sectionCard(
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _sectionTitle('Custom message'),
                                const SizedBox(height: 12),
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
                          _sectionCard(
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _sectionTitle('Select size'),
                                const SizedBox(height: 12),
                                _styledDropdown(
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
                              ],
                            ),
                          ),
                          _sectionCard(
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _sectionTitle('Select colour'),
                                const SizedBox(height: 12),
                                _styledDropdown(
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
                              ],
                            ),
                          ),
                          _sectionCard(
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _sectionTitle('Preview'),
                                const SizedBox(height: 12),
                                Text('Product: $_selectedProduct',
                                    style: const TextStyle(fontSize: 16)),
                                Text('Message: $_customMessage',
                                    style: const TextStyle(fontSize: 16)),
                                Text('Size: $_selectedSize',
                                    style: const TextStyle(fontSize: 16)),
                                Text('Color: $_selectedColor',
                                    style: const TextStyle(fontSize: 16)),
                              ],
                            ),
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
                    borderRadius: BorderRadius.circular(12)),
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
