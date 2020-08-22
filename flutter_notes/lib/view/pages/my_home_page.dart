part of 'pages.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isChecking = true;

  Future getData() async {
    var url = 'http://192.168.43.48/flutter-notes/read.php';
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  void initState() {
    AppSystemManager.systemBarColor(mainColor, grey);
    getData().then((value) {
      setState(() {
        isChecking = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: grey,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockWidth * 2.5, vertical: SizeConfig.blockHeight),
        child: FloatingActionButton(
          backgroundColor: mainColor,
          child: Icon(Icons.add),
          onPressed: () {
            AppSystemManager.systemBarColorCustom(mainColor, Colors.white);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AddEditPage(),
              ),
            );
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: () {
          onBackPressed(context);
          return;
        },
        child: (isChecking)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    height: SizeConfig.blockHeight * 12.5,
                    padding: EdgeInsets.only(
                      left: SizeConfig.blockWidth * 5,
                      top: SizeConfig.blockHeight * 2.5,
                    ),
                    color: mainColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " My Notes",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockWidth * 6,
                              color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("clicked");
                            customPopUp(context, "Keluar dari akun ini?",() {
                              resetData();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInPage(),
                                ),
                              );
                            });
                          },
                          child: Container(
                              color: Colors.transparent,
                              padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.blockWidth * 5,
                                  vertical: SizeConfig.blockWidth * 2.5),
                              child: Icon(
                                Icons.logout,
                                color: Colors.white,
                                size: SizeConfig.blockWidth * 6.5,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: getData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print(snapshot.error);
                        return snapshot.hasData
                            ? ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  List list = snapshot.data;
                                  return CardList(
                                    index: index,
                                    list: list,
                                  );
                                })
                            : Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

//                      ListTile(
//                      leading: GestureDetector(
//                        child: Icon(Icons.edit),
//                        onTap: () {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                              builder: (context) => AddEditPage(
//                                list: list,
//                                index: index,
//                              ),
//                            ),
//                          );
//                          debugPrint('Edit Clicked');
//                        },
//                      ),
//                      title: Text(list[index]['title']),
//                      subtitle: Text(list[index]['description']),
//                      trailing: GestureDetector(
//                        child: Icon(Icons.delete),
//                        onTap: () {
//                          setState(() {
//                            var url = 'http://192.168.43.48/flutter-notes/delete.php';
//                            http.post(url, body: {
//                              'id': list[index]['id'],
//                            });
//                          });
//                          debugPrint('delete Clicked');
//                        },
//                      ),
//                    );
