class Product {
  final String name;
  final String imagePath;
  final double price;
  final String description;
  final bool isOnSale;

  Product({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
    this.isOnSale = false,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    final dynamic rawImage = map['imagePath'] ?? map['image'];

    return Product(
      name: map['name'] as String? ?? '',
      imagePath: rawImage as String? ?? '',
      price: (map['price'] is num) ? (map['price'] as num).toDouble() : 0.0,
      description: map['description'] as String? ?? '',
      isOnSale: map['isOnSale'] as bool? ?? false,
    );
  }
}
