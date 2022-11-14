import 'dart:math';
import 'constants.dart';

class Calculator {
  Calculator(
      {required this.ohm,
      required this.volt,
      required this.amp,
      required this.watt});
  String info = '';
  int ohmvalue = 0;
  int voltvalue = 0;
  int ampvalue = 0;
  int wattvalue = 0;

  double ohmresult = 0;
  double ampresult = 0;
  double wattresult = 0;
  double voltresult = 0;
  final String ohm;
  final String volt;
  final String amp;
  final String watt;
  int iswrong =0;

  void startcalculate() {
    int a = 0;
    int b = 0;
    int c = 0;
    int d = 0;
 try{
  ohmvalue = int.parse(ohm);
    ampvalue = int.parse(amp);
    wattvalue = int.parse(watt);
    voltvalue = int.parse(volt);
 }catch(e){
  iswrong=1;
  info='Input yang dimasukkan tidak valid, mohon hanya masukkan NOMOR';
 }
    

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
      iswrong=1;
      info='Mohon hanya masukkan 2 INPUT dan biarkan 2 input lainnya bernilai 0 ';
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
          voltresult = ampvalue * ohmvalue.toDouble();
          wattresult = ampvalue * ampvalue.toDouble()*ohmvalue;
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





  }

  String infoshow() {
    return info;
  }

  double ohmResult() {
    return ohmresult;
  }

  double ampResult() {
    return ampresult;
  }

  double wattResult() {
    return wattresult;
  }

  double voltResult() {
    return voltresult;
  }

  //double _bmi = 0.0;

//   String calculateBMI() {
//     _bmi = weight / pow(height / 100, 2);
//     return _bmi.toStringAsFixed(1);
//   }

//   String getResult() {
//     if (_bmi >= 25) {
//       return 'Overweight';
//     } else if (_bmi >= 18.5) {
//       return 'Normal';
//     } else {
//       return 'Underweight';
//     }
//   }

//   String getInterpretation() {
//     if (_bmi >= 25) {
//       return 'You have a higher than normal body weight. Try to exercise more.';
//     } else if (_bmi >= 18.5) {
//       return 'You have a normal body weight. Good job!';
//     } else {
//       return 'You have a lower than normal body weight. You can eat a bit more.';
//     }
//   }
// }
}
