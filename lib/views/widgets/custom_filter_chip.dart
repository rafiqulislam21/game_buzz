import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomFilterChip extends StatefulWidget {
  final int style;
  final String chipName;
  bool isSelected;
  final ValueChanged onSelect;

  CustomFilterChip({Key key, this.chipName, this.isSelected = false, this.onSelect, this.style})
      : super(key: key);

  @override
  _CustomFilterChipState createState() => _CustomFilterChipState();
}

class _CustomFilterChipState extends State<CustomFilterChip> {
  // var isSelected = false;

  @override
  Widget build(BuildContext context) {
    return widget.style == 2 ? Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: RawMaterialButton(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: widget.isSelected ? Get.theme.primaryColor : Get.theme.accentColor, width: 1)
          ),
          child: Container(

              child: Stack(
                children: [
                  Container(
                  ),
                  widget.isSelected ? Align(
                      alignment: Alignment.topRight,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        child: ClipOval(
                          child: SizedBox(
                            /*width: 35,
                          height: 35,*/
                            child: Icon(
                               Icons.check_circle,
                              color: Get.theme.primaryColor,
                            ),
                          ),
                        ),
                      )
                  ) : SizedBox(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Image.asset("assets/img/bd-logo.png",height: 50,width: 50,)),
                          Text(
                            widget.chipName??"",
                            style: TextStyle(
                                color: Get.theme.textTheme.bodyText1.color, fontWeight: FontWeight.w300,fontSize: 10),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ),
                  ),
                ],
              )),
          onPressed: (){
            setState(() {
              widget.isSelected = !widget.isSelected;
            });
            widget.onSelect(widget.isSelected);
          },
        ),
      ),
    ): Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: RawMaterialButton(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: widget.isSelected ? Get.theme.primaryColor : Colors.white,width: 2)
          ),
          child: Container(
              height: (Get.size.width*0.28)*(5/4),
              width: (Get.size.width*0.28),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage("assets/img/cricket.jpg"),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.grey.withOpacity(0.0),
                            Colors.black87,
                          ],
                        )),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      child: ClipOval(
                        child: SizedBox(
                          /*width: 35,
                          height: 35,*/
                          child: Icon(
                            widget.isSelected ? Icons.check_circle : Icons.add,
                            color: widget.isSelected ? Get.theme.primaryColor : Colors.white,
                          ),
                        ),
                      ),
                    )/*Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        widget.isSelected ? Icons.check_circle : Icons.add,
                        color: widget.isSelected ? Get.theme.primaryColor : Colors.white,
                      ),
                    ),*/
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.chipName??"",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )),
          onPressed: (){
            setState(() {
              widget.isSelected = !widget.isSelected;
            });
            widget.onSelect(widget.isSelected);
          },
        ),
      ),
    );
  }
}
