import 'package:flutter/material.dart';
import 'package:the_national_dawn/Common/Constants.dart';
import 'package:the_national_dawn/Screens/HomeCalendarScreen.dart';
import 'package:the_national_dawn/Screens/HomeCategoryScreen.dart';
import 'package:the_national_dawn/Screens/HomeNetworkScreen.dart';
import 'package:the_national_dawn/Screens/HomeScreen.dart';
import 'package:the_national_dawn/Screens/HomeStoriesScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HomeCalendarScreen(),
    HomeCategoryScreen(),
    HomeStoriesScreen(),
    HomeNetworkScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 17, left: 25, right: 25, top: 8),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            // boxShadow: <BoxShadow>[
            borderRadius: BorderRadius.circular(17),
            border: Border.all(color: Colors.grey[200]),
            boxShadow: [
              BoxShadow(
                offset: const Offset(1.0, 3.0),
                blurRadius: 3.0,
                color: Colors.grey[400],
                spreadRadius: 1.0,
              ),
            ],
            //   ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.white,
                primaryColor: Colors.white,
                textTheme: Theme.of(context)
                    .textTheme
                    .copyWith(caption: TextStyle(color: Colors.white)),
              ),
              child: BottomNavigationBar(
                // backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,

                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                          height: 20,
                          width: 20,
                          child: _selectedIndex == 0
                              ? Icon(
                                  Icons.home,
                                  color: appPrimaryMaterialColor,
                                )
                              : Icon(
                                  Icons.home,
                                  color: Colors.grey[300],
                                )

//                        Image.asset(
//                          _selectedIndex == 0
//                              ? "assets/Home.png"
//                              : "assets/Home.png",
//                          // color: Colors.white,
//                        ),
                          ),
                    ),
                    //   icon: Icon(Icons.home),
                    title: FittedBox(child: Text('Home')),
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          _selectedIndex == 1
                              ? "assets/calender.png"
                              : "assets/unCalender.png",
                        ),
                      ),
                    ),
                    title: FittedBox(child: Text('Calendar')),
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          _selectedIndex == 2
                              ? "assets/category.png"
                              : "assets/unCategory.png",
                          //  color: Colors.white,
                        ),
                      ),
                    ),
                    title: FittedBox(child: Text('Category')),
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          _selectedIndex == 3
                              ? "assets/success.png"
                              : "assets/unSuccess.png",
                        ),
                      ),
                    ),
                    title: FittedBox(child: Text('Stories')),
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          _selectedIndex == 4
                              ? "assets/network.png"
                              : "assets/unNetwork.png",
                          // color: Colors.white,
                        ),
                      ),
                    ),
                    title: FittedBox(
                      child: Text('1-2-1'),
                    ),
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: appPrimaryMaterialColor,
                unselectedItemColor: Colors.grey[400],
                onTap: _onItemTapped,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
