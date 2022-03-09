import 'package:flutter/material.dart';

class Cost extends StatelessWidget {
  Cost({required this.watt});
  double watt;

  double sum=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[600],
        title: const Text(
          'Electricity Bill',
          style: TextStyle(
            fontFamily: 'IndieFlower',
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
          children: <Widget>[
            Center(
              child: calculate(),
            ),
            ElevatedButton(
              onPressed: () {Navigator.pop(context);},
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo[600],
              ),
              child: const Text(
                'Again!',
                style: TextStyle(fontSize: 20, fontFamily: 'IndieFlower', fontWeight: FontWeight.bold),
              ),
        ),
      ]),
    );
  }

  calculate() {
    if(watt>400) {
      sum=sum+(watt-400)*4.4217;
      watt=400;
    }
    if(watt>150) {
      sum=sum+(watt-150)*4.2218;
      watt=150;
    }
    if(watt>100) {
      sum=sum+(watt-100)*3.7171;
      watt=100;
    }
    if(watt>35) {
      sum=sum+(watt-35)*3.6237;
      watt=35;
    }
    if(watt>25) {
      sum=sum+(watt-25)*3.2405;
      watt=25;
    }
    if(watt>15) {
      sum=sum+(watt-15)*2.9882;
      watt=15;
    }
    if(watt>0) {
      sum=sum+watt*2.3488;
      watt=0;
      sum=sum+8.19;
    }
    sum=double.parse(sum.toStringAsFixed(2));
    return Text('$sum bath',style: TextStyle(fontSize: 36, fontFamily: 'IndieFlower'));
  }
}