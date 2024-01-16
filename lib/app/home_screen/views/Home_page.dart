import 'package:flutter/material.dart';
import 'package:geeta_pr/app/home_screen/provider/english_provider.dart';
import 'package:provider/provider.dart';
import '../modal/Geeta_modal.dart';

bool san = true;

class Home_page extends StatelessWidget {
  Home_page({Key? key}) : super(key: key);
  Color bcolor = Colors.black;

  @override
  Widget build(BuildContext context) {
    jsonmodel jss = ModalRoute.of(context)!.settings.arguments as jsonmodel;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height / 1,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/asset/Images/home1.jpg"),
                // opacity: 0.4,
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'Home');
                },
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                  color: bcolor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              (Provider.of<EnglishProvider>(context, listen: true)
                          .englishModel
                          .english ==
                      true)
                  ? Text(
                      jss.english,
                      style: TextStyle(color: bcolor, fontSize: 22),
                    )
                  : const Text(''),
              const SizedBox(
                height: 20,
              ),
              (Provider.of<EnglishProvider>(context, listen: true)
                          .englishModel
                          .gujarati ==
                      true)
                  ? Text(
                      jss.gujrati,
                      style: TextStyle(color: bcolor, fontSize: 22),
                    )
                  : const Text(''),
              const SizedBox(
                height: 20,
              ),
              (Provider.of<EnglishProvider>(context, listen: true)
                          .englishModel
                          .hindi ==
                      true)
                  ? Text(
                      jss.hindi,
                      style: TextStyle(color: bcolor, fontSize: 22),
                    )
                  : const Text(''),
              const SizedBox(
                height: 20,
              ),
              (san == true)
                  ? Text(
                      jss.bhagvatgitaslok,
                      style: TextStyle(color: bcolor, fontSize: 22),
                    )
                  : const Text(''),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Provider.of<EnglishProvider>(context, listen: false)
                            .english();
                      },
                      child: Container(
                          height: 50,
                          width: 80,
                          // decoration: const BoxDecoration(
                          //   image: DecorationImage(
                          //       image: NetworkImage(
                          //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDwIgg1EUTnliT2bc9g17dHiTAdh35nQf4VZ-RQNq1M6mtDUK-SSgv1ut2jt5q7nbZ89I&usqp=CAU"),
                          //       opacity: 0.5,
                          //       fit: BoxFit.fill),
                          //   borderRadius: BorderRadius.all(
                          //     Radius.circular(20),
                          //   ),
                          // ),
                          child: Center(
                            child: Text(
                              "English",
                              style: TextStyle(
                                  color: bcolor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<EnglishProvider>(context, listen: false)
                            .gujarati();
                      },
                      child: Container(
                        height: 50,
                        width: 80,
                        // decoration: const BoxDecoration(
                        //   image: DecorationImage(
                        //       image: NetworkImage(
                        //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDwIgg1EUTnliT2bc9g17dHiTAdh35nQf4VZ-RQNq1M6mtDUK-SSgv1ut2jt5q7nbZ89I&usqp=CAU"),
                        //       fit: BoxFit.fill),
                        //   borderRadius: BorderRadius.all(
                        //     Radius.circular(20),
                        //   ),
                        // ),
                        child: Center(
                          child: Text(
                            "Gujrati",
                            style: TextStyle(
                                color: bcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<EnglishProvider>(context, listen: false)
                            .hindi();
                      },
                      child: Container(
                          height: 50,
                          width: 80,
                          // decoration: const BoxDecoration(
                          //   image: DecorationImage(
                          //       image: NetworkImage(
                          //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDwIgg1EUTnliT2bc9g17dHiTAdh35nQf4VZ-RQNq1M6mtDUK-SSgv1ut2jt5q7nbZ89I&usqp=CAU"),
                          //       fit: BoxFit.fill),
                          //   borderRadius: BorderRadius.all(
                          //     Radius.circular(20),
                          //   ),
                          // ),
                          child: Center(
                            child: Text(
                              "Hindi",
                              style: TextStyle(
                                  color: bcolor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          )),
                    ),
                    Container(
                        height: 50,
                        width: 80,
                        // decoration: const BoxDecoration(
                        //   image: DecorationImage(
                        //       image: NetworkImage(
                        //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDwIgg1EUTnliT2bc9g17dHiTAdh35nQf4VZ-RQNq1M6mtDUK-SSgv1ut2jt5q7nbZ89I&usqp=CAU"),
                        //       fit: BoxFit.fill),
                        //   borderRadius: BorderRadius.all(
                        //     Radius.circular(20),
                        //   ),
                        // ),
                        child: Center(
                          child: Text(
                            "Sanskrit",
                            style: TextStyle(
                                color: bcolor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
