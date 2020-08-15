part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  bool inProgress = false;
  bool isEmailValid = false;

  @override
  void initState() {
    super.initState();
    AppSystemManager.systemBarColor(Colors.transparent, Colors.white);
  }

//  Future<void> checkPermission() async {
//    var status = await Permission.phone.status;
//    if (status.isGranted) {
//
//    } else {
//      Fluttertoast.showToast(msg: "Berikan Permission", toastLength: Toast.LENGTH_LONG);
//    openAppSettings();
//    }
//  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
      onWillPop: () {
        onBackPressed(context);
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: SizeConfig.screenHeight,
            child: Stack(
              children: <Widget>[
                //appBar
                Container(
                  height: SizeConfig.screenHeight * 0.225,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background/appBar.png'),
                        fit: BoxFit.fill),
                    boxShadow: [
                      BoxShadow(
                        color: mainColor,
                        blurRadius: 10.0,
                        // has the effect of softening the shadow
                        spreadRadius: 1.0,
                        // has the effect of extending the shadow
                        offset: Offset(
                          0,
                          // horizontal, move right 0
                          1.0, // vertical, move down 2
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          SizeConfig.screenWidth + SizeConfig.screenHeight * 0.1,
                          SizeConfig.screenHeight * 0.15),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Container(),
                      ),
                      Flexible(
                        flex: 5,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.275),
                          child: Center(
                            child: CustomText(
                              maxLine: 1,
                              textTitle: "Login Page",
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(),
                      )
                    ],
                  ),
                ),
                //konten
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockHeight * 3),
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: SizeConfig.blockHeight * 4,
                        ),
                        TextFormField(
                          focusNode: emailFocus,
                          onFieldSubmitted: (term) {
                            _fieldFocusChange(context, emailFocus, passwordFocus);
                          },
                          onChanged: (text) {
                            setState(() {
                              isEmailValid = EmailValidator.validate(text.trim());
                            });
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Email Address",
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockHeight * 2.75,
                        ),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          focusNode: passwordFocus,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Password",
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockHeight * 3.5,
                        ),
                        //btn custom
                        inProgress
                            ? SpinKitThreeBounce(
                                size: SizeConfig.blockHeight * 4,
                                color: mainColor,
                              )
                            : CustomButton(
                                function: () async {
                                  setState(() {
                                    inProgress = true;
                                  });

                                  if (emailController.text == "" ||
                                      passwordController.text == "") {
                                    Flushbar(
                                      duration: Duration(milliseconds: 2500),
                                      flushbarPosition: FlushbarPosition.BOTTOM,
                                      icon: Icon(
                                        Icons.info_outline,
                                        size: SizeConfig.blockHeight * 2.5,
                                        color: Colors.white,
                                      ),
                                      backgroundColor: mainColor,
                                      message:
                                          "Mohon untuk mengisi seluruh field yang ada",
                                    )..show(context);

                                    setState(() {
                                      inProgress = false;
                                    });
                                  } else {
                                    if (isEmailValid) {
                                      userSignIn(emailController.text.trim(),
                                              passwordController.text)
                                          .then((value) {
                                        setState(() {
                                          inProgress = false;
                                        });
                                      });
                                    } else {
                                      Flushbar(
                                        duration: Duration(milliseconds: 2500),
                                        flushbarPosition: FlushbarPosition.BOTTOM,
                                        icon: Icon(
                                          Icons.info_outline,
                                          size: SizeConfig.blockHeight * 2.5,
                                          color: Colors.white,
                                        ),
                                        backgroundColor: mainColor,
                                        message: "Email yang Anda masukkan tidak valid",
                                      )..show(context);

                                      setState(() {
                                        inProgress = false;
                                      });
                                    }
                                  }
                                },
                                title: "Login",
                                color: mainColor,
                                borderColor: mainColor,
                                titleColor: Colors.white,
                                splashColor: Colors.white.withOpacity(0.2),
                              ),
                        SizedBox(
                          height: SizeConfig.blockHeight * 1,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockHeight * 2),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Divider(
                                  height: 3,
                                  color: greySemi,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                                  child: Center(
                                      child: CustomText(
                                    maxLine: 1,
                                    textTitle: "atau masuk dengan",
                                    colorTitle: greySemi,
                                    fontWeightTitle: FontWeight.w400,
                                  )),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Divider(
                                  height: 3,
                                  color: greySemi,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockHeight * 1,
                        ),
                        CustomButton(
                          function: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => SignUpPage()));
                          },
                          color: Colors.white,
                          title: "Akun Media Sosial",
                          titleColor: mainColor,
                          borderColor: mainColor,
                          splashColor: mainColor.withOpacity(0.3),
                        ),
                        SizedBox(
                          height: SizeConfig.blockHeight * 2.5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  userSignIn(var email, var password) async {
    setState(() {
      inProgress = true;
    });

    var url = "https://nugrahaz-7230.000webhostapp.com/login_flutter/signin.php";
    var data = {
      "email": email,
      "pass": password,
    };

    var res = await http.post(url, body: data);

    if (res.statusCode == 200) {
      if (jsonDecode(res.body.toString()) == "dont have account") {
        Fluttertoast.showToast(
            msg: "Email tidak terdaftar di database!",
            backgroundColor: Colors.blueGrey,
            toastLength: Toast.LENGTH_SHORT);
      } else {
        if (jsonDecode(res.body.toString()) == "false") {
          Fluttertoast.showToast(
              msg: "Password yang Anda masukkan salah",
              backgroundColor: Colors.blueGrey,
              toastLength: Toast.LENGTH_SHORT);
        } else {
          print(jsonDecode(res.body.toString()));
          //maaf saya kesulitan dalam memparse json, jadi manual dulu
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                        userName: emailController.text.trim(),
                        pass: passwordController.text,
                      )));
        }
      }

      setState(() {
        inProgress = false;
      });
    } else {
      Fluttertoast.showToast(
          msg: "Maaf, response " + res.statusCode.toString(),
          backgroundColor: Colors.blueGrey,
          toastLength: Toast.LENGTH_LONG);
    }
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
