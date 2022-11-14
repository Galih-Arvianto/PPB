import 'package:flutter/material.dart';
import 'package:tugas/components/custom_card.dart';
import 'package:tugas/constants.dart';
import 'package:tugas/components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({required this.result, required this.ohm, required this.volt, required this.amp, required this.watt});

  final String result;
  final double ohm;
   final double volt;
    final double amp;
     final double watt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ohms Law Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomCard(
                  color: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 22, left: 22),
                        child: Text(
                          "Resistor / Ohm",
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 22, left: 22),
                        child: Text(
                          ohm.toString(),
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 22, left: 22),
                        child: Text(
                          "",
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CustomCard(
                  color: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 22, left: 22),
                        child: Text(
                          "Tegangan / Volt",
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 22, left: 22),
                        child: Text(
                          volt.toString(),
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 22, left: 22),
                        child: Text(
                          "",
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomCard(
                  color: activeCardColor,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 22, left: 22),
                        child: Text(
                          "Ampere / I \n",
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 22, left: 22),
                        child: Text(
                          amp.toString(),
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 22, left: 22),
                        child: Text(
                          "",
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ),
                  
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CustomCard(
                  color: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 22, left: 22),
                        child: Text(
                          "Daya / Watt\n",
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 22, left: 22),
                        child: Text(
                          watt.toString(),
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 22, left: 22),
                        child: Text(
                          "",
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
            Row(
            children: [
              
              Expanded(
                child: CustomCard(
                  color: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    ],
                  ),
                ),
              ),
            ],
          ),
          BottomButton(
            
            buttonTitle: 'Re-Calculate',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
