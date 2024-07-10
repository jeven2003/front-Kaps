import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          elevation: 3.0,
          onTap: (int val){
            switch(val){
              case 0:
                Navigator.pushNamed(context, '/menu');
                break;
              case 1:
                Navigator.pushNamed(context, '/profile');
                break;
              case 2:
                Navigator.pushNamed(context, '/login');
                break;
            }
          },
          currentIndex: 0,
          items: const[
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood, color: Colors.brown,),
                label: 'Menu'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.brown),
                label: 'Profile'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout, color: Colors.brown),
                label: 'Logout'
            ),
          ],
        ),
        appBar: AppBar(
          title: Text('KAPS COFFEE SHOP'),
          backgroundColor: Colors.brown[700],
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/coffee.jpg',
                    width: 360,
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}