import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _data = Data();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text('Introduction Cake', textAlign: TextAlign.center),
            leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
            actions: [
              Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.search)),
            ]),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.cake),
                title: Text('My Cake'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contacts),
                title: Text('Contact'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ]),
        body: _buildCakeBodyWidget(),
      ),
    );
  }

  Widget _buildCakeBodyWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(padding: EdgeInsets.only(top: 10.0)),
        _buildCakeNews(),
        _buildCakeBoughtAlots(),
      ],
    );
  }

  Widget _buildCakeNews() {
    return Column(children: [
      _buildCakeText('Cake News'),
      _buildCakeNewsList(),
    ]);
  }

  Widget _buildCakeNewsList() {
    return Container(
      height: 180.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5.5),
        itemCount: _data.getLength(),
        itemBuilder: _itemNewListBuilder,
      ),
    );
  }

  Widget _itemNewListBuilder(BuildContext context, int index) {
    return Container(
      width: 185.0,
      child: Card(
        child: Column(children: [
          Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(top: 10.0, right: 10.0),
              child: Text('New', style: TextStyle(color: Colors.blue))),
          Expanded(
            child: Stack(children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Icon(Icons.cake, color: Colors.blue, size: 70.0)),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: double.infinity,
                    height: 50.0,
                    padding: EdgeInsets.only(top: 10.0),
                    color: Colors.blue.shade300,
                    child: _buildCakeInfoText(_data.getTitle(index),
                        _data.getPrice(index), Colors.white)),
              ),
            ]),
          ),
        ]),
      ),
    );
  }

  Widget _buildCakeBoughtAlots() {
    return Column(children: [
      Padding(padding: EdgeInsets.only(top: 10.0)),
      _buildCakeText('Cake is bought a lot'),
      _buildBoughtAlotList(),
    ]);
  }

  Widget _buildBoughtAlotList() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      height: 255.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
          itemCount: _data.getLength(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
          itemBuilder: _itemAlotListBuilder),
    );
  }

  Widget _itemAlotListBuilder(BuildContext context, int index) {
    print(context);
    return Container(
      child: Card(
        child: Row(children: [
          Expanded(
            child: Stack(children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Hot', style: TextStyle(color: Colors.blue)),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Center(
                    child: Column(children: [
                      Icon(Icons.cake, color: Colors.blue, size: 70.0),
                      _buildCakeInfoText(_data.getTitle(index),
                          _data.getPrice(index), Colors.blue),
                      Divider(),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart,
                                size: 20.0, color: Colors.blue),
                            Text('Add to cart',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 15.0)),
                          ]),
                    ]),
                  ),
                ),
              )
            ]),
          ),
        ]),
      ),
    );
  }
}

Widget _buildCakeText(String text) {
  return Padding(
    padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 10.0),
    child: Row(children: [
      Container(width: 3.0, height: 25.0, color: Colors.blue),
      Padding(padding: EdgeInsets.only(right: 10.0)),
      Text(text, style: TextStyle(fontSize: 20.0, color: Colors.black)),
    ]),
  );
}

Widget _buildCakeInfoText(String name, String price, Color color) {
  return Column(children: [
    Text(name, style: TextStyle(color: color, fontSize: 13.0)),
    Text('$price\$', style: TextStyle(color: color, fontSize: 13.0)),
  ]);
}

class Data {
  Map fetchedData = {
    'listCakes': [
      {'id': 1, 'title': 'Butter Cake', 'price': '20'},
      {'id': 2, 'title': 'Strawberry Cake', 'price': '30'},
      {'id': 3, 'title': 'Banana Cake', 'price': '40'},
      {'id': 4, 'title': 'Grapes Cake', 'price': '15'},
    ]
  };
  List _listCakes;

  Data() {
    _listCakes = fetchedData['listCakes'];
  }

  String getTitle(int index) {
    return _listCakes[index]['title'];
  }

  String getPrice(int index) {
    return _listCakes[index]['price'];
  }

  int getLength() {
    return _listCakes.length;
  }
}
