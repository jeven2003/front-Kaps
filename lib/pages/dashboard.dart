import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

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
          backgroundColor: Colors.white38,
          items: const[
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood, color: Colors.brown,),
                label: 'Menu',
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
          title: Text('KAPS COFFEE SHOP',
          style: TextStyle(
              fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          ),
          backgroundColor: Colors.brown[700],
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterCarousel(
                  options: CarouselOptions(
                    height: 400.0,
                    showIndicator: true,
                    slideIndicator: CircularSlideIndicator(),
                  ),
                  items: [
                    'assets/one.jpg',
                    'assets/two.jpg',
                    'assets/three.jpg',
                    'assets/four.jpg',
                    'assets/five.jpg',
                  ].map((String imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        )
    );
  }
}