import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/widgets.dart';

class NewsDetailsScreen extends StatelessWidget {
  final String title;

  const NewsDetailsScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        child: Scrollbar(
          radius: Radius.circular(5),
          thickness: 3,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                floating: true,
                pinned: true,
                snap: false,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                    /*centerTitle: true,
                    title: Text("Collapsing Toolbar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),*/
                    background: Image.network(
                      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                      fit: BoxFit.cover,
                    )),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "If you bowl short at Steve Smith then you are playing into his hands: Ian Chapell",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 24),
                          ),
                          Text(
                            "CricTracker. 41 mins ago. 27 Views",
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey[400]),
                          ),
                          SizedBox(height: 40,),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem 1960s with the release of Letraset sheets containing.",
                            style: TextStyle(
                              color: Get.theme.accentColor,
                              fontStyle: FontStyle.italic
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 2,
                            width: 80,
                            color: Get.theme.primaryColor,
                          ),
                          SizedBox(height: 20,),
                          Text(
                            "Match Details",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20,),
                          Text(
                            "Wolfsburg vs Vfb Stuttgart",
                            style: TextStyle(
                                color: Get.theme.accentColor),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "Stadium name",
                            style: TextStyle(
                                color: Get.theme.accentColor),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "December 12, 2020",
                            style: TextStyle(
                                color: Get.theme.accentColor),
                          ),
                          SizedBox(height: 40,),
                          Text(
                            "Match Preview",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20,),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. "
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            style: TextStyle(
                                color: Get.theme.accentColor,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    )
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: (){

              },
            ),
            IconButton(
              icon: Icon(Icons.share),
              onPressed: (){

              },
            )
          ],
        ),
      ),
    );
  }

}
