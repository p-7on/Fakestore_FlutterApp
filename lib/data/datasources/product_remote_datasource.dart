import 'package:dio/dio.dart';
import 'package:fakestore_api_app/domain/entities/product.dart';

class ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSource(this.dio);

  Future<List<Product>> fetchProducts() async {
    final response = await dio.get('https://fakestoreapi.com/products');
    return (response.data as List).map((e) => Product.fromJson(e)).toList();
  }
}
