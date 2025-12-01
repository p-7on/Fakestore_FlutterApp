// lib/presentation/screens/product_screen.dart
import 'package:fakestore_api_app/presentation/viewmodels/product_viewmodel.dart';
import 'package:fakestore_api_app/presentation/views/cells/product_listcell.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    // Lade die Produkte direkt beim Starten des Screens
    final vm = Provider.of<ProductViewModel>(context, listen: false);
    vm.loadProducts(); // Diese Methode wird jetzt sofort beim Öffnen des Screens aufgerufen
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ProductViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: vm.products.length,
              itemBuilder: (context, index) {
                final product = vm.products[index];
                return ProductListCell(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
