part of 'widgets.dart';

class CustomText extends StatelessWidget {
  final String textTitle;
  final Color colorTitle;
  final FontWeight fontWeightTitle;
  final maxLine;
  final TextAlign textAlign;

  const CustomText({
    Key key,
    @required this.textTitle,
    this.colorTitle,
    this.fontWeightTitle,
    @required this.maxLine,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(text: (textTitle) != null ? textTitle : "Title belum diisi"),
      style: TextStyle(
        color: (colorTitle) != null ? colorTitle : Colors.white,
        fontWeight: (fontWeightTitle) != null ? fontWeightTitle : FontWeight.bold,
      ),
      textAlign: (textAlign) != null ? textAlign : TextAlign.start,
      presetFontSizes: [
        44,
        43,
        42,
        41,
        40,
        39,
        38,
        37,
        36,
        35,
        34,
        33,
        32,
        31,
        30,
        29,
        28,
        27,
        26,
        25,
        24,
        23,
        22,
        21,
        20,
        19,
        18,
        17,
        16,
        15,
        14,
        13,
        12,
        11,
        10,
        9,
        8,
        7,
        6,
        5,
        4,
        3,
        2,
        1
      ],
      maxLines: maxLine,
    );
  }
}
