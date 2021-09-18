import 'package:flutter/material.dart';
import 'package:gigqo_assignment/core/constants/colors.dart';
import 'package:gigqo_assignment/modules/main/models/track.dart';
import 'package:gigqo_assignment/modules/main/providers/track.dart';
import 'package:gigqo_assignment/modules/main/screens/single_track.dart';
import 'package:gigqo_assignment/modules/main/services/api_services.dart';
import 'package:gigqo_assignment/modules/main/widgets/track_item_widget.dart';
import 'package:provider/provider.dart';

class TrackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[ChangeNotifierProvider(create: (_) => TrackProvider())],
        child: Scaffold(
          body: TrackScreenState(),
        ),
    );
  }
}

class TrackScreenState extends StatefulWidget {
  @override
  _TrackList createState() => _TrackList();

}

class _TrackList extends State<TrackScreenState> {

  Future<List<Track>> _getTrackList() async {
    List<Track> response = await ApiServices().fetchTrackList();
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TrackProvider>(
        builder: (context, trackProvider, child) {
          return Scaffold(
            backgroundColor: bodyColor,
            body: Center(
              child: FutureBuilder<List<Track>>(
                future: _getTrackList(),
                builder: (context, AsyncSnapshot<List<Track>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return CircularProgressIndicator(color: primaryColor,);
                    default:
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, index) => TrackItemWidget(
                                track: snapshot.data![index],
                                press: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SingleTrackScreen(track: snapshot.data![index])
                                      )
                                  )
                                }
                            )
                        );
                      }
                      else if (snapshot.hasError) {
                        return Scaffold(
                          backgroundColor: bodyColor,
                          body: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                  child: Column(
                                    children: [
                                      Text("${snapshot.error}", style: TextStyle(color: Colors.white, fontSize: 18),),
                                      TextButton(
                                          style: TextButton.styleFrom(
                                          primary: primaryColor,
                                          backgroundColor: primaryColor
                                      ),
                                          onPressed: () => {
                                            setState(() { })
                                          },
                                          child: Text('Retry', style: TextStyle(color: Colors.white),)
                                      )
                                    ],
                                  )
                              )
                            ],
                          ),
                        );
                      }
                  }
                  // By default, show a loading spinner.
                  return CircularProgressIndicator(color: primaryColor,);
                },
              ),
            ),
          );
        },
      ),
    );
  }

}