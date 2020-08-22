part of 'pages.dart';

class CheckPage extends StatefulWidget {
  @override
  _CheckPageState createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  bool isChecking = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataLogin().then((value) {
      cekLogin().then((value) {
        setState(() {
          isChecking = false;
        });
      });
    });
  }

  Future<void> cekLogin() async {
    userLoggedIn = await HelperFunctions.getUserLoggedInSharedPreference();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: (isChecking)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : (userLoggedIn == false) ? SignInPage() : MyHomePage(),
    );
  }
}
