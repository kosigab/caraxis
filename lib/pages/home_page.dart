import 'package:flutter/material.dart';
import 'package:flutter_tutorials/classes/status.dart';
import 'package:google_fonts/google_fonts.dart';
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int speed = 0;
  int batteryCharge = 70;
  int range = 329;
  Status currentStatus = Status();

  void updateStatus() {
    setState(() {
      // fetch or calculate new data here
      speed = 10; // newSpeed;
      batteryCharge = 80; // newBatteryCharge;
      range = 340; // newRange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 50, 24, 0),
            child: Row(
              children: [
                Text(
                  'Your Car',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fleet Model 42',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.grey,
                    size: 24,
                  ),
                  onPressed: (){}

                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Image.asset(
              currentStatus.cImg,
              width: MediaQuery.of(context).size.width,
            //  height: 100,
              fit: BoxFit.cover,

            ),
          ),
         // Expanded(
         //     child: Placeholder(),
         // ),
          Text(
            '$speed',
            textAlign: TextAlign.center,

            style: GoogleFonts.roboto(
              fontSize: 120,
              fontWeight: FontWeight.w100,
              color: Colors.black, // substitute with your desired color
            ),
          ),

          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'MPH',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Fuel Quantity',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width *0.95,
            height: 20,

            child: LinearProgressIndicator(
              value: batteryCharge / 100.0,

              color: Colors.green,
              backgroundColor: Colors.grey[400],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Charge',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '$batteryCharge%',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Range',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '$range m',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Status',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Good',
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
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
                ),
                Align(
                  alignment: AlignmentDirectional(0, -0.75),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFFE4002B),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7,
                          color: Color(0x8E000000),
                          offset: Offset(0, 3),
                        )
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.power_settings_new_rounded,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}