import 'package:flutter/material.dart';
import 'package:geeta_pr/app/home_screen/provider/english_provider.dart';
import 'package:provider/provider.dart';
import '../modal/Geeta_modal.dart';

bool san = true;

class Home_page extends StatelessWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    jsonmodel jss = ModalRoute.of(context)!.settings.arguments as jsonmodel;
    return Scaffold(
      body: SingleChildScrollView(
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
            (Provider.of<EnglishProvider>(context, listen: true)
                        .englishModel
                        .english ==
                    true)
                ? Text(
                    jss.english,
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                  )
                : const Text(''),
            const Divider(
              height: 30,
            ),
            (Provider.of<EnglishProvider>(context, listen: true)
                        .englishModel
                        .gujarati ==
                    true)
                ? Text(
                    jss.gujrati,
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                  )
                : const Text(''),
            const Divider(
              height: 30,
            ),
            (Provider.of<EnglishProvider>(context, listen: true)
                        .englishModel
                        .hindi ==
                    true)
                ? Text(
                    jss.hindi,
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                  )
                : const Text(''),
            const Divider(
              height: 30,
            ),
            (san == true)
                ? Text(
                    jss.bhagvatgitaslok,
                    style: const TextStyle(color: Colors.white, fontSize: 22),
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
                      Provider.of<EnglishProvider>(context, listen: false)
                          .english();
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
                      Provider.of<EnglishProvider>(context, listen: false)
                          .gujarati();
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
                      Provider.of<EnglishProvider>(context, listen: false)
                          .hindi();
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
                  Container(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
