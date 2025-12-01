import 'package:flutter/material.dart';
import '../../domain/usecases/fetch_products.dart';
import '../../domain/entities/product.dart';

class ProductViewModel extends ChangeNotifier {
  final FetchProducts fetchProducts;
  List<Product> products = [];

  ProductViewModel(this.fetchProducts);

  Future<void> loadProducts() async {
    products = await fetchProducts();
    notifyListeners();
  }
}
