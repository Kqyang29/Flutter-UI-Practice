import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:practice/home_page.dart';

// 轮播图

class SwiperPicture extends StatefulWidget {
  const SwiperPicture({super.key});

  @override
  State<SwiperPicture> createState() => _SwiperPictureState();
}

class _SwiperPictureState extends State<SwiperPicture> {
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
        title: Text("轮播图"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width,
        child: Swiper(
          itemCount: imgList.length,
          //轮播小点
          pagination: SwiperPagination(),
          //两边控制器
          control: SwiperControl(),
          onTap: (index) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          },
          itemBuilder: ((context, index) {
            return Container(
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Container(
                  child: Image(
                    image: NetworkImage(imgList[index]['url']),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
