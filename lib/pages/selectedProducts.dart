import 'package:flutter/material.dart';

import '../Services/product.dart';

class selectedProducts extends StatefulWidget {
  final Product product;
  const selectedProducts({super.key,required this.product});

  @override
  State<selectedProducts> createState() => _selectedProductsState(product: product);
}

class _selectedProductsState extends State<selectedProducts> {
  final Product product;
  late double totalAmount;
  int numberOfOrders = 1;
  _selectedProductsState({required this.product});

  @override
  void initState() {
    super.initState();
    totalAmount = product.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              children: [
                Text(widget.product.productName),
                Text(widget.product.description),
              ]
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ' ₱ ${totalAmount.toString()}',
                style: TextStyle(
                  fontSize:20.0,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: (){setState(() {
                      if(numberOfOrders > 1){
                        numberOfOrders -= 1;
                        totalAmount = product.price *numberOfOrders;
                      }
                    });},
                    icon: Icon(Icons.remove),
                  ),
                  Text(
                    numberOfOrders.toString(),
                    style: TextStyle(
                        fontSize: 20.0
                    ),
                  ),
                  IconButton(
                      onPressed:(){
                        setState(() {
                          numberOfOrders +=1;
                          totalAmount = product.price * numberOfOrders;
                        });
                      },
                      icon: Icon(Icons.add)
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}