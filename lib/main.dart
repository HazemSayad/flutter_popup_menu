import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var wordToDisplay = "Nothing Was Tapped";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          PopupMenuButton(
            onSelected: (value) async {
              var result = await _showDialog(context, value.toString());
              setState(() {
                wordToDisplay =
                    "$value was selected and the result was: $result";
              });
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem(value: "Item 1", child: Text("Item 1")),
                PopupMenuItem(value: "Item 2", child: Text("Item 2"))
              ];
            },
          )
        ],
      ),
      body: Center(
        child: Text(wordToDisplay),
      ),
    );
  }
}

Future<bool> _showDialog(BuildContext context, String val) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Alert!"),
        content: Text("You clicked on $val"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text("Accept"),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
