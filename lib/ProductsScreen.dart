import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_projects/EachProduct.dart';
import 'package:http/http.dart' as http;

class ProductsScreen extends StatefulWidget {
  final String username;
  const ProductsScreen({super.key, required this.username});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final List<ProductDataModel> listOfProducts = [];
  Future<void> getFromApi() async {
    try{
      final response = await http.get(Uri.parse("https://dummyjson.com/products"));
      if(response.statusCode == 200)
        {
          Map<String, dynamic> jsonData = jsonDecode(response.body);
          for(var p in jsonData['products'])
            {
              ProductDataModel product = ProductDataModel.fromApi(p);
              listOfProducts.add(product);
            }
        }
    }catch(error){
      debugPrint('Error:$error');
    }
  }

  @override
  void initState(){
    super.initState();
    getFromApi().then((value) {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2D2F41),
      appBar: AppBar(
        leading: const Icon(
          Icons.accessibility_new,
        ),
        backgroundColor: Colors.blue,
        title: Text(
          "Welcome, ${widget.username}",
        ),
      ),
      body: GridView.builder(
          itemCount: listOfProducts.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => EachProduct(product: listOfProducts[index])
                    ),
                );
              },
              child: Container(
                    height: 200,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                           topRight: Radius.circular(20),
                          ),
                          child: Image.network(
                            listOfProducts[index].productImage,
                            fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                            children: [
                              Text(
                                  listOfProducts[index].productName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                listOfProducts[index].productPrice.toString()+ '\$'
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      ),
    );
  }
}

class ProductDataModel {
  String productName;
  int productPrice;
  String productImage;
  String productDescription;

  ProductDataModel({
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productDescription
  });

  factory ProductDataModel.fromApi(Map<String, dynamic> json){
    return ProductDataModel(
        productName: json['title'],
        productPrice: json['price'],
        productImage: json['thumbnail'],
        productDescription: json['description'],
    );
  }
}



