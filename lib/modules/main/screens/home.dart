import 'package:flutter/material.dart';
import 'package:gigqo_assignment/core/config/routes/routes.dart';
import 'package:gigqo_assignment/core/constants/colors.dart';
import 'package:gigqo_assignment/modules/main/providers/counter.dart';
import 'package:gigqo_assignment/modules/main/screens/track.dart';
import 'package:gigqo_assignment/modules/main/widgets/home_screen_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 2,
        title: Text(
          "GIGQO",
          style: TextStyle(color: Colors.white, fontFamily: 'monospace', fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 0.0),
            child: GestureDetector(
                onTap: () => {

                },
                child: TextButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, COUNTER_SCREEN_ROUTE)
                  },
                  child: Icon(
                    Icons.remove_circle_outline,
                    color: Colors.white,
                  ),
                )
            ),
          ),
          Padding(
              padding: EdgeInsets.only(right: 0.0),
              child: GestureDetector(
                onTap: () => {

                },
                child: TextButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, NEW_TRACK_SCREEN_ROUTE)
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )
              ),
          )
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Consumer<CounterProvider>(
          builder: (context, counterProvider, child){
            return Scaffold(
                backgroundColor: bodyColor,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(50.0),
                  child:  AppBar(
                    backgroundColor: appBarColor,
                    bottom: const TabBar(
                      indicatorColor: primaryColor,
                      tabs: [
                        Tab(text: "HOME"),
                        Tab(text: "Tracks"),
                      ],
                    ),
                  ),
                ),
                body: TabBarView(
                  children: [
                    HomeScreenWidget(count: counterProvider.count,),
                    TrackScreen()
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: primaryColor,
                  onPressed: () => {
                    counterProvider.increment()
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ), // This trail
            );
          },
        )
      )
    );
  }

}