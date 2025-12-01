import '../repositories/product_repository.dart';
import '../entities/product.dart';

class FetchProducts {
  final ProductRepository repository;

  FetchProducts(this.repository);

  Future<List<Product>> call() async {
    return await repository.getProducts();
  }
}
