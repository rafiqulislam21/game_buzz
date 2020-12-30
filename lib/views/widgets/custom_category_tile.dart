import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCategoryTile extends StatelessWidget {
  final String title;
  final String trailing;
  final IconData trailingIcon;
  final Function onTap;
  final Color color;

  const CustomCategoryTile(
      {Key key,
      this.title,
      this.onTap,
      this.color,
      this.trailing,
      this.trailingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title ?? "",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      trailing: trailingIcon != null ? Icon(trailingIcon,color: Get.theme.primaryColor,) : Text(
        trailing ?? "",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color ?? Get.theme.primaryColor),
      ),
      dense: true,
      onTap: onTap,
    );
  }
}
