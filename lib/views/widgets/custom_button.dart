import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final IconData icon;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final int borderRadius;
  final double elevation;
  final double fontSize;

  CustomButton({
    @required this.onPressed,
    @required this.text,
    this.color,
    this.textColor,
    this.borderColor = Colors.transparent,
    this.icon,
    this.borderRadius,
    this.elevation,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Opacity(
        opacity: onPressed == null ? 0.5 : 1,
        child: icon == null ? RaisedButton(
          onPressed: onPressed,
          color: color,
          elevation: elevation,
          textColor: textColor,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical:2.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius?.toDouble()??8.0),
              side: BorderSide(color: borderColor)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,textAlign: TextAlign.center,style: TextStyle(fontSize: fontSize),
            ),
          ),
        )
        : RaisedButton.icon(
          onPressed: onPressed,
          color: color,
          elevation: elevation,
          icon: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(icon),
          ),
          textColor: textColor,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical:2.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius?.toDouble()??8.0),
              side: BorderSide(color: borderColor)
          ),
          label: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,textAlign: TextAlign.center,style: TextStyle(fontSize: fontSize),
            ),
          ),
        ),
      ),
    );
  }
}