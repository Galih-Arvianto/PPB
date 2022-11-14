import 'package:tugas/exception_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tugas/components/custom_card.dart';
import 'package:tugas/components/icon_card.dart';
import 'package:tugas/constants.dart';
import 'result_page.dart';
import 'package:tugas/components/bottom_button.dart';
import 'package:tugas/components/round_icon_button.dart';
import 'package:tugas/calculator.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

//TEXT CONTROLLER SECTION
TextEditingController ohm = new TextEditingController(text: '0');
TextEditingController volt = new TextEditingController(text: '0');
TextEditingController amp = new TextEditingController(text: '0');
TextEditingController watt = new TextEditingController(text: '0');

//TEXT CONTROLLER SECTION END

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 160;
  int weight = 60;
  // int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ohms Law Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 22),
                        child: TextField(
                          controller: ohm,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      )
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 22),
                        child: TextField(
                          controller: volt,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      )
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
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 22, left: 22),
                        child: Text(
                          "Ampere / I",
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 22),
                        child: TextField(
                          controller: amp,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      )
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
                          "Daya / Watt",
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 22),
                        child: TextField(
                          controller: watt,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Expanded(
          //   child: CustomCard(
          //     color: activeCardColor,
          //     cardChild: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //     ),
          //   ),
          // ),
          // Expanded(
          //   child: CustomCard(
          //     color: activeCardColor,
          //     cardChild: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //     ),
          //   ),
          // ),
          // Expanded(
          //   child: CustomCard(
          //     color: activeCardColor,
          //     cardChild: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //     ),
          //   ),
          // ),
          // Expanded(
          //   child: CustomCard(
          //     color: activeCardColor,
          //     cardChild: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //     ),
          //   ),
          // ),
          BottomButton(
            buttonTitle: 'Calculate',
            onTap: () {
              Calculator cal = Calculator(
                  volt: volt.text,
                  amp: amp.text,
                  watt: watt.text,
                  ohm: ohm.text);

              cal.startcalculate();
              if (cal.iswrong == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SomethingWrong(
                      result: cal.info,
                    )));
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      result: cal.infoshow(),
                      ohm: cal.ohmResult(),
                      amp: cal.ampResult(),
                      volt: cal.voltResult(),
                      watt: cal.wattResult(),
                    ),
                  ),
                );
              }

              // String bmi = cal.calculateBMI();
              // String result = cal.getResult();
              //String information = cal.getInterpretation();
            },
          ),
        ],
      ),
    );
  }
}
