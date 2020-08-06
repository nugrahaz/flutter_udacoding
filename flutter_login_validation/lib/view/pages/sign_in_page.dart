part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode usernameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  bool isPasswordValid = false;
  bool isSigningIn = false;

  @override
  void initState() {
    super.initState();
    AppSystemManager.systemBarColor(Colors.transparent, Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: WillPopScope(
            onWillPop: () {
              onBackPressed(context);
              return;
            },
          child: SingleChildScrollView(
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
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.275),
                      child: Center(
                        child: CustomText(
                          maxLine: 1,
                          textTitle: "Login Page",
                        ),
                      ),
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
                            focusNode: usernameFocus,
                            onFieldSubmitted: (term) {
                              _fieldFocusChange(context, usernameFocus, passwordFocus);
                            },
                            controller: usernameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: "Username",
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockHeight * 2.75,
                          ),
                          TextField(
                            onChanged: (text) {
                              setState(() {
                                isPasswordValid = text.length >= 4;
                              });
                            },
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
                          isSigningIn
                              ? SpinKitFadingCircle(
                                  size: SizeConfig.blockWidth * 8,
                                  color: mainColor,
                                )
                              : CustomButton(
                                  function: () async {
                                    setState(() {
                                      isSigningIn = true;
                                    });

                                    if (usernameController.text == "" ||
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
                                        isSigningIn = false;
                                      });
                                    } else {
                                        if (isPasswordValid) {
                                          //lakukan sesuatu jika benar (masih kosong)
                                          if (usernameController.text != username &&
                                              passwordController.text != password) {
                                            Flushbar(
                                              duration: Duration(milliseconds: 2500),
                                              flushbarPosition: FlushbarPosition.BOTTOM,
                                              icon: Icon(
                                                Icons.info_outline,
                                                size: SizeConfig.blockHeight * 2.5,
                                                color: Colors.white,
                                              ),
                                              backgroundColor: mainColor,
                                              message: "Username dan password Anda salah",
                                            )..show(context);
                                          } else if (usernameController.text == username &&
                                              passwordController.text != password) {
                                            Flushbar(
                                              duration: Duration(milliseconds: 2500),
                                              flushbarPosition: FlushbarPosition.BOTTOM,
                                              icon: Icon(
                                                Icons.info_outline,
                                                size: SizeConfig.blockHeight * 2.5,
                                                color: Colors.white,
                                              ),
                                              backgroundColor: mainColor,
                                              message: "Password Anda salah",
                                            )..show(context);
                                          } else if (usernameController.text != username &&
                                              passwordController.text == password) {
                                            Flushbar(
                                              duration: Duration(milliseconds: 2500),
                                              flushbarPosition: FlushbarPosition.BOTTOM,
                                              icon: Icon(
                                                Icons.info_outline,
                                                size: SizeConfig.blockHeight * 2.5,
                                                color: Colors.white,
                                              ),
                                              backgroundColor: mainColor,
                                              message: "Username Anda salah",
                                            )..show(context);
                                          } else {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => HomePage(
                                                    userName: usernameController.text,
                                                    pass: passwordController.text),
                                              ),
                                            );
                                          }

                                          setState(() {
                                            isSigningIn = false;
                                          });

                                        } else {
                                          setState(() {
                                            isSigningIn = false;
                                          });

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
                                                "Password yang Anda masukkan kurang dari 4 karakter",
                                          )..show(context);
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
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: SizeConfig.blockWidth * 1,
                                        vertical: SizeConfig.blockHeight * 1),
                                    child: Center(
                                        child: Text(
                                      "atau",
                                      style: TextStyle(
                                        color: greySemi,
                                        fontWeight: FontWeight.w400,
                                      ),
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
                              print("pagenya sengaja dihapus dihapus");
                            },
                            color: Colors.white,
                            title: "Tidak memiliki akun?",
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

  _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
