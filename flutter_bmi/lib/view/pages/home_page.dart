part of 'pages.dart';

class HomePage extends StatefulWidget {
  final List<String> gender = ["Pria", "Wanita"];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectGender = "Pria";
  int height = 170;
  double minHeight = 100;
  double maxHeight = 240;

  int weight = 60;
  int age = 28;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppSystemManager.systemBarColor(Colors.transparent, greys);

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "BMI",
            style: TextStyle(
                fontSize: SizeConfig.blockHeight * 3,
                fontWeight: FontWeight.bold,
                height: 1.4),
          ),
        ),
        backgroundColor: greys,
      ),
      body: WillPopScope(
        onWillPop: () {
          onBackPressed(context);
          return;
        },
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockHeight * 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: SizeConfig.blockHeight * 4,
                      ),
                      Wrap(
                        spacing: SizeConfig.blockHeight * 2,
                        runSpacing: SizeConfig.blockHeight * 2,
                        children: generateGenderWidgets(context),
                      ),
                      SizedBox(
                        height: SizeConfig.blockHeight * 2.5,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: ReusableCard(
                    color: greys,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: TextStyle(
                              color: grey,
                              fontSize: SizeConfig.blockWidth * 4),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: SizeConfig.blockHeight),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    color: white,
                                    fontSize: SizeConfig.blockWidth * 9),
                              ),
                              Text(
                                ' cm',
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    color: white,
                                    fontSize: SizeConfig.blockWidth * 5),
                              ),
                            ],
                          ),
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: minHeight,
                            max: maxHeight,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.blockHeight * 2),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ReusableCard(
                          color: greys,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'WEIGHT',
                                style: TextStyle(
                                    color: grey,
                                    fontSize: SizeConfig.blockWidth * 4),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: SizeConfig.blockHeight),
                                child: Text(
                                  weight.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      color: white,
                                      fontSize: SizeConfig.blockWidth * 9),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                    icon: Icons.remove,
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 10.0),
                                  RoundIconButton(
                                    icon: Icons.add,
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockWidth * 4,
                      ),
                      Expanded(
                        child: ReusableCard(
                          color: greys,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'AGE',
                                style: TextStyle(
                                    color: grey,
                                    fontSize: SizeConfig.blockWidth * 4),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: SizeConfig.blockHeight),
                                child: Text(
                                  age.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      color: white,
                                      fontSize: SizeConfig.blockWidth * 9),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                    icon: Icons.remove,
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 10.0),
                                  RoundIconButton(
                                    icon: Icons.add,
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockHeight * 1,
                ),
                CustomButton(
                  title: "Kalkulasi",
                    titleColor: white,
                    color: greys,
                    heightWidget: SizeConfig.blockHeight * 12,
                    fontSize: SizeConfig.blockWidth * 7,
                    function: (){
                      CalculatorBrain calc =
                      CalculatorBrain(height: height, weight: weight);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(
                                bmiResult: calc.calculateBMI(),
                                resultText: calc.getResult(),
                                interpretation: calc.getInterpretation(),
                              )));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> generateGenderWidgets(BuildContext context) {
    double width = (MediaQuery.of(context).size.width -
            2 * SizeConfig.blockHeight * 3 -
            SizeConfig.blockHeight * 3) /
        2;

    double height = (MediaQuery.of(context).size.width -
            2 * SizeConfig.blockHeight * 3 -
            SizeConfig.blockHeight * 3) /
        5.5;

    return widget.gender
        .map((e) => SelectableBox(
              e,
              width: width,
              height: height,
              isSelected: selectGender == e,
              onTap: () {
                setState(() {
                  selectGender = e;
                });
                print(selectGender);
              },
            ))
        .toList();
  }
}
