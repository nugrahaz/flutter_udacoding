part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var searchController = new TextEditingController();

  bool isSearch = false;
  String query = "";

  Future<List> getData() async {
    //ip diganti berdasarkan ip perangkat (harus dalam jaringan yang sama)
    final response = await http.get("http://192.168.43.48/flutter-server/get_data.php");
    return json.decode(response.body);
  }

  @override
  void initState() {
// TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    AppSystemManager.systemBarColor(mainColor, Colors.white);
    return Scaffold(
        body: WillPopScope(
          onWillPop: (){
            onBackPressed(context);
            return;
          },
          child: Stack(
      children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: SizeConfig.blockHeight * 15,
                ),
                Container(
                  height: SizeConfig.blockHeight * 85,
                  child: (isSearch == true && searchController.text.isNotEmpty)
                      ? _performSearch()
                      : FutureBuilder<List>(
                          future: getData(),
                          builder: (context, snapshot) {
                            return snapshot.hasData
                                ? ItemList(list: snapshot.data)
                                : Center(child: CircularProgressIndicator());
                          },
                        ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                )),
            child: Container(
              margin: EdgeInsets.only(
                top: SizeConfig.blockHeight * 5,
                bottom: SizeConfig.blockHeight * 3,
                left: SizeConfig.blockHeight * 3,
                right: SizeConfig.blockHeight * 3,
              ),
              child: _createSearchView(),
            ),
          ),
      ],
    ),
        ));
  }

  // membuat form search
  Widget _createSearchView() {
    return Container(
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        controller: searchController,
        onChanged: (text){
          filterList = [];
          if (searchController.text.isEmpty) {
            setState(() {
              filterList = [];
              isSearch = false;
              query = "";
            });
          } else {
            setState(() {
              filterList = [];
              isSearch = true;
              query = searchController.text;
            });
          }
        },
        decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.white),
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.white)),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _performSearch() {
    filterList = [];
    for (int i = 0; i < dataList.length; i++) {

      bool check1 = dataList[i]["kata"].contains(query.toLowerCase());
      bool check2 = dataList[i]["kata"].contains(toBeginningOfSentenceCase(query));


      if (check1) {
            filterList.add(dataList[i]);
      }

      if (check2) {
        filterList.add(dataList[i]);
      }

    }
    return (filterList.length == 0 || filterList.length == null)
        ? Container()
        : _createFilteredListView();
  }


  Widget _createFilteredListView() {
    return Container(
      child: ListView.builder(
        itemCount: filterList.length,
        itemBuilder: (_, index) {
          return Container(
            padding: EdgeInsets.symmetric(
                vertical: (index == 0) ? 0 : SizeConfig.blockHeight,
                horizontal: SizeConfig.blockWidth * 5),
            child: Card(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockHeight * 2.5,
                    horizontal: SizeConfig.blockWidth * 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      filterList[index]['kata'],
                      style: TextStyle(
                        fontSize: SizeConfig.blockWidth * 4.25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockHeight * 1.25,
                    ),
                    SizedBox(
                      width: SizeConfig.blockWidth * 80,
                      child: Text(
                        filterList[index]['terjemahan'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                            fontSize: SizeConfig.blockWidth * 3.5),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;

  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    dataList = list;
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) {
        return Container(
          padding: EdgeInsets.symmetric(
              vertical: (index == 0) ? 0 : SizeConfig.blockHeight,
              horizontal: SizeConfig.blockWidth * 5),
          child: Card(
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockHeight * 2.5,
                  horizontal: SizeConfig.blockWidth * 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    list[index]['kata'],
                    style: TextStyle(
                      fontSize: SizeConfig.blockWidth * 4.25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockHeight * 1.25,
                  ),
                  SizedBox(
                    width: SizeConfig.blockWidth * 80,
                    child: Text(
                      list[index]['terjemahan'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: SizeConfig.blockWidth * 3.5),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
