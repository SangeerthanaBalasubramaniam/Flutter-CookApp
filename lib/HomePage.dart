import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'StrawberryPancakes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50.0),
                ),
                child: NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  labelType: NavigationRailLabelType.selected,
                  backgroundColor: Color(0xff1b1b1b),
                  leading: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 30.0),
                        child: Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  'https://1.bp.blogspot.com/-iFmgVUS5uaM/XsBEH7_mKJI/AAAAAAAAU4w/6uF3cCvqMZ8RdrdP3q2eBHVEL1Bfb3MxACLcBGAsYHQ/w640-h637/Jennifer%2BWinget%2Bimages%2B%252844%2529.jpg'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  destinations: <NavigationRailDestination>[
                    NavigationRailDestination(
                      icon: RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          'Breakfast',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Color(0xff969696),
                          ),
                        ),
                      ),
                      selectedIcon: RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          'Breakfast',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      label: Text(''),
                    ),
                    NavigationRailDestination(
                      icon: RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          'Lunch',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Color(0xff969696),
                          ),
                        ),
                      ),
                      selectedIcon: RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          'Lunch',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      label: Text(''),
                    ),
                    NavigationRailDestination(
                      icon: RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          'Dinner',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Color(0xff969696),
                          ),
                        ),
                      ),
                      selectedIcon: RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          'Dinner',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      label: Text(''),
                    ),
                    NavigationRailDestination(
                      icon: RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          'Dessert',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Color(0xff969696),
                          ),
                        ),
                      ),
                      selectedIcon: RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          'Dessert',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      label: Text(''),
                    ),
                  ],
                ),
              ),
            ),
            AppSpace(_selectedIndex),
          ],
        ),
      ),
    );
  }
}

class AppSpace extends StatefulWidget {
  AppSpace(this._selectedIndex);
  final int _selectedIndex;
  @override
  _AppSpaceState createState() => _AppSpaceState();
}

class _AppSpaceState extends State<AppSpace> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {},
                  ),
                ],
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 8.0, bottom: 20.0, top: 20.0),
                child: Text(
                  'Explore your\nfavourite recipe',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    AlgoSearch(text: 'Popular'),
                    AlgoSearch(text: 'Recommended'),
                    AlgoSearch(text: 'New'),
                    AlgoSearch(text: 'Top Recipes'),
                    AlgoSearch(text: 'Most Bookmarked'),
                  ],
                ),
              ),
              SizedBox(
                height: 28,
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  CarouselSlider(
                    items: [
                      GestureDetector(child: WidgetCard(name: 'Cookie Cup Cake', nameDes: '20 min | Easy', link: 'https://images.unsplash.com/photo-1574085733277-851d9d856a3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDV8fHxlbnwwfHx8fA%3D%3D&w=1000&q=80'),),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StrawberryPancakes()),
                          );
                        },
                        child: WidgetCard(name: 'Strawberry Pancakes', nameDes: '30 min | Medium', link: 'https://images.unsplash.com/photo-1598214886806-c87b84b7078b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHBhbmNha2VzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',),
                      ),
                      GestureDetector(child: WidgetCard(name: 'Chocolate Fudge', nameDes: '10 min | Easy', link: 'https://images.unsplash.com/photo-1583528225108-295481722b35?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y2hvY29sYXRlJTIwZnVkZ2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),),
                    ],
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      aspectRatio: 4 / 5,
                      pauseAutoPlayOnTouch: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
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

class AlgoSearch extends StatefulWidget {
  final String text;
  const AlgoSearch({required this.text});

  @override
  _AlgoSearchState createState() => _AlgoSearchState();
}

class _AlgoSearchState extends State<AlgoSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xfffeb800),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        '${widget.text}',
      ),
    );
  }
}

class WidgetCard extends StatefulWidget {
  final String name;
  final String nameDes;
  final String link;
  const WidgetCard({required this.name, required this.nameDes, required this.link});

  @override
  _WidgetCardState createState() => _WidgetCardState();
}

class _WidgetCardState extends State<WidgetCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.all(3.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 5.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage(
                  '${widget.link}',
                ),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Text(
                  '${widget.name}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${widget.nameDes}',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 15.0,
          left: 5.0,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark_border),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
