import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:theosis/project/my_flutter_icons.dart';
import 'package:theosis/project/theme/colors.dart';
import 'package:theosis/project/theme/styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    HomePageTab1(),
    Text('Search Tab'),
    Text('Notifications Tab'),
    Text('Profile Tab'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double W = MediaQuery.of(context).size.width;
    double H = MediaQuery.of(context).size.height;
    return Scaffold(
        bottomNavigationBar: new Theme(data: Theme.of(context).copyWith(
      // sets the background color of the `BottomNavigationBar`
        canvasColor: Colors.black,
        // sets the active color of the `BottomNavigationBar` if `Brightness` is light
        primaryColor: Colors.red,
        textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: Colors.yellow))), // sets the inactive color of the `BottomNavigationBar`
    child: BottomNavigationBar(
            backgroundColor: Colors.black,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(MyFlutterApp.globe),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped)),
        backgroundColor: Colors.black,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ));
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.0), // Adds padding around the search bar
      child: TextField(
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          hintStyle: TextStyle(color: ProjectColors.salmonColor.withOpacity(0.5)),
          hintText: 'Kirchenväter Suchfunktion...',
          // Placeholder text
          suffixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          // Icon on the right
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          // Padding inside the text field
          border: OutlineInputBorder(
            // Defines the border
            borderRadius: BorderRadius.circular(30), // Rounded corners
            borderSide: BorderSide(
              color: Colors.grey, // Color of the border
            ),
          ),
          enabledBorder: OutlineInputBorder(
            // Border style when TextField is enabled but not focused
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: ProjectColors.salmonColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            // Border style when TextField is focused
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: ProjectColors.salmonColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

class HomeTab1Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(height: 250.0),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            child: Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),child:
                                Image.asset('assets/img/wustenvater.png'
                                  ,height:250,fit: BoxFit.fitHeight,
                                )),
                                Positioned(
                                  bottom:30,
                                  right: 10,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Neueste Folge',
                                        style: TextStyle(
                                            height: 1,
                                            fontSize: 20.0,color: Colors.white),
                                      ),

                                      Text(
                                        'Die Wüstenväter',
                                        style: TextStyle(
                                            height: 1,
                                            fontFamily: "BriemItalic",
                                            fontSize: 25.0,color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ));
                },
              );
            }).toList(),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child:  DotsIndicator(
                dotsCount: 4,
                position: 1,
                decorator: DotsDecorator(
                    color: Colors.white,
                    activeColor: ProjectColors.creamYellow
                ),
              ))
        ],
      ),
    );
  }
}

class HomeTab1Carousel2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(height: 300.0,enableInfiniteScroll: false),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),child:
                                Image.asset('assets/img/martyr.png'
                                  ,height:200,fit: BoxFit.fitHeight,
                                )),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                          'Eps 10 | Die Märtyrer Christi',
                                          style: TextStyle(
                                              height: 1,
                                              fontSize: 20.0,color: Colors.white),
                                        ),
                                ),

                                      Text(
                                        '1 Hour 30 Min | Podcast',
                                        style: TextStyle(
                                            fontSize: 14.0,color: Colors.white.withOpacity(0.5)),
                                      ),
                                 ])

                            ),
                      ));
                },
              );
            }).toList(),
          ),

        ],
      ),
    );
  }
}

class HomePageTab1 extends StatelessWidget {
  const HomePageTab1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height-100,
        child: ListView(
          children: [SearchBar(), HomeTab1Carousel(),
            Text("Weiter schauen", style: ProjectStyles.homeHeader),
            HomeTab1Carousel2(),
            Text("Kinderfilme", style: ProjectStyles.homeHeader)

          ],
        ),
      ),
    );
  }
}
