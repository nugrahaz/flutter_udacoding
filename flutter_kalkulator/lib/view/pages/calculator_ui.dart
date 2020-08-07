import 'package:flutter/material.dart';
import 'package:flutter_kalkulator/shared/shared.dart';
import 'package:flutter_kalkulator/utils/responsive_layout.dart';
import 'package:flutter_kalkulator/utils/system_manager.dart';
import 'package:flutter_kalkulator/view/widget/widgets.dart';

class CalculatorUI extends StatefulWidget {
  @override
  _CalculatorUIState createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  final double _buttonFontSize = 20;

  int valueA;
  int valueB;
  var sbValue = new StringBuffer();
  String operator;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Center(
          child: Text(
            "Kalkulator",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          //output
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(SizeConfig.blockWidth * 4),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  CustomText(
                    textTitle: sbValue.toString(),
                    maxLine: 1,
                    colorTitle: mainColor.withOpacity(0.8),
                  )
                ],
              ),
            ),
          ),
          //inputan
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                //row pertama
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: RaisedButton(
                          color: white,
                          highlightColor: grey,
                          child: Text(
                            "C",
                            style: TextStyle(color: mainColor, fontSize: _buttonFontSize),
                          ),
                          onPressed: () {
                            clearValue();
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: white,
                          highlightColor: grey,
                          child: Icon(
                            Icons.backspace,
                            color: mainColor,
                          ),
                          onPressed: () {
                            deleteValue();
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: white,
                          highlightColor: grey,
                          child: Text(
                            "/",
                            style: TextStyle(
                              color: accentColor3,
                              fontSize: _buttonFontSize,
                            ),
                          ),
                          onPressed: () {
                            appendValue("/");
                          },
                        ),
                      )
                    ],
                  ),
                ),
                //row kedua
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: white,
                          highlightColor: grey,
                          child: Text(
                            "7",
                            style: TextStyle(
                              color: accentColor3,
                              fontSize: _buttonFontSize,
                            ),
                          ),
                          onPressed: () {
                            appendValue("7");
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: white,
                          highlightColor: grey,
                          child: Text(
                            "8",
                            style: TextStyle(
                              color: accentColor3,
                              fontSize: _buttonFontSize,
                            ),
                          ),
                          onPressed: () {
                            appendValue("8");
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: white,
                          highlightColor: grey,
                          child: Text(
                            "9",
                            style: TextStyle(
                              color: accentColor3,
                              fontSize: _buttonFontSize,
                            ),
                          ),
                          onPressed: () {
                            appendValue("9");
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: white,
                          highlightColor: grey,
                          child: Text(
                            "x",
                            style: TextStyle(
                              color: accentColor3,
                              fontSize: _buttonFontSize,
                            ),
                          ),
                          onPressed: () {
                            appendValue("x");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                //row ketiga
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: white,
                          highlightColor: grey,
                          child: Text(
                            "4",
                            style: TextStyle(
                              color: accentColor3,
                              fontSize: _buttonFontSize,
                            ),
                          ),
                          onPressed: () {
                            appendValue("4");
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: white,
                          highlightColor: grey,
                          child: Text(
                            "5",
                            style: TextStyle(
                              color: accentColor3,
                              fontSize: _buttonFontSize,
                            ),
                          ),
                          onPressed: () {
                            appendValue("5");
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: white,
                          highlightColor: grey,
                          child: Text(
                            "6",
                            style: TextStyle(
                              color: accentColor3,
                              fontSize: _buttonFontSize,
                            ),
                          ),
                          onPressed: () {
                            appendValue("6");
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: white,
                          highlightColor: grey,
                          child: Text(
                            "-",
                            style: TextStyle(
                              color: accentColor3,
                              fontSize: _buttonFontSize,
                            ),
                          ),
                          onPressed: () {
                            appendValue("-");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                //row keempat
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: white,
                          highlightColor: grey,
                          child: Text(
                            "1",
                            style: TextStyle(
                              color: accentColor3,
                              fontSize: _buttonFontSize,
                            ),
                          ),
                          onPressed: () {
                            appendValue("1");
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: white,
                          highlightColor: grey,
                          child: Text(
                            "2",
                            style: TextStyle(
                              color: accentColor3,
                              fontSize: _buttonFontSize,
                            ),
                          ),
                          onPressed: () {
                            appendValue("2");
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: white,
                          highlightColor: grey,
                          child: Text(
                            "3",
                            style: TextStyle(
                              color: accentColor3,
                              fontSize: _buttonFontSize,
                            ),
                          ),
                          onPressed: () {
                            appendValue("3");
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: white,
                          highlightColor: grey,
                          child: Text(
                            "+",
                            style: TextStyle(
                              color: accentColor3,
                              fontSize: _buttonFontSize,
                            ),
                          ),
                          onPressed: () {
                            appendValue("+");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                //row kelima
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: RaisedButton(
                          color: white,
                          highlightColor: grey,
                          child: Text(
                            "0",
                            style: TextStyle(
                              color: accentColor3,
                              fontSize: _buttonFontSize,
                            ),
                          ),
                          onPressed: () {
                            appendValue("0");
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: mainColor,
                          highlightColor: grey,
                          child: Text(
                            "=",
                            style: TextStyle(
                              color: white,
                              fontSize: _buttonFontSize,
                            ),
                          ),
                          onPressed: () {
                            appendValue("=");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    sbValue.write("0");
    operator = "";
    AppSystemManager.systemBarColor(Colors.transparent, Colors.white);
  }

  void appendValue(String str) =>
      setState(() {
        bool isDoCalculate = false;
        String strValue = sbValue.toString();
        String lastCharacter = strValue.substring(strValue.length - 1);

        //mengecek apakah last character masih operator
        if (str == "0" && (lastCharacter == "/" || lastCharacter == "x" ||
                lastCharacter == "-" || lastCharacter == "+")) {
          return;
        } else if (str == "0" && sbValue.toString() == "0") {
          return;
        } else if (str == "=") {
          isDoCalculate = true;
        } else if (str == "/" || str == "x" || str == "-" || str == "+") {
          if (operator.isEmpty) {
            operator = str;
          } else {
            isDoCalculate = true;
          }
        }

        if (!isDoCalculate) {
          if (sbValue.toString() == "0" && str != "0") {
            sbValue.clear();
          }
          sbValue.write(str);
        } else {
          List<String> values = sbValue.toString().split(operator);
          if (values.length == 2 && values[0].isNotEmpty && values[1].isNotEmpty) {
            valueA = int.parse(values[0]);
            valueB = int.parse(values[1]);
            sbValue.clear();
            int total = 0;
            switch (operator) {
              case "/":
                total = valueA ~/ valueB;
                break;
              case "x":
                total = valueA * valueB;
                break;
              case "-":
                total = valueA - valueB;
                break;
              case "+":
                total = valueA + valueB;
            }
            sbValue.write(total);
            if (str == "/" || str == "x" || str == "-" || str == "+") {
              operator = str;
              sbValue.write(str);
            } else {
              operator = "";
            }
          } else {
            String strValue = sbValue.toString();
            String lastCharacter = strValue.substring(strValue.length - 1);
            if (str == "/" || str == "x" || str == "-" || str == "+") {
              operator = "";
              sbValue.clear();
              sbValue.write(strValue.substring(0, strValue.length - 1) + "" + str);
              operator = str;
            } else if (str == "=" &&
                (lastCharacter == "/" ||
                    lastCharacter == "x" ||
                    lastCharacter == "-" ||
                    lastCharacter == "+")) {
              operator = "";
              sbValue.clear();
              sbValue.write(strValue.substring(0, strValue.length - 1));
            }
          }
        }
      });

  void deleteValue() => setState(() {
        String strValue = sbValue.toString();
        if (strValue.length > 0) {
          String lastCharacter = strValue.substring(strValue.length - 1);
          if (lastCharacter == "/" ||
              lastCharacter == "x" ||
              lastCharacter == "-" ||
              lastCharacter == "+") {
            operator = "";
          }
          strValue = strValue.substring(0, strValue.length - 1);
          sbValue.clear();
          sbValue.write(strValue.length == 0 ? "0" : strValue);
        }
      });

  void clearValue() => setState(() {
        operator = "";
        sbValue.clear();
        sbValue.write("0");
      });
}
