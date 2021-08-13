import 'package:bmi/constants/app_constants.dart';
import 'package:bmi/widgets/left_bar.dart';
import 'package:bmi/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Calculadora de IMC ",
            style:
                TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainHexColor,
        body: Card(
          color: Color.fromRGBO(54, 54, 54, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      color: accentHexColor,
                      child: Container(
                        width: 130,
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: _heightController,
                            style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Altura",
                              hintStyle: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white.withOpacity(.6)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      color: accentHexColor,
                      child: Container(
                        width: 130,
                        child: TextField(
                          controller: _weightController,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Peso",
                            hintStyle: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w300,
                                color: Colors.white.withOpacity(.6)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    double _h = double.parse(_heightController.text);
                    double _w = double.parse(_weightController.text);
                    setState(() {
                      _bmiResult = _w / (_h * _h);
                      if (_bmiResult > 25) {
                        _textResult = "Você está acima do peso!";
                      } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                        _textResult = "Você está com seu peso normal";
                      } else {
                        _textResult = "Você está abaixo do peso!";
                      }
                    });
                  },
                  child: Container(
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: accentHexColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Text(
                    _bmiResult.toStringAsFixed(2),
                    style: TextStyle(fontSize: 90, color: accentHexColor),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Visibility(
                    visible: _textResult.isNotEmpty,
                    child: Container(
                      child: Text(
                        _textResult,
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: accentHexColor),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                LeftBar(
                  barWidth: 40,
                ),
                SizedBox(
                  height: 20,
                ),
                LeftBar(barWidth: 70),
                SizedBox(
                  height: 20,
                ),
                LeftBar(
                  barWidth: 40,
                ),
                SizedBox(
                  height: 20,
                ),
                RightBar(barWidth: 70),
                SizedBox(
                  height: 50,
                ),
                RightBar(barWidth: 70),
              ],
            ),
          ),
        ));
  }
}
