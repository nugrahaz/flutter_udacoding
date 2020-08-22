part of 'pages.dart';

class AddEditPage extends StatefulWidget {
  final List list;
  final int index;

  AddEditPage({this.list, this.index});

  @override
  _AddEditPageState createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  bool editMode = false;

  addUpdateData() {
    if (editMode) {
      var url = 'http://192.168.43.48/flutter-notes/edit.php';
      http.post(url, body: {
        'id': widget.list[widget.index]['id'],
        'title': title.text,
        'description': description.text,
      });
    } else {
      var url = 'http://192.168.43.48/flutter-notes/add.php';
      http.post(url, body: {
        'title': title.text,
        'description': description.text,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    AppSystemManager.systemBarColorCustom(mainColor, Colors.white);

    if (widget.index != null) {
      editMode = true;
      title.text = widget.list[widget.index]['title'];
      description.text = widget.list[widget.index]['description'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(editMode ? 'Update' : 'Add Data'),
      ),
      body: WillPopScope(
        onWillPop: () {
          AppSystemManager.systemBarColor(mainColor, grey);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ),
          );

          return;
        },
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.blockHeight * 1.5),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: SizeConfig.blockHeight * 2,
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                textAlign: TextAlign.justify,
                controller: title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.blockWidth * 4.4,
                ),
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: description,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                title: editMode ? 'Update' : 'Save',
                fontSize: SizeConfig.blockWidth * 4,
                color: mainColor,
                titleColor: Colors.white,
                splashColor: Colors.white.withOpacity(0.2),
                function: () {
                  AppSystemManager.systemBarColor(mainColor, grey);

                  if(title.text.isEmpty){
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
                      "Harap mengisi title!",
                    )..show(context);
                  } else if(description.text.isEmpty){
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
                      "Harap mengisi deskripsi!",
                    )..show(context);
                  } else {
                    setState(() {
                      addUpdateData();
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ),
                    );
                  }



                },
                heightWidget: 48,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
