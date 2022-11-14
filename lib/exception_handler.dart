import 'package:flutter/material.dart';
import 'package:tugas/components/custom_card.dart';
import 'package:tugas/constants.dart';
import 'package:tugas/components/bottom_button.dart';

class SomethingWrong extends StatelessWidget {
  const SomethingWrong({required this.result});
final String result;
  
 

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
                            const EdgeInsets.only(top: 30, right: 32, left: 32),
                        child: Text(
                          result,
                          textAlign: TextAlign.justify,
                          
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30, right: 28, left: 28),
                        child: Text(
                          'Klik kembali atau Re-Calculate untuk mencoba kembali \n',textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      
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
