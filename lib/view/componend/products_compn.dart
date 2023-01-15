import 'package:app_store/view/componend/Golbes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Productscomp extends StatefulWidget {
  const Productscomp({super.key});

  @override
  State<Productscomp> createState() => _ProductscompState();
}

class _ProductscompState extends State<Productscomp> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            ...golbes.itme.map(
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
                            child: Image.asset("${e['i']}", fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            golbes.total = golbes.total + int.parse(e['p']);
                            golbes.t.addAll([e]);
                            golbes.tex = golbes.tex + (golbes.total * (5/100));
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
        ),
      ),
    );
  }
}
