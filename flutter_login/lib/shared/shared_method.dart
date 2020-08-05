part of "shared.dart";

Future<File> getImage() async {
  // ignore: deprecated_member_use
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  return image;
}

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