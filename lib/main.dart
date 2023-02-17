import 'package:flutter/material.dart';

class SendCode extends StatefulWidget {
  const SendCode({super.key});

  @override
  State<SendCode> createState() => _SendCodeState();
}

class _SendCodeState extends State<SendCode> {
  List<String> fruits = [
    'Osh',
    'Shurva',
    'Shashlik',
    'Somsa',
    'Manti',
    'galobsi'
  ];

  List<Widget> func() {
    List<Widget> sana = [];
    for (int a = 0; a < fruits.length; a++) {
      sana.add(ListTile(
        title: Text(fruits[a]),
        leading: Text('${a+1}'),

        subtitle: Text(
          'Lochin Restaurant',
          style: TextStyle(fontSize: 10.5),
        ),
        trailing: TextButton(
            onPressed: () {
              setState(() {
                fruits.removeAt(a);
              });
            },
            child: Icon(Icons.delete)),
      ));
    }
    return sana;
  }

  TextEditingController controller1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller1,
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  fruits.add(controller1.text);
                  controller1.text = '';
                });
              },
              child: Text('Buy'),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView(
                children: func(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(SendCode());
}
