part of 'widgets.dart';

class CustomButton extends StatelessWidget {
  final Function function;
  final String title;
  final Color color, disabledColor, splashColor, titleColor, borderColor;
  final double heightWidget;
  final double fontSize;

  const CustomButton({
    Key key,
    @required this.function, //sudah
    @required this.title, //sudah
    this.color, //sudah
    this.disabledColor, //sudah
    this.splashColor, //sudah
    this.titleColor, //sudah
    this.borderColor, //sudah
    @required this.heightWidget, this.fontSize, //sudah
  });

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final paddingByHeight = sizeHeight * 0.0165;

    return Container(
      padding: EdgeInsets.all(1),
      height: heightWidget != null ? heightWidget : sizeHeight * 0.07,
      decoration: BoxDecoration(
        border: Border.all(color: (borderColor) != null ? borderColor : color, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: color != null ? color : Theme.of(context).primaryColor,
      ),
      child: FlatButton(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
        color: color != null ? color : Theme.of(context).primaryColor,
        splashColor: (splashColor) != null ? splashColor : color.withOpacity(0.3),
        onPressed: function,
        disabledColor: (disabledColor) != null ? disabledColor : grey,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: paddingByHeight),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: titleColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
