import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geeta_pr/app/home_screen/provider/english_provider.dart';
import 'package:geeta_pr/app/intro_screen/intro_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/home_screen/views/Home_page.dart';
import 'app/home_screen/modal/Geeta_modal.dart';
import 'app/splesh_screen/splesh_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isvisited = preferences.getBool("isIntroVisited") ?? false;
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider<EnglishProvider>(
              create: (ctx) => EnglishProvider()),
        ],
        builder: (ctx, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: true),
            routes: {
              '/': (context) => const Splash(),
              'Intro': (context) => const intro_page(),
              'Home': (context) => const Home(),
              'Home_screen': (context) => Home_page()
            },
          );
        }),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/asset/Images/images.jpg"),
                    fit: BoxFit.cover),
                color: Colors.black),
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
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, mainAxisExtent: 180),
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: const DecorationImage(
                              image: AssetImage("lib/asset/Images/bhagwat.jpg"),
                              opacity: 0.1,
                              fit: BoxFit.cover),
                        ),
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(5),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  data[index].chpter.toString(),
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.75),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: AutofillHints.jobTitle),
                                ),
                              ),
                              const SizedBox(
                                  // height: 10,
                                  ),
                              Center(
                                child: Text(
                                  data[index].bhagvatgitaslok,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.75),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      fontFamily: AutofillHints.jobTitle),
                                ),
                              ),
                              // const Divider(
                              //   height: 20,
                              //   color: Colors.black,
                              // )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1,
                  child: Image.asset('lib/asset/Images/bhagwat3.jpg',
                      fit: BoxFit.fill),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
