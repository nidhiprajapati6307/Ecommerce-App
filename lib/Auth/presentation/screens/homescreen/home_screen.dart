import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/app/utils/card_widget.dart';
import '../../../../core/app/utils/custom_switch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Column(
        children: [
          const Center(
              child: Text("Home Screen"),
    ),
          SimpleSwitch(
            value: isOn,
            onChanged: (v) => setState(() => isOn = v),
            showOnOff: false,
          ),
          CardWidget(),

        ],
      ),
    );
  }
}

