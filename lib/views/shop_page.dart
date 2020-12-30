import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_buzz/views/widgets/custom_widget.dart';
import 'package:get/get.dart';


class ShopPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _personalized(),
    );
  }

  Widget _personalized(){

    return CustomWidget();
  }
}
