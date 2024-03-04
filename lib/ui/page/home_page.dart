import 'package:flutter/material.dart';

import '../widget/w1.dart';
import '../widget/w2.dart';
import '../widget/w3.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isGray = false;
  double x = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () => reset(),
                  icon: const Icon(Icons.refresh),
                  key: const Key('Refresh')),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                W1(
                  callBack: addDecimal,
                  callBack2: restDecimal,
                  x: x.toStringAsFixed(1),
                ),
                W2(
                  callBack: changeColor,
                ),
                W3(
                  callBack: addUnit,
                  callBack2: restUnit,
                  x: x.toStringAsFixed(1),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }

  void addDecimal() {
    setState(() {
      x += 0.1;
    });
  }

  Color changeColor() {
    return x < 0.4 ? Colors.grey : Colors.blueGrey;
  }

  void restDecimal() {
    setState(() {
      x -= 0.1;
    });
  }

  void addUnit() {
    setState(() {
      x += 1;
    });
  }

  void restUnit() {
    setState(() {
      x -= 1;
    });
  }

  void reset() {
    setState(() {
      x = 0;
    });
  }
}
