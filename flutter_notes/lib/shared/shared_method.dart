part of "shared.dart";

Future<bool> onBackPressed(context) {
  return showDialog(
    builder: (BuildContext context) => CustomDialog(
      title: "Exit",
      image: Image(image: AssetImage('assets/animation/sad.gif')),
      description: "Apakah Anda ingin meninggalkan aplikasi ini?",
      buttonText: "Ya",
      function: () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      },
    ),
    context: context,
  );
}

Future<bool> customPopUp(BuildContext context, String description,  Function function) {
  return showDialog(
    builder: (BuildContext context) => CustomDialog(
      title: "Keluar",
      image: Image(image: AssetImage('assets/animation/sad.gif')),
      description: description,
      buttonText: "Ya",
      function: () {
        function();
      },
    ),
    context: context,
  );
}


Future getDataLogin() async {
  userLoggedIn = await HelperFunctions.getUserLoggedInSharedPreference();
}

Future setData(List<dynamic> data, bool isLoggedIn) async {
  HelperFunctions.saveUserNameSharedPreference(data[0]["name"]);
  HelperFunctions.saveUserEmailSharedPreference(data[0]["email"]);
  HelperFunctions.saveUserIDSharedPreference(data[0]["id_login"]);
  HelperFunctions.saveUserLoggedInSharedPreference(isLoggedIn);
}

Future getData() async {
  userId = await HelperFunctions.getUserIDSharedPreference();
  userName = await HelperFunctions.getUserNameSharedPreference();
  userEmail = await HelperFunctions.getUserEmailSharedPreference();
  userLoggedIn = await HelperFunctions.getUserLoggedInSharedPreference();
}

Future resetData() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
//  await preferences.remove('namaString');
}
