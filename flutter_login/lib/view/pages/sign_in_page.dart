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

  bool isEmailValid = false;
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
                          onChanged: (text) {
                            setState(() {
                              isPasswordValid = text.length >= 6;
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
                                      isSigningIn = false;
                                    });
                                  } else {
                                    if (isEmailValid) {
                                      if (isPasswordValid) {
                                        //lakukan sesuatu jika benar (masih kosong)

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
                                              "Password yang Anda masukkan kurang dari 6 karakter",
                                        )..show(context);
                                      }
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
                                        isSigningIn = false;
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ),
                            );
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
}
