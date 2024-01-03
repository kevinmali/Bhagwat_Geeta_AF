import 'package:flutter/material.dart';
import '../modal/Geeta_modal.dart';

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
                'lib/asset/Images/bhagwati5.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'Home');
                  },
                  icon: const Icon(
                    Icons.home_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                const Divider(
                  height: 30,
                ),
                (eng == true)
                    ? Text(
                        '${jss.english}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      )
                    : const Text(''),
                const Divider(
                  height: 30,
                ),
                (guj == true)
                    ? Text(
                        "${jss.gujrati}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      )
                    : const Text(''),
                const Divider(
                  height: 30,
                ),
                (hindi == true)
                    ? Text(
                        "${jss.hindi}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      )
                    : const Text(''),
                const Divider(
                  height: 30,
                ),
                (san == true)
                    ? Text(
                        "${jss.bhagvatgitaslok}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      )
                    : const Text(''),
                const Divider(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            eng = !eng;
                          });
                        },
                        child: Container(
                            height: 50,
                            width: 80,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDwIgg1EUTnliT2bc9g17dHiTAdh35nQf4VZ-RQNq1M6mtDUK-SSgv1ut2jt5q7nbZ89I&usqp=CAU"),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "English",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            guj = !guj;
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 80,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDwIgg1EUTnliT2bc9g17dHiTAdh35nQf4VZ-RQNq1M6mtDUK-SSgv1ut2jt5q7nbZ89I&usqp=CAU"),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Gujrati",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            hindi = !hindi;
                          });
                        },
                        child: Container(
                            height: 50,
                            width: 80,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDwIgg1EUTnliT2bc9g17dHiTAdh35nQf4VZ-RQNq1M6mtDUK-SSgv1ut2jt5q7nbZ89I&usqp=CAU"),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Hindi",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                            height: 50,
                            width: 80,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDwIgg1EUTnliT2bc9g17dHiTAdh35nQf4VZ-RQNq1M6mtDUK-SSgv1ut2jt5q7nbZ89I&usqp=CAU"),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Sanskrit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
