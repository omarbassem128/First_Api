
import 'package:flutter/material.dart';
import 'package:flutter_projects/ProductsScreen.dart';

class EachProduct extends StatelessWidget {
  final ProductDataModel product;
  const EachProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
            product.productImage,
            height:300,
            width: double.infinity,
            fit:BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            product.productName,
            style: const TextStyle(
              fontSize: 40,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
           Text(
            product.productDescription,
             style: const TextStyle(
               fontSize: 25,
             ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            style: const TextStyle(
              fontSize: 18,
              color: Colors.green
            ),
            '${product.productPrice}\$'
          ),
        ],
      ),

    );
  }
}
