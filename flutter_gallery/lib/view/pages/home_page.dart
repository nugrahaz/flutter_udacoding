part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  final _snappableKey = GlobalKey<SnappableState>();

//  List<GlobalKey<FormState>> _formKey = [];

  @override
  void initState() {
    AppSystemManager.systemBarColor(Colors.white, Colors.white);

//    _formKey = new List<GlobalKey<FormState>>.generate(imageList.length,
//            (i) => new GlobalKey<FormState>(debugLabel: ' _formKey'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () {
            onBackPressed(context);
            return;
          },
          child: Column(
            children: [
              Flexible(
                  flex: 1,
                  child: Container(
                      child: Center(
                        child: Text(
                          "Gallery",
                          style: TextStyle(
                          fontSize: SizeConfig.blockWidth * 9,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                        ),
                      ))),
              Flexible(
                flex: 6,
                child: Container(
//              height: SizeConfig.screenHeight * 0.9,
                  color: grey,
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockWidth * 3,
                      vertical: SizeConfig.blockHeight),

                  child: Container(
                    child: StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        itemCount: imageList.length,
                        itemBuilder: (context, index) {
                          return Hero(
                            tag: heroList[index],
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ImagesPage(
                                              img: imageList[index],
                                              heroTag: heroList[index],
                                            )));
                              },
                              child: Container(
                                padding: (cekGenap(index))
                                    ? EdgeInsets.all(20)
                                    : EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(12))),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: imageList[index],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        staggeredTileBuilder: (index) {
                          return new StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  cekGenap(int number) {
    if (number % 2 == 0) {
      return true;
    }
    return false;
  }
}
