import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice/home_page.dart';

// 横向浏览列表

class listview extends StatefulWidget {
  const listview({super.key});

  @override
  State<listview> createState() => _listviewState();
}

class _listviewState extends State<listview> {
  List<Map> imgList = [
    {"url": "https://pic2.zhimg.com/v2-848ed6d4e1c845b128d2ec719a39b275_b.jpg"},
    {
      "url":
          "https://pic2.zhimg.com/80/v2-40c024ce464642fcab3bbf1b0a233174_hd.jpg"
    },
    {
      "url":
          "https://pic4.zhimg.com/80/v2-9cf53967a3825fb27b4199b771cb692b_720w.jpg"
    },
    {
      "url":
          "https://pic3.zhimg.com/80/v2-130838b9c036021e3656b30b01e55ce2_720w.jpg"
    },
    {
      "url":
          "https://pic2.zhimg.com/80/v2-552354a50944d5146fdb42dfc692dd51_720w.jpg"
    },
    {"url": "http://picture.name/images/2019/01/24/21515938.jpg"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('向右或向下滑动浏览列表'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: 200.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imgList.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));

                print(imgList[index]);
              },
              child: Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Image(
                  image: NetworkImage(imgList[index]['url']),
                  fit: BoxFit.fill,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
