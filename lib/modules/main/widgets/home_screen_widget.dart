import 'package:flutter/material.dart';
import 'package:gigqo_assignment/core/constants/colors.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({
    Key? key,

    required this.count,
  }) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Text('Live Music', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 28),),
                Text('From Everywhere.', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 28),),
                SizedBox(
                  height: 10.0,
                ),
                Text("Count:", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 5.0,
                ),
                Text(count.toString(), style: TextStyle(color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            ),
          )
        ],
      ),
    );
  }

}