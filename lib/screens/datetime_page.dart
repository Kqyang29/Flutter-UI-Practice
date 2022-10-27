import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';

class DateTimePage extends StatefulWidget {
  const DateTimePage({super.key});

  @override
  State<DateTimePage> createState() => _DateTimePageState();
}

class _DateTimePageState extends State<DateTimePage> {
  DateTime _dateTime = DateTime.now();
  String? date1 = formatDate(
    DateTime.now(),
    [
      mm,
      '月',
      dd,
      "日",
    ],
  );
  String? date2 = formatDate(
    DateTime.now(),
    [
      mm,
      '月',
      dd,
      "日",
    ],
  );
  String? day1 = DateFormat("EEE", 'zh_CN').format(DateTime.now());
  String? time1 = DateFormat("h:m").format(DateTime.now());

  String? day2 = DateFormat("EEE", 'zh_CN').format(DateTime.now());
  String? time2 = DateFormat("h:m").format(DateTime.now());

  int? Tdate;
  int? Rdate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("日期时间选择器"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonWidget1(
                onClicked: () => {
                  showSheet(
                    context,
                    child: buildDatePicker(),
                    onClicked: () async {
                      Intl.systemLocale = await findSystemLocale();
                      setState(() {
                        day1 = DateFormat("EEE", 'zh_CN').format(_dateTime);
                        time1 = DateFormat("h:m").format(_dateTime);
                        date1 = formatDate(
                          _dateTime,
                          [
                            mm,
                            '月',
                            dd,
                            "日",
                          ],
                        );
                        Tdate = int.parse(DateFormat("dd").format(_dateTime));
                      });
                      print(Tdate);
                      // showSnackBar(context, "select: $value2 $value");
                      Navigator.pop(context);
                    },
                  ),
                },
              ),
              ButtonWidget2(
                onClicked: () => {
                  showSheet(
                    context,
                    child: buildDatePicker(),
                    onClicked: () async {
                      Intl.systemLocale = await findSystemLocale();

                      setState(() {
                        day2 = DateFormat("EEE", 'zh-CN').format(_dateTime);
                        time2 = DateFormat("h:m").format(_dateTime);
                        date2 = formatDate(
                          _dateTime,
                          [
                            mm,
                            '月',
                            dd,
                            "日",
                          ],
                        );
                        Rdate = int.parse(DateFormat("dd").format(_dateTime));

                        // print(day2);
                      });
                      // showSnackBar(context, "select: $value2 $value");
                      Navigator.pop(context);
                    },
                  ),
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          minimumYear: 2015,
          maximumYear: DateTime.now().year,
          initialDateTime: _dateTime,
          onDateTimeChanged: (dateTime) => {
            setState(() => this._dateTime = dateTime),
          },
        ),
      );

  Widget IconWord() => Column(
        children: [],
      );

  Widget ButtonWidget1({
    required VoidCallback onClicked,
  }) =>
      SizedBox(
        width: 100,
        height: 100,
        child: TextButton(
          onPressed: onClicked,
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "$date1",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "$day1",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "$time1",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget ButtonWidget2({
    required VoidCallback onClicked,
  }) =>
      SizedBox(
        width: 100,
        height: 100,
        child: TextButton(
          onPressed: onClicked,
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$date2",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "$day2",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "$time2",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  static void showSheet(
    BuildContext context, {
    required Widget child,
    required VoidCallback onClicked,
  }) =>
      showCupertinoModalPopup(
        context: context,
        builder: ((context) => CupertinoActionSheet(
              actions: [
                child,
              ],
              cancelButton: CupertinoActionSheetAction(
                child: Text('done'),
                onPressed: onClicked,
              ),
            )),
      );

  static void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: TextStyle(fontSize: 24),
      ),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
