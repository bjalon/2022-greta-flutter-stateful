import 'package:flutter/material.dart';

void main() {
  runApp(const ButtonCounter("Titre"));
}

class ButtonCounter extends StatefulWidget {
  final String title;
  const ButtonCounter(this.title, {Key? key}) : super(key: key);
  @override
  State<ButtonCounter> createState() => _ButtonCounterState();
}

class _ButtonCounterState extends State<ButtonCounter> {
  var counter = 0;
  var username = "";
  var isHelloShown = true;

  void handleClick() {
    setState(() {
      counter++;
    });
  }

  void handleToggleShow() {
    setState(() {
      isHelloShown = !isHelloShown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            TextField(onChanged: handleUsernameChange),
            IconButton(
                icon: const Icon(Icons.plus_one), onPressed: handleClick),
            IconButton(
                icon: const Icon(Icons.access_alarm), onPressed: handleClick),
            Text("$username a clické $counter fois"),
            ElevatedButton(
                onPressed: handleToggleShow,
                child: Text("${isHelloShown ? "Cache" : "Affiche"} Hello")),
            if (isHelloShown) const Text("Hello world")
          ],
        ),
      ),
    );
  }

  void handleUsernameChange(String value) {
    setState(() {
      username = value;
    });
  }
}
