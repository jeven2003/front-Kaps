import 'package:flutter/material.dart';

import '../Services/product.dart';

class selectedProducts extends StatefulWidget {
  final Product product;
  const selectedProducts({super.key, required this.product});

  @override
  State<selectedProducts> createState() => _selectedProductsState();
}

class _selectedProductsState extends State<selectedProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Order'),
          backgroundColor: Colors.brown[700],
          centerTitle: true,
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
          children: [
          Text(widget.product.productName),
          Text(widget.product.description),
          ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children : [
               Text(widget.product.price.toString()),
        ],
          ),
         ]
        )
      );
    }
  }
