class Product {
  final String name;
  final String imagePath;
  final double price;
  final String description;
  final bool isOnSale;
  final double? discountPercent;
  final DateTime? createdAt;

  Product({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
    this.isOnSale = false,
    this.discountPercent,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime(2000);

  /// Always returns a non-null createdAt (defaults to year 2000).
  DateTime get safeCreatedAt => createdAt ?? DateTime(2000);

  factory Product.fromMap(Map<String, dynamic> map) {
    final dynamic rawImage = map['imagePath'] ?? map['image'];

    DateTime _parseCreatedAt(dynamic value) {
      if (value is DateTime) return value;
      if (value is String) {
        try {
          return DateTime.parse(value);
        } catch (_) {
          return DateTime(2000);
        }
      }
      return DateTime(2000);
    }

    return Product(
      name: map['name'] as String? ?? '',
      imagePath: rawImage as String? ?? '',
      price: (map['price'] is num) ? (map['price'] as num).toDouble() : 0.0,
      description: map['description'] as String? ?? '',
      isOnSale: map['isOnSale'] as bool? ?? false,
      discountPercent: (map['discountPercent'] as num?)?.toDouble(),
      createdAt: _parseCreatedAt(map['createdAt']),
    );
  }
}
