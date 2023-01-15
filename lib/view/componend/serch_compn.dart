import 'package:app_store/view/componend/Golbes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class search_com extends StatefulWidget {
  const search_com({super.key});

  @override
  State<search_com> createState() => _search_comState();
}

class _search_comState extends State<search_com> {
  String? se;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CupertinoSearchTextField(
              onChanged: (value) {
                setState(() {
                  se = value;
                });
              },
            ),
            (se == "shirt" || se == "Shirt")
                ? Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ...golbes.shi.map(
                        (e) => Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 75,
                                    width: 75,
                                    // color: Colors.amber,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      child: Image.asset("${e['i']}",
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${e['n']}",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        "\$ ${e['p']}",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      golbes.total =
                                          golbes.total + int.parse(e['p']);
                                      golbes.t.addAll([e]);
                                      golbes.tex = golbes.tex +
                                          (golbes.total * (5 / 100));
                                    },
                                    child: Icon(CupertinoIcons.add_circled),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey,
                                thickness: 0.5,
                                // endIndent: 150,
                                indent: 78,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : (se == "i" || se == "iPhone" || se == "iphone")
                    ? Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          ...golbes.iphome.map(
                            (e) => Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 75,
                                        width: 75,
                                        // color: Colors.amber,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          child: Image.asset("${e['i']}",
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${e['n']}",
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            "\$ ${e['p']}",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          golbes.total =
                                              golbes.total + int.parse(e['p']);
                                          golbes.t.addAll([e]);
                                          golbes.tex = golbes.tex +
                                              (golbes.total * (5 / 100));
                                        },
                                        child: Icon(CupertinoIcons.add_circled),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                    thickness: 0.5,
                                    // endIndent: 150,
                                    indent: 78,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
          ],
        ),
      ),
    );
  }
}
