import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geeta_pr/Views/intro_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home_page.dart';
import 'Modal/Geeta_modal.dart';
import 'Views/splesh_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isvisited = preferences.getBool("isIntroVisited") ?? false;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    routes: {
      '/': (context) => Splash(),
      'Intro': (context) => intro_page(),
      'Home': (context) => Home(),
      'Home_screen': (context) => Home_page()
    },
  ));
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1,
              child: Image.asset('lib/Modal/Images/bhagwati5.jpg',
                  fit: BoxFit.fill),
            ),
            FutureBuilder(
              future: rootBundle.loadString("json.json"),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  String JsonData = snapshot.data;
                  List myData = jsonDecode(JsonData);
                  List data =
                      myData.map((e) => jsonmodel.fromjson(Data: e)).toList();
                  return GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          jsonmodel js = jsonmodel(
                              id: data[index].id,
                              bhagvatgitaslok: data[index].bhagvatgitaslok,
                              english: data[index].english,
                              hindi: data[index].hindi,
                              gujrati: data[index].gujrati,
                              chpter: data[index].chpter);
                          Navigator.pushNamed(context, 'Home_screen',
                              arguments: js);
                        },
                        child: Container(
                          height: 300,
                          width: 240,
                          padding: EdgeInsets.all(5),
                          color: Colors.transparent,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  data[index].chpter.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  data[index].bhagvatgitaslok,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Divider(
                                  height: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Container(
                  height: MediaQuery.of(context).size.height / 1,
                  child: Image.asset('lib/Modal/Images/bhagwat3.jpg',
                      fit: BoxFit.fill),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
