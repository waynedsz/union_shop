import 'product.dart';

final Map<String, List<Map<String, dynamic>>> _rawCollectionProducts = {
  'Hoodies': [
    {
      'name': 'Purple Hoodie',
      'image': 'assets/images/products/hoodie_1.png',
      'price': 35.00,
    },
    {
      'name': 'White Hoodie',
      'image': 'assets/images/products/hoodie_2.png',
      'price': 32.00,
    },
  ],
  'T-Shirts': [
    {
      'name': 'Beige Crest T-Shirt',
      'image': 'assets/images/products/tshirt_1.png',
      'price': 18.00,
    },
    {
      'name': 'Grey Crest T-Shirt',
      'image': 'assets/images/products/tshirt_2.png',
      'price': 18.00,
    },
  ],
  'Accessories': [
    {
      'name': 'Tote Bag',
      'image': 'assets/images/products/accessory_tote.png',
      'price': 10.00,
    },
    {
      'name': 'Beanie',
      'image': 'assets/images/products/accessory_beanie.png',
      'price': 12.00,
    },
  ],
  'New Arrivals': [
    {
      'name': 'Notebook',
      'image': 'assets/images/products/notebook.png',
      'price': 6.00,
    },
    {
      'name': 'Water Bottle',
      'image': 'assets/images/products/water_bottle.png',
      'price': 14.00,
    },
  ],
};

final Map<String, List<Product>> collectionProducts =
    _rawCollectionProducts.map((collectionName, products) => MapEntry(
          collectionName,
          products.map((p) => Product.fromMap(p)).toList(),
        ));
