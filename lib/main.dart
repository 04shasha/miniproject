import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cost.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Electricity Bill Calculator !!',
      home: FirstScreen(),
    ),
  );
}

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final myController = TextEditingController();
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[600],
        title: Text(
          'Welcome!',
          style: TextStyle(
            fontFamily: 'IndieFlower',
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.all(80.0),
              child: Image.asset('images/light-148483_1280.png'),
            ),
          ),
          Row(
            children: [
              Icon(Icons.input),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(labelText: "Enter number of watts",
                        labelStyle: TextStyle(fontSize: 18, fontFamily: 'IndieFlower'),),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly],
                      textAlign: TextAlign.center,
                      controller: myController,
                    ),
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Cost(watt: double.parse(myController.value.text))));
            },
            child: Expanded(
              child: Container(
                child: Text(
                  'NEXT',
                  style: TextStyle(
                    fontFamily: 'IndieFlower',
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                color: Colors.indigo[600],
                height: 50.0,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}