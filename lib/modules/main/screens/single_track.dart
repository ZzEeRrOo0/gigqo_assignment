import 'package:flutter/material.dart';
import 'package:gigqo_assignment/core/config/routes/routes.dart';
import 'package:gigqo_assignment/core/constants/colors.dart';
import 'package:gigqo_assignment/modules/main/models/track.dart';

class SingleTrackScreen extends StatelessWidget {
  const SingleTrackScreen({Key? key, required this.track}) : super(key: key);
  
  final Track track;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Single Track'),
      ),
      backgroundColor: bodyColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 300,
              child: Image.network(track.cover),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text('Name: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text(track.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Text('Artists: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text(track.artists, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Text('Year: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text(track.year, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
                  ],
                ),
                SizedBox(
                  height: 140.0,
                ),
                SizedBox(
                  width:  MediaQuery.of(context).size.width * 1,
                  height: 50.0,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: primaryColor,
                    ),
                    onPressed: () => {
                      Navigator.pushNamed(context, EDIT_TRACK_SCREEN_ROUTE, arguments: { 'track_id': track.id })
                    },
                    child: Text('Edit', style: TextStyle(color: Colors.white),),
                  )
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}