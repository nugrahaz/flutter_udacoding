part of 'pages.dart';

class ImagesPage extends StatefulWidget {
  final String img;
  final String heroTag;

  const ImagesPage({Key key, @required this.img, @required this.heroTag}) : super(key: key);

  @override
  _ImagesPageState createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Hero(
          tag: widget.heroTag,
          child: Center(
            child: Container(
              width: SizeConfig.screenWidth * 0.9,
              height: SizeConfig.screenHeight * 0.75,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.img,
                      ),
                      fit: BoxFit.fill)),
            ),
          ),
        ));
  }
}
