import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'widgets.dart';

class CustomScoreTile extends StatelessWidget {
  final Function onPress;

  const CustomScoreTile({
    this.onPress,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            // side: BorderSide(color: Colors.red)
          ),
          // elevation: 5,
          child: RawMaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  // side: BorderSide(color: Colors.red)
              ),
              // elevation: 5,
              fillColor: Get.theme.cardColor,
              onPressed: onPress,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: CustomCachedNetworkImage(
                          url: "http://via.placeholder.com/288x188",
                          height: Get.size.height * 0.20,
                          // width: Get.size.width,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: Column(
                            children: [
                              CustomCachedNetworkImage(
                                url: "http://via.placeholder.com/288x188",
                                height: 30,
                                // width: Get.size.width,
                              ),
                              Text(
                                "SIX",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 14),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          title: Text(
                            "205/4",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            "20 overs",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 10,
                            width: 1,
                            color: Get.theme.accentColor,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Get.theme.accentColor,
                                // borderRadius: BorderRadius.circular(50)
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "v",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            height: 10,
                            width: 1,
                            color: Get.theme.accentColor,
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListTile(
                          trailing: Column(
                            children: [
                              CustomCachedNetworkImage(
                                url: "http://via.placeholder.com/288x188",
                                height: 30,
                                // width: Get.size.width,
                              ),
                              Text(
                                "SIX",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 14),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          title: Text(
                            "205/4",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            "20 overs",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text("REN need 163 runs in 71 balls",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis)
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                color: Colors.green,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                  child: Text(
                    "LIVE",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  // side: BorderSide(color: Colors.red)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
              // side: BorderSide(color: Colors.red)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
              child: Text(
                "LIVE SCORES",
                style: TextStyle(
                  color: Get.theme.primaryColor,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
