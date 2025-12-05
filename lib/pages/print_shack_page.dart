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
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButton<String>(
                      value: _selectedProduct,
                      items: const [
                        DropdownMenuItem(
                          value: 'T-Shirt',
                          child: Text('T-Shirt'),
                        ),
                        DropdownMenuItem(
                          value: 'Hoodie',
                          child: Text('Hoodie'),
                        ),
                        DropdownMenuItem(
                          value: 'Mug',
                          child: Text('Mug'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => _selectedProduct = value);
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Enter custom message',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() => _customMessage = value);
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Message: $_customMessage',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButton<String>(
                      value: _selectedSize,
                      items: const [
                        DropdownMenuItem(
                          value: 'S',
                          child: Text('Small (S)'),
                        ),
                        DropdownMenuItem(
                          value: 'M',
                          child: Text('Medium (M)'),
                        ),
                        DropdownMenuItem(
                          value: 'L',
                          child: Text('Large (L)'),
                        ),
                        DropdownMenuItem(
                          value: 'XL',
                          child: Text('XL'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => _selectedSize = value);
                        }
                      },
                    ),
                    Text(
                      'Size: $_selectedSize',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButton<String>(
                      value: _selectedColor,
                      items: const [
                        DropdownMenuItem(
                          value: 'Black',
                          child: Text('Black'),
                        ),
                        DropdownMenuItem(
                          value: 'White',
                          child: Text('White'),
                        ),
                        DropdownMenuItem(
                          value: 'Red',
                          child: Text('Red'),
                        ),
                        DropdownMenuItem(
                          value: 'Blue',
                          child: Text('Blue'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => _selectedColor = value);
                        }
                      },
                    ),
                    Text(
                      'Color: $_selectedColor',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Preview:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Product: $_selectedProduct',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Message: $_customMessage',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Size: $_selectedSize',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Color: $_selectedColor',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/print-shack-about');
                      },
                      child: const Text(
                        'Learn more about Print Shack',
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
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
