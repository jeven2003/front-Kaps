import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Kaps App'),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Image.network('https://vaya.in/recipes/wp-content/uploads/2018/05/Coffee.jpg'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.brown,

        child: Icon (
            Icons.add,
            color: Colors.black,
        ),

      ),
    ),
  ));
}



