import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Golbes.dart';

class Shopping_cart extends StatefulWidget {
  const Shopping_cart({super.key});

  @override
  State<Shopping_cart> createState() => _Shopping_cartState();
}

class _Shopping_cartState extends State<Shopping_cart> {
  late TextEditingController? textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List l = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  DateTime k = DateTime.now();
  TimeOfDay h =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          CupertinoTextField(
            textInputAction: TextInputAction.next,
            placeholder: "Name",
            prefix: Icon(
              CupertinoIcons.person_fill,
              color: Colors.grey,
            ),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.white),
                top: BorderSide(color: Colors.white),
                right: BorderSide(color: Colors.white),
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          CupertinoTextField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            placeholder: "Email",
            prefix: Icon(
              CupertinoIcons.mail_solid,
              color: Colors.grey,
            ),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.white),
                top: BorderSide(color: Colors.white),
                right: BorderSide(color: Colors.white),
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          CupertinoTextField(
            keyboardType: TextInputType.streetAddress,
            placeholder: "Location",
            prefix: Icon(
              CupertinoIcons.location_solid,
              color: Colors.grey,
            ),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.white),
                top: BorderSide(color: Colors.white),
                right: BorderSide(color: Colors.white),
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(CupertinoIcons.time),
              SizedBox(
                width: 5,
              ),
              Text(
                "Delivert Time",
                style: TextStyle(color: Colors.grey, fontSize: 11),
              ),
              Spacer(),
              (h.period.name == "pm")
                  ? (h.hour == 12)
                      ? Text(
                          "${l[k.month - 1]} ${k.day},${k.year} ${h.hour}:${h.minute} ${h.period.name}",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        )
                      : Text(
                          "${l[k.month - 1]} ${k.day},${k.year} ${h.hour - 12}:${h.minute}${h.period.name}",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        )
                  : (h.hour == 0)
                      ? Text(
                          "${l[k.month - 1]} ${k.day},${k.year} ${h.hour + 12}:${h.minute}${h.period.name}",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        )
                      : Text(
                          "${l[k.month - 1]} ${k.day},${k.year} ${h.hour}:${h.minute}${h.period.name}",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            child: CupertinoDatePicker(
              use24hFormat: false,
              mode: CupertinoDatePickerMode.dateAndTime,
              onDateTimeChanged: (value) {
                int h1 = value.hour;
                int m = value.minute;
                setState(() {
                  h = TimeOfDay(hour: h1, minute: m);
                  k = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ...golbes.t.map(
            (e) => Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
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
                      Text(
                        "\$ ${e['p']}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Shipping \$ 21",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Tex \$${golbes.tex.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Total \$${golbes.total + 21 + golbes.tex}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
