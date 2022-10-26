import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice/screens/ListView.dart';

class BottomSheetPage extends StatefulWidget {
  const BottomSheetPage({super.key});

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("底部伸出弹窗"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(
              text: "Simple Sheet",
              onClicked: () => showModalBottomSheet(
                context: context,
                builder: (context) => buildSheet(),
                // 拖动关闭弹窗
                enableDrag: true,
                //点击空白处关闭弹窗
                isDismissible: true,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton({
    required String text,
    required VoidCallback onClicked,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      ),
      onPressed: onClicked,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }

  Widget makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  Widget buildSheet() => makeDismissible(
        child: DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.5,
            maxChildSize: 1,
            builder: (context, scrollController) => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  padding: EdgeInsets.all(16),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Text(
                        "Spending some hours in pain, I found my solution and post it here We should not import appcenter, appcenter_analytics appcenter_crashespackage in main.dart (also not import them into pubspec.yaml) What we should do is, override method in MainActivity.java and implement appcenter there. You can find more details in my answer.",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Spending some hours in pain, I found my solution and post it here We should not import appcenter, appcenter_analytics appcenter_crashespackage in main.dart (also not import them into pubspec.yaml) What we should do is, override method in MainActivity.java and implement appcenter there. You can find more details in my answer.",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Spending some hours in pain, I found my solution and post it here We should not import appcenter, appcenter_analytics appcenter_crashespackage in main.dart (also not import them into pubspec.yaml) What we should do is, override method in MainActivity.java and implement appcenter there. You can find more details in my answer.",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Spending some hours in pain, I found my solution and post it here We should not import appcenter, appcenter_analytics appcenter_crashespackage in main.dart (also not import them into pubspec.yaml) What we should do is, override method in MainActivity.java and implement appcenter there. You can find more details in my answer.",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Spending some hours in pain, I found my solution and post it here We should not import appcenter, appcenter_analytics appcenter_crashespackage in main.dart (also not import them into pubspec.yaml) What we should do is, override method in MainActivity.java and implement appcenter there. You can find more details in my answer.",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      )
                    ],
                  ),
                )),
      );
}
