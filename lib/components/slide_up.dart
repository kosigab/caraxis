import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CustomSlidingUpPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: MediaQuery.of(context).size.height * 1/25,
      maxHeight: MediaQuery.of(context).size.height * 2 / 3,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      panel: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          color: Colors.black87,
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
          color: Colors.black87,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Center(
          child: Container(
            width: 60,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
