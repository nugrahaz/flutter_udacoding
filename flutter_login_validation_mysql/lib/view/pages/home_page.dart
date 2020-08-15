part of 'pages.dart';

class HomePage extends StatefulWidget {
  final String userName;
  final String pass;

  const HomePage({
    @required this.userName,
    @required this.pass,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    AppSystemManager.systemBarColor(Colors.transparent, mainColor);
  }

  @override
  Widget build(BuildContext context) {
    AppSystemManager.systemBarColor(Colors.transparent, mainColor);
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () {
          onBackPressed(context);
          return;
        },
        child: Stack(
          children: [
            Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background/background_1.png'),
                    fit: BoxFit.fill),
              ),
            ),
            Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Username: " + widget.userName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(
                      height: SizeConfig.blockHeight * 3,
                    ),
                    Text(
                      "Password: " + widget.pass,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(
                      height: SizeConfig.blockHeight * 10,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 25),
                      child: CustomButton(
                        function: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInPage(),
                            ),
                          );
                        },
                        color: Colors.white,
                        title: "Sign Out",
                        titleColor: mainColor,
                        borderColor: mainColor,
                        splashColor: mainColor.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
