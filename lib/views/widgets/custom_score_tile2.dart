import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets.dart';

class CustomScoreTile2 extends StatelessWidget {
  final Function onPress;

  const CustomScoreTile2({
    this.onPress,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: RawMaterialButton(
            onPressed: onPress,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: Get.theme.accentColor)),
            child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "MATCH #9 -TEST",
                          style: TextStyle(
                              color: Colors.grey[400],
                              letterSpacing: 2,
                              fontSize: 12),
                        ),
                        InkWell(child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(Icons.notifications,color: Get.theme.accentColor,),
                        ), onTap: () {})
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: ListTile(
                                dense: true,
                                leading: CustomCachedNetworkImage(
                                  url: "http://via.placeholder.com/288x188",
                                  height: 25,
                                  width: 25,
                                ),
                                title: Text(
                                  "AUS",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: ListTile(
                                dense: true,
                                leading: Text(
                                  "191/10 & 93/2",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                title: Text(
                                  "(21)",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[400]),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: ListTile(
                                dense: true,
                                leading: CustomCachedNetworkImage(
                                  url: "http://via.placeholder.com/288x188",
                                  height: 25,
                                  width: 25,
                                ),
                                title: Text(
                                  "IND",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: ListTile(
                                dense: true,
                                leading: Text(
                                  "191/10 & 93/2",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                title: Text(
                                  "(21)",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[400]),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Australia beat India by 8 wickets",
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[800]),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        )
      ],
    );
  }
}
