import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyProgPage extends StatefulWidget {
  MyProgPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyProgPage> {
//  var jokes = new List<Post>();

  @override
  void initState() {
//    if(list.isEmpty)
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//          title: Text(widget.title),
//        ),
        body: isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              int id = list[index].id;
              String setup = list[index].setup;
              String punchline = list[index].punchline;

              return Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      '$id',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 9.0),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      '$setup',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      '$punchline',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 12.0),
                    ),
//                    Divider()
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[Colors.grey, Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                    )),
              )
//              ListTile(
//              contentPadding: EdgeInsets.all(10.0),
//              title: new Text(list[index].setup),
//            )
                  ;
            }));
  }

  List<Post> list = List();
  var url = 'https://official-joke-api.appspot.com/jokes/programming/ten';
  var isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(url);
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new Post.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }
}

class Post {
  int id;
  String type;
  String setup;
  String punchline;

  Post({this.id, this.type, this.setup, this.punchline});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        type: json['general'],
        setup: json['setup'],
        punchline: json['punchline']);
  }
}
