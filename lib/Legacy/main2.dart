import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      int a = 0;
      int b = 0;
      int c = 0;
      int d = 0;

      ohmvalue = int.parse(ohm.text);
      ampvalue = int.parse(amp.text);
      wattvalue = int.parse(watt.text);
      voltvalue = int.parse(volt.text);
      hasil = ohmvalue + ampvalue + wattvalue + voltvalue;
      if (ohmvalue > 0) {
        a = 1;
      }
      if (voltvalue > 0) {
        b = 1;
      }
      if (ampvalue > 0) {
        c = 1;
      }
      if (wattvalue > 0) {
        d = 1;
      }
      if (a + b + c + d == 2) {
        info = 'CONTINUE';
      }

      if ((a + b + c + d > 2) || (a + b + c + d < 2)) {
        info = 'STOP';
        ampresult = 0;
        wattresult = 0;
        voltresult = 0;
        ohmresult = 0;
      }
      //OHM VALUE
      if (a == 1) {
        //OHM + VOLTVALUE
        if (b == 1) {
          ampresult = voltvalue.toDouble() / ohmvalue.toDouble();
          wattresult =
              voltvalue.toDouble() * voltvalue.toDouble() / ohmvalue.toDouble();
          voltresult = voltvalue.toDouble();
          ohmresult = ohmvalue.toDouble();
        }
        //OHM + AMPVALUE
        if (c == 1) {
          voltresult = ampvalue.toDouble() * ohmvalue.toDouble();
          wattresult = voltresult.toDouble() * ampvalue.toDouble();
          ampresult = ampvalue.toDouble();
          ohmresult = ohmvalue.toDouble();
        }
        //OHM + WATT
        if (d == 1) {
          voltresult = sqrt(wattvalue * ohmvalue);
          ampresult = sqrt(wattvalue / ohmvalue.toDouble());
          ohmresult = ohmvalue.toDouble();
          wattresult = wattvalue.toDouble();
        }
      }
      //VOLT VALUE
      if (b == 1) {
        //VOLT + AMP
        if (c == 1) {
          ohmresult = voltvalue.toDouble() / ampvalue.toDouble();
          wattresult = voltvalue.toDouble() * ampvalue.toDouble();
          ampresult = ampvalue.toDouble();
          voltresult = voltvalue.toDouble();
        }
        //VOLT + WATT
        if (d == 1) {
          ohmresult = voltvalue * voltvalue / wattvalue;
          ampresult = wattvalue / voltvalue;
          voltresult = voltvalue.toDouble();
          wattresult = wattvalue.toDouble();
        }
      } //AMP + WATT
      if (c == 1) {
        if (d == 1) {
          voltresult = wattvalue / ampvalue;
          ohmresult = wattvalue / (ampvalue * ampvalue);
          wattresult = wattvalue.toDouble();
          ampresult = ampvalue.toDouble();
        }
      }
    });
  }

//TEXT CONTROLLER SECTION
  TextEditingController ohm = new TextEditingController();
  TextEditingController volt = new TextEditingController();
  TextEditingController amp = new TextEditingController();
  TextEditingController watt = new TextEditingController();
  String info = '';
  int ohmvalue = 0;
  int voltvalue = 0;
  int ampvalue = 0;
  int wattvalue = 0;
  int hasil = 0;
  double ohmresult = 0;
  double ampresult = 0;
  double wattresult = 0;
  double voltresult = 0;
//TEXT CONTROLLER SECTION END

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Ohm'),
            TextField(controller: ohm),
            Text('Volt'),
            TextField(controller: volt),
            Text('I'),
            TextField(controller: amp),
            Text('Watt'),
            TextField(controller: watt),
            const Text(
              'RESULT',
            ),
            Text(
              info,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text('Ohm Result'),
            Text(ohmresult.toString()),
            Text('Volt Result'),
            Text(voltresult.toString()),
            Text('I Result'),
            Text(ampresult.toString()),
            Text('Watt Result'),
            Text(wattresult.toString()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
