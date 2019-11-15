import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:project_citas_test/pages/MyHomeCita.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TimeWait(),
    );
  }
}

class TimeWait extends StatefulWidget {
  @override
  _TimeWaitState createState() => _TimeWaitState();
}

class _TimeWaitState extends State<TimeWait> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    Timer timer = Timer(Duration(seconds: 6), () {
      setState(() {
        isLoading = false;
      });
    });

    return isLoading ? Maqueta() : MyHome();
  }
}

class Maqueta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.topRight,
            stops: [
              0.05,
              0.6,
              0.8,
              0.9
            ],
            colors: [
              Colors.blueGrey[800],
              Colors.blueGrey[700],
              Colors.blueGrey[600],
              Colors.blueGrey[600],
            ]),
      ),
      child: SafeArea(
        child: Stack(
          children: <Widget>[
//            Positioned(
//              top: 60,
//              left: 25,
//              child: Shimmer.fromColors(
//                baseColor: Colors.white,
//                highlightColor: Colors.white,
//                period: Duration(seconds: 3),
//                child: Container(
//                  height: 230,
//                  width: 380,
//                  color: Colors.white70,
//                ),
//              ),
//            ),
            Padding(
              padding: EdgeInsets.only(top: 340),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Shimmer.fromColors(
                      child: Builder(),
                      baseColor: Colors.grey[400],
                      highlightColor: Colors.white,
                      period: Duration(seconds: 2),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget Builder() {
  double containerWidth = 290;
  double containerHeight = 12;

  return Container(
    margin: EdgeInsets.symmetric(vertical: 12, horizontal: 2),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey,
          ),
          height: 50,
          width: 50,
          //color: Colors.grey,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: containerHeight,
              width: containerWidth * 0.97,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: containerHeight,
              width: containerWidth,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: containerHeight,
              width: containerWidth * 0.75,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
