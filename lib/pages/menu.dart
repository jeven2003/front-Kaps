import 'package:flutter/material.dart';
import 'package:untitled2/Services/product.dart';
import 'package:untitled2/Services/menuCard.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List products = <Product>[
    Product(productName: "Iced Coffee", price: 75.99),
    Product(productName: "Iced Caramel", price: 69.00),
    Product(productName: "Milo Choco", price: 90.00),
    Product(productName: "Choco Frappe", price: 100.00),
    Product(productName: "Dark Choco", price: 75.00),
  ];

  Widget cardTemplate(product){
    return Card(
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            product.productName,
            style: TextStyle(
            fontSize: 20.0,
              fontWeight: FontWeight.w700
          ),
          ),
          Text('${product.price}',
          style: TextStyle(
            color: Colors.black,
          ),),
        ],
      ),
    ),
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Colors.brown[700],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: products.map((product) => Menucard(product: product)).toList(),
        ),
      ),
    );
  }
}
