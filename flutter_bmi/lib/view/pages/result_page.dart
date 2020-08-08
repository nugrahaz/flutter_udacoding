part of 'pages.dart';

class ResultPage extends StatefulWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppSystemManager.systemBarColor(Colors.transparent, greys);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greys,
      appBar: AppBar(
        backgroundColor: greys,
        title: Text('BMI Result', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: WillPopScope(
        onWillPop: (){
          Navigator.pop(context);
          return;
        },
        child: Container(
          color: greys,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: ReusableCard(
                  color: greys,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.resultText,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.greenAccent, fontSize: SizeConfig.blockWidth * 5),
                      ),
                      Text(
                        widget.bmiResult,
                        style: TextStyle(
                          fontSize: SizeConfig.blockHeight * 15,
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 4),
                        child: Text(
                          widget.interpretation,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: SizeConfig.blockWidth * 5,
                            color: white,
                            fontWeight: FontWeight.w400,
                          ),                  ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
