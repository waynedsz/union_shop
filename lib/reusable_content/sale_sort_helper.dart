import 'package:union_shop/reusable_content/product.dart';

List<Product> sortSaleProducts(List<Product> products, String sortOption) {
  final sorted = List<Product>.from(products);

  if (sortOption == 'price_low_high') {
    sorted.sort((a, b) => a.price.compareTo(b.price));
  } else if (sortOption == 'discount_high_low') {
    double discountValue(Product p) =>
        (p.discountPercent ?? 0) > 0 ? p.discountPercent! : 0;
    sorted.sort(
      (a, b) => discountValue(b).compareTo(discountValue(a)),
    );
  } else if (sortOption == 'alpha_az') {
    sorted.sort((a, b) => a.name.compareTo(b.name));
  }

  return sorted;
}
