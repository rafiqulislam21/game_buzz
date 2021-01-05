
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_buzz/views/widgets/custom_widget.dart';
import 'package:get/get.dart';


class ShopPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 40,),
          ClipPath(
            clipper: FullTicketClipper(punchRadius: 10,),
            child: Container(
              width: Get.size.width*0.90,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 150, 20, 0),
                child: Column(
                  children: [
                    Text("some widget here"),
                    Text("some widget here"),
                    Text("some widget here"),
                    Text("some widget here"),
                    Text("some widget here"),
                  ],
                )
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _personalized(){

    return CustomWidget();
  }
}

class FullTicketClipper extends CustomClipper<Path> {
  final double punchRadius;
  double dotPosition;
  FullTicketClipper({this.punchRadius, this.dotPosition});

  @override
  Path getClip(Size size) {
    Path path = Path();
    dotPosition = (size/2).height;

    path.lineTo(0.0, dotPosition - punchRadius);
    path.conicTo(punchRadius, dotPosition - punchRadius, punchRadius, dotPosition, 1.0);
    path.conicTo(punchRadius, dotPosition + punchRadius, 0, dotPosition + punchRadius, 1.0);

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);

    path.lineTo(size.width, dotPosition + punchRadius);
    path.conicTo(size.width - punchRadius, dotPosition + punchRadius, size.width - punchRadius, dotPosition, 1.0);
    path.conicTo(size.width - punchRadius, dotPosition - punchRadius, size.width, dotPosition - punchRadius, 1.0);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
