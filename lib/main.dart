import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'data/datasources/product_remote_datasource.dart';
import 'data/repositories/product_repository_impl.dart';
import 'domain/usecases/fetch_products.dart';
import 'presentation/viewmodels/product_viewmodel.dart';
import 'presentation/screens/product_screen.dart';

void main() {
  final dio = Dio();
  final remote = ProductRemoteDataSource(dio);
  final repo = ProductRepositoryImpl(remote);
  final fetchProducts = FetchProducts(repo);

  runApp(
    ChangeNotifierProvider(
      create: (_) => ProductViewModel(fetchProducts),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FakeStore API',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: ProductScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
