class Product {
  final String name;
  final String imagePath;
  final double price;
  final String description;

  Product({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String? ?? '',
      imagePath: map['imagePath'] as String? ?? '',
      price: (map['price'] is num) ? (map['price'] as num).toDouble() : 0.0,
      description: map['description'] as String? ?? '',
    );
  }
}
