import 'package:flutter/material.dart';
import 'Modal/Geeta_modal.dart';

bool eng = false;
bool guj = false;
bool hindi = false;
bool san = true;

class Home_page extends StatefulWidget {
  Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    jsonmodel jss = ModalRoute.of(context)!.settings.arguments as jsonmodel;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 1,
              child: Image.asset(
                'lib/Modal/Images/bhagwati5.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'Home');
                  },
                  icon: Icon(
                    Icons.home_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                (eng == true)
                    ? Text(
                        '${jss.english}',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )
                    : Text(''),
                SizedBox(
                  height: 40,
                ),
                (guj == true)
                    ? Text(
                        "${jss.gujrati}",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )
                    : Text(''),
                SizedBox(
                  height: 40,
                ),
                (hindi == true)
                    ? Text(
                        "${jss.hindi}",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )
                    : Text(''),
                SizedBox(
                  height: 40,
                ),
                (san == true)
                    ? Text(
                        "${jss.bhagvatgitaslok}",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )
                    : Text(''),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              eng = !eng;
                            });
                          },
                          child: Text(
                            "English",
                            style: TextStyle(color: Colors.black),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              guj = !guj;
                            });
                          },
                          child: Text(
                            "Gujrati",
                            style: TextStyle(color: Colors.black),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              hindi = !hindi;
                            });
                          },
                          child: Text(
                            "Hindi",
                            style: TextStyle(color: Colors.black),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              san = !san;
                            });
                          },
                          child: Text(
                            "Sanskrit",
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
