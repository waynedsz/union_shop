import 'package:union_shop/reusable_content/product_widgets/product.dart';

final Map<String, List<Product>> collectionProducts = {
  'Hoodies': [
    Product(
      name: 'Purple Hoodie',
      imagePath: 'assets/images/products/hoodie_1.png',
      price: 35.00,
      description: 'A soft, premium purple hoodie perfect for daily wear.',
      isOnSale: true,
      category: 'Hoodies',
    ),
    Product(
      name: 'White Hoodie',
      imagePath: 'assets/images/products/hoodie_2.png',
      price: 32.00,
      description: 'A clean, stylish white hoodie with a comfortable fit.',
      category: 'Hoodies',
    ),
  ],
  'T-Shirts': [
    Product(
      name: 'Beige Crest T-Shirt',
      imagePath: 'assets/images/products/tshirt_1.png',
      price: 18.00,
      description: 'A beige t-shirt featuring the university crest.',
      category: 'T-Shirts',
    ),
    Product(
      name: 'Grey Crest T-Shirt',
      imagePath: 'assets/images/products/tshirt_2.png',
      price: 18.00,
      description: 'A grey t-shirt with a minimalist crest design.',
      category: 'T-Shirts',
      isOnSale: true,
    ),
  ],
  'Accessories': [
    Product(
      name: 'Tote Bag',
      imagePath: 'assets/images/products/accessory_tote.png',
      price: 10.00,
      description: 'A durable tote bag perfect for books or groceries.',
      category: 'Accessories',
    ),
    Product(
      name: 'Beanie',
      imagePath: 'assets/images/products/accessory_beanie.png',
      price: 12.00,
      description: 'A warm knitted beanie ideal for cold days.',
      isOnSale: true,
      category: 'Accessories',
    ),
  ],
  'New Arrivals': [
    Product(
      name: 'Notebook',
      imagePath: 'assets/images/products/notebook.png',
      price: 6.00,
      description: 'A lined notebook for lectures, notes, and sketches.',
      category: 'New Arrivals',
    ),
    Product(
      name: 'Water Bottle',
      imagePath: 'assets/images/products/water_bottle.png',
      price: 14.00,
      description: 'A reusable bottle to stay hydrated on campus.',
      isOnSale: true,
      category: 'New Arrivals',
    ),
  ],
};
final List<Product> allProductsList =
    collectionProducts.values.expand((list) => list).toList();
