part of 'pages.dart';

class CardList extends StatefulWidget {
  final int index;
  final List list;

  CardList({Key key, this.index, this.list}) : super(key: key);

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  bool isClicked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
                padding: EdgeInsets.all(SizeConfig.blockWidth * 6),
                margin: EdgeInsets.only(
                    right: SizeConfig.blockWidth * 4,
                    left: SizeConfig.blockWidth * 4,
                    top: SizeConfig.blockHeight * 2),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: SizeConfig.blockWidth * 70,
                      child: Text(
                        toBeginningOfSentenceCase(widget.list[widget.index]['title']),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.blockWidth * 4.4,
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Divider(
                        height: 2,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      toBeginningOfSentenceCase(widget.list[widget.index]['description']),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.65),
                        fontSize: SizeConfig.blockWidth * 3.75,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.justify,
                      maxLines: null,
                    ),
                  ],
                )),
            GestureDetector(
              onTap: () {
                setState(() {
                  isClicked = !isClicked;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockWidth * 6,
                    vertical: SizeConfig.blockHeight * 3),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.all(SizeConfig.blockWidth * 2.75),
                    color: Colors.white,
                    child: Icon(
                      Icons.settings,
                      color: (isClicked)
                          ? mainColor.withOpacity(0.75)
                          : Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: (isClicked) ? 12 : 0,
        ),
        AnimatedContainer(
          decoration:
              BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.only(
            right: 16,
            left: 16,
          ),
          duration: Duration(milliseconds: 200),
          height: (isClicked) ? 50 : 0,
          child: (isClicked)
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          AppSystemManager.systemBarColorCustom(mainColor, Colors.white);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddEditPage(
                                list: widget.list,
                                index: widget.index,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          color: Colors.white,
                          height: 40,
                          width: SizeConfig.blockWidth * 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit,
                                color: mainColor.withOpacity(0.75),
                                size: SizeConfig.blockWidth * 5.5,
                              ),
                              SizedBox(
                                width: SizeConfig.blockWidth * 2,
                              ),
                              Text(
                                "Edit",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.blockWidth * 3.75),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: VerticalDivider(
                          width: 1,
                          color: mainColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            var url = 'http://192.168.43.48/flutter-notes/delete.php';
                            http.post(url, body: {
                              'id': widget.list[widget.index]['id'],
                            });
                          });

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 40,
                          color: Colors.white,
                          width: SizeConfig.blockWidth * 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.delete,
                                color: mainColor.withOpacity(0.75),
                                size: SizeConfig.blockWidth * 5.5,
                              ),
                              SizedBox(
                                width: SizeConfig.blockWidth * 2,
                              ),
                              Text(
                                "Hapus",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.blockWidth * 3.75),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        )
      ],
    );
  }
}
