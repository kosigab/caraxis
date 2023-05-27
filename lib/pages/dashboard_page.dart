//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_tutorials/classes/status.dart';
import 'package:flutter_tutorials/components/map_widget.dart';

class DashboardPage extends StatelessWidget {
  Status currentStatus = Status();

  //Image carImage = currentStatus.carImage();
  @override
  Widget build(BuildContext context) {
    String carImg = currentStatus.cImg;
    double conner_radius = 7.0;

    return SlidingUpPanel(
      minHeight: MediaQuery.of(context).size.height * 1/10,
      maxHeight: MediaQuery.of(context).size.height * 2 / 3,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(conner_radius),
        topRight: Radius.circular(conner_radius),
      ),
body: DashboardPage(),
      parallaxEnabled: true,
      parallaxOffset: .4,
      panel: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          color: Colors.red,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Car is Parked',
                  style: TextStyle(
                      fontSize: 16, color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      16, 8, 16, 24),
                  child: Text(
                    'You can now turn your car off.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      collapsed: Container(

        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(conner_radius),
            topRight: Radius.circular(conner_radius),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 110,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                ),
              ),
              Spacer(),

         //Hey ChatGPT
            ],
          ),
        ),
      ),
    );
  }
}
