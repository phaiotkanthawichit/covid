import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Covid 2022.02"),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  print('get data covid');
                  _GetCovidData();
                }
                //tooltip: 'เช็ดข้อมูลล่าสุด',
                )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[Text("Hello word")],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('Help'),
          onPressed: () {
            print("Click Help");
          },
        ));
  }
}

//https://covid19.ddc.moph.go.th/api/Cases/today-cases-all

Future<String> _GetCovidData() async {
  var Url = Uri.https('covid19.ddc.moph.go.th', '/api/Cases/today-cases-all');

  var response = await http.get(url);
  print('----------DATA -------');
  print(response);
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My appication covid",
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

void main() {
  runApp(App());
}
