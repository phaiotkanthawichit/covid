import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:covid/data_api.dart';
import 'dart:async';
import 'dart:convert';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  //DataApi _dataFromWebAPI;

  var confirmed = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    confirmed.text = '---';
  }

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
        body: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'ติดเชื้ออสะสม',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Center(
              child: Text(
                confirmed.text,
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('Help'),
          onPressed: () {
            print("Click Help");
          },
        ));
  }

//https://covid19.ddc.moph.go.th/api/Cases/today-cases-all

  Future _GetCovidData() async {
    var Url = Uri.https('covid19.ddc.moph.go.th', '/api/Cases/today-cases-all');

    var response = await http.get(Url);
    if (response.statusCode == 200) {
      print('----------DATA -------');
      print(response.body);
    } else {
      print("Faild");
    }

    print('----------result json-------');
    print(json.decode(response.body));
    var mapObject = jsonDecode(response.body);
    print('----------mapObject -------');
    print(mapObject[0]);
    


    //_dataFromWebAPI = dataApiFromJson(response.body);

    //  var v1 = result["new_case"];

    //  setState(() {
    //    confirmed.text = v1;
    //  });
  }
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
