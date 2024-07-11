import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int year = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('USER PROFILE',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.brown[700],
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/beans2.png'),
              fit: BoxFit.cover
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/pic.jpg'),
                    radius: 80.0,
                  ),
                  ),
                  Divider(height: 55.0,
                  color: Colors.black,
                  thickness: 2.0,),
                  Row(
                    children: [
                      Icon(
                        Icons.person_2,
                        color: Colors.black,
                      ),
                      SizedBox(width: 3.0),
                      Text(
                        'NAME',
                        style: TextStyle(
                          fontSize: 16.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'John Vincent Eguia',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Row(
                    children: [
                      Icon(
                        Icons.male,
                        color: Colors.black,
                      ),
                      SizedBox(width: 3.0),
                      Text(
                        'SEX',
                        style: TextStyle(
                          fontSize: 16.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Male',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_sharp,
                        color: Colors.black,
                      ),
                  SizedBox(width: 3.0,),
                  Text(
                    'YEAR',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),

                  ],
                  ),
                  Text(
                    '$year Year',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      ),
                  Text(
                    'EMAIL',
                    style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                  ]
                  ),
                  Text(
                    'johneguia2003@gmail.com',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Row(
                    children: [
                      Icon(
                        Icons.location_city,
                        color: Colors.black,
                      ),
                      SizedBox(width: 3.0),
                      Text(
                        'ADDRESS',
                        style: TextStyle(
                          fontSize: 16.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Lumbang na Matanda, City of Calaca, Batangas',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),


            ],
            ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        year += 1;
                      });

                    },

                    child: Text ('Add Year',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.brown[400])
                    ),
                  ),
                ],
              ),
          ],
            ),
            ),
      ),
    );
  }
}
