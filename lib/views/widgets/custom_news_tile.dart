import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets.dart';

class CustomNewsTile extends StatelessWidget {
  final Function onPress;
  final int style;
  final bool isVideo;

  const CustomNewsTile({
    this.onPress,
    Key key,
    this.style,
    this.isVideo = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RawMaterialButton(
          onPressed: onPress,
          child: style == 1
              ? Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Stack(
                    fit: StackFit.loose,
                    alignment: Alignment.center,
                    children: <Widget>[
                      CustomCachedNetworkImage(
                        url: "http://via.placeholder.com/288x188",
                        height: Get.size.height * 0.25,
                        width: Get.size.width,
                      ),
                      isVideo == true ? Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.play_circle_fill, size: 40,
                          color: Colors.white.withOpacity(0.8),),
                      )
                          : SizedBox(),
                    ],
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "If you bowl short at Steve Smith then you are playing into his hands: Ian Chapell",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "CricTracker. 41 mins ago. 27 Views",
                      style: TextStyle(
                          fontSize: 10, color: Colors.grey[400]),
                    ),
                  ),
                ],
              ))
              : style == 2
              ? Container(
              width: Get.size.width * 0.45,
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 12.0,
              ),
              child: Column(
                children: <Widget>[
                  Stack(
                    fit: StackFit.loose,
                    alignment: Alignment.center,
                    children: <Widget>[
                      CustomCachedNetworkImage(
                        url: "http://via.placeholder.com/288x188",
                        height: Get.size.height * 0.15,
                        width: double.infinity,
                      ),
                      isVideo == true ? Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.play_circle_fill, size: 40,
                          color: Colors.white.withOpacity(0.8),),
                        )
                          : SizedBox(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Nz v WI, 2nd Test: Full match highlights",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "73K Views",
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[400]),
                        ),
                      ],
                    ),
                  ),
                ],
              ))
              : Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 12.0,
              ),
              child: Row(
                children: <Widget>[
                  Stack(
                    fit: StackFit.loose,
                    alignment: Alignment.center,
                    children: <Widget>[
                      CustomCachedNetworkImage(
                        url: "http://via.placeholder.com/288x188",
                        height: Get.size.height * 0.12,
                        width: Get.size.width * 0.30,
                      ),
                      isVideo == true ? Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.play_circle_fill, size: 40,
                          color: Colors.white.withOpacity(0.8),),
                      )
                          : SizedBox(),
                    ],
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "If you bowl short at Steve Smith then you are playing into his hands: Ian Chapell",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "CricTracker. 41 mins ago. \n27 Views",
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[400]),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        )
      ],
    );
  }
}
