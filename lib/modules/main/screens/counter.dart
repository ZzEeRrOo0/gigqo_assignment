import 'package:flutter/material.dart';
import 'package:gigqo_assignment/core/constants/colors.dart';
import 'package:gigqo_assignment/modules/main/providers/counter.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, counterProvider, child){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColor,
            title:  Text(
              "Counter",
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: bodyColor,
          body:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    Text("Count:", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(counterProvider.count.toString(), style: TextStyle(color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),),
                  ],
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () => {
              counterProvider.decrease()
            },
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ), // This trail
        );
      },
    );
  }

}