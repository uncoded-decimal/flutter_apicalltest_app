import 'package:flutter/material.dart';
import 'general.dart';
import 'programming.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: new Scaffold(
        body: TabBarView(
          children: [
            new Container(
              color: Colors.yellow,
              child: MyGeneralPage(),
            ),
            new Container(
              color: Colors.orange,
              child: MyProgPage(),
            ),
          ],
        ),
          bottomNavigationBar: new TabBar(
            tabs: [
              Tab(
                text: 'General',
              ),
              Tab(
                text: 'Programming',
              ),
            ],
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.red,
          )
      ),
    );

  }

}

