import 'package:flutter/material.dart';

class SwitchBtn extends StatefulWidget {
  const SwitchBtn({super.key});

  @override
  State<SwitchBtn> createState() => _SwitchBtnState();
}

class _SwitchBtnState extends State<SwitchBtn> {
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('开关按钮'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              activeColor: Colors.green,
              value: isOn,
              onChanged: (_isOn) {
                setState(() {
                  isOn = _isOn;
                });
              },
            ),
            Text("value: $isOn"),
          ],
        ),
      ),
    );
  }
}
