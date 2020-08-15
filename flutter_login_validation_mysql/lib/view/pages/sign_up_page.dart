part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool inProgress = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode retypePasswordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    AppSystemManager.systemBarColor(Colors.transparent, Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockHeight * 3),
                  height: SizeConfig.screenHeight,
                  alignment: FractionalOffset.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: nameController,
                        textInputAction: TextInputAction.next,
                        focusNode: nameFocus,
                        onFieldSubmitted: (term) {
                          _fieldFocusChange(context, nameFocus, emailFocus);
                        },
                        decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          labelText: "Full Name",
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockHeight * 2.5,
                      ),
                      TextFormField(
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (term) {
                          _fieldFocusChange(context, emailFocus, passwordFocus);
                        },
                        focusNode: emailFocus,
                        decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          labelText: "Email",
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockHeight * 2.5,
                      ),
                      TextFormField(
                        controller: passwordController,
                        focusNode: passwordFocus,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (term) {
                          _fieldFocusChange(context, passwordFocus, retypePasswordFocus);
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          labelText: "Password",
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockHeight * 2.5,
                      ),
                      TextField(
                        controller: retypePasswordController,
                        focusNode: retypePasswordFocus,
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          labelText: "Confirm Password",
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockHeight * 2.5,
                      ),
                      (inProgress == true)
                          ? SpinKitThreeBounce(
                              color: mainColor,
                              size: SizeConfig.blockHeight * 4,
                            )
                          : CustomButton(
                              function: () {
                                if (!(nameController.text.trim() != "" &&
                                    emailController.text.trim() != "" &&
                                    passwordController.text.trim() != "" &&
                                    retypePasswordController.text.trim() != "")) {
                                  Flushbar(
                                    duration: Duration(milliseconds: 2500),
                                    flushbarPosition: FlushbarPosition.BOTTOM,
                                    backgroundColor: mainColor.withOpacity(0.9),
                                    icon: Icon(
                                      Icons.info_outline,
                                      size: SizeConfig.blockHeight * 2.5,
                                      color: Colors.white,
                                    ),
                                    message: "Mohon untuk mengisi seluruh field!",
                                  )..show(context);
                                } else if (passwordController.text !=
                                    retypePasswordController.text) {
                                  Flushbar(
                                    duration: Duration(milliseconds: 2500),
                                    flushbarPosition: FlushbarPosition.BOTTOM,
                                    backgroundColor: mainColor.withOpacity(0.9),
                                    icon: Icon(
                                      Icons.info_outline,
                                      size: SizeConfig.blockHeight * 2.5,
                                      color: Colors.white,
                                    ),
                                    message:
                                        "password dan konfirmasi password tidak sama!",
                                  )..show(context);
                                } else if (passwordController.text.length < 6) {
                                  Flushbar(
                                    duration: Duration(milliseconds: 2500),
                                    flushbarPosition: FlushbarPosition.BOTTOM,
                                    backgroundColor: Color(0xFFFF5C83),
                                    icon: Icon(
                                      Icons.info_outline,
                                      size: SizeConfig.blockHeight * 2.5,
                                      color: Colors.white,
                                    ),
                                    message: "Password minimal memiliki 6 karakter",
                                  )..show(context);
                                } else if (!EmailValidator.validate(
                                    emailController.text.trim())) {
                                  Flushbar(
                                    duration: Duration(milliseconds: 2500),
                                    flushbarPosition: FlushbarPosition.BOTTOM,
                                    backgroundColor: mainColor,
                                    icon: Icon(
                                      Icons.info_outline,
                                      size: SizeConfig.blockHeight * 2.5,
                                      color: Colors.white,
                                    ),
                                    message: "format email address salah",
                                  )..show(context);
                                } else {
                                  //tambahin logic dst
                                  setState(() {
                                    inProgress = true;
                                  });

                                  registerUser(
                                          emailController.text.trim(),
                                          nameController.text,
                                          passwordController.text.trim())
                                      .then((value) {
                                    setState(() {
                                      inProgress = false;
                                    });
                                  });
                                }
                              },
                              title: "Registration",
                              color: mainColor,
                              borderColor: mainColor,
                              titleColor: Colors.white,
                              splashColor: Colors.white.withOpacity(0.2),
                            ),
                      SizedBox(
                        height: SizeConfig.blockHeight * 2.5,
                      ),
                    ],
                  ),
                ),
                //
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
                        EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.2),
                    child: Center(
                      child: CustomText(
                        maxLine: 1,
                        textTitle: "Registration Page",
                      ),
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

registerUser(var email, var name, var password) async {
  var url = "https://nugrahaz-7230.000webhostapp.com/login_flutter/signup.php";

  var data = {
    "email": email,
    "name": name,
    "pass": password,
  };

  var res = await http.post(url, body: data);

  if (res.statusCode == 200) {
    if (jsonDecode(res.body) == "account already exist") {
      Fluttertoast.showToast(
          msg: "Maaf, akun sudah terdaftar",
          backgroundColor: Colors.blueGrey,
          toastLength: Toast.LENGTH_LONG);
    } else {
      if (jsonDecode(res.body.toString()) == "true") {
        Fluttertoast.showToast(
            msg: "Akun berhasil dibuat",
            backgroundColor: Colors.blueGrey,
            toastLength: Toast.LENGTH_LONG);
      } else {
        Fluttertoast.showToast(
            msg: "Akun gagal dibuat",
            backgroundColor: Colors.blueGrey,
            toastLength: Toast.LENGTH_LONG);
      }
    }
  } else {
    print(res.statusCode);
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
