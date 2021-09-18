import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:gigqo_assignment/core/constants/colors.dart';
import 'package:gigqo_assignment/modules/main/models/requests.dart';
import 'package:gigqo_assignment/modules/main/providers/track.dart';
import 'package:gigqo_assignment/modules/main/services/api_services.dart';
import 'package:provider/provider.dart';

class NewTrackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => TrackProvider() )],
        child: NewTrackForm(),
    );
  }
}

// ignore: must_be_immutable
class NewTrackForm extends StatelessWidget {

  final name = TextEditingController();
  final artist = TextEditingController();
  final year = TextEditingController();

  void _onChooseFile(TrackProvider trackProvider) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if(result != null) {

      trackProvider.setCover(result.files.first.path!.toString());
    }
  }

  void _submitTrack(BuildContext context, TrackProvider trackProvider) async {

    if(trackProvider.name == '' && trackProvider.artist == '' && trackProvider.year == '' && trackProvider.cover == '') {

      showAlertMessageDialog(context);

    }
    else {

      RequestPostTrackBody requestPostTrackBody = new RequestPostTrackBody(
          name: trackProvider.name,
          artists: trackProvider.artist,
          year: trackProvider.year,
          cover: trackProvider.cover
      );

      bool result = await ApiServices().fetchAddNewTrack(requestPostTrackBody);

      if(result) {
        showAlertSuccessDialog(context, trackProvider);
      }
      else {
        showAlertNotSuccessDialog(context);
      }

    }

  }

  showAlertMessageDialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK", style: TextStyle(color: primaryColor),),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert", style: TextStyle(color: primaryColor),),
      content: Text("Please make sure you are copleted all field."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertSuccessDialog(BuildContext context, TrackProvider trackProvider) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK", style: TextStyle(color: primaryColor),),
      onPressed: () {
        name.text = "";
        artist.text = "";
        year.text = "";
        trackProvider.setName('');
        trackProvider.setArtist('');
        trackProvider.setYear('');
        trackProvider.setCover('');
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Success!", style: TextStyle(color: primaryColor),),
      content: Text("Track has added."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertNotSuccessDialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK", style: TextStyle(color: primaryColor),),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Failed!", style: TextStyle(color: primaryColor),),
      content: Text("Track not has added."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Add New Track'),
      ),
      body: Consumer<TrackProvider>(
        builder: (context, trackProvider, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: bodyColor,
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('Name:', style: TextStyle(color: Colors.white, fontSize: 18),)
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                SizedBox(
                                  width:  MediaQuery.of(context).size.width * 1,
                                  child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    cursorColor: primaryColor,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: primaryColor, width: 2.0),
                                          borderRadius: BorderRadius.circular(6.0),
                                        ),
                                        hintText: 'Name',
                                        hintStyle: TextStyle(color: Colors.white)
                                    ),
                                    controller: name,
                                    onChanged: trackProvider.setName,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Text('Artist:', style: TextStyle(color: Colors.white, fontSize: 18),)
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                SizedBox(
                                  width:  MediaQuery.of(context).size.width * 1,
                                  child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    cursorColor: primaryColor,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: primaryColor, width: 2.0),
                                          borderRadius: BorderRadius.circular(6.0),
                                        ),
                                        hintText: 'Artist',
                                        hintStyle: TextStyle(color: Colors.white)
                                    ),
                                    controller: artist,
                                    onChanged: trackProvider.setArtist,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Text('Year:', style: TextStyle(color: Colors.white, fontSize: 18),)
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                SizedBox(
                                  width:  MediaQuery.of(context).size.width * 1,
                                  child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    cursorColor: primaryColor,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: primaryColor, width: 2.0),
                                          borderRadius: BorderRadius.circular(6.0),
                                        ),
                                        hintText: 'Year',
                                        hintStyle: TextStyle(color: Colors.white)
                                    ),
                                    keyboardType: TextInputType.number,
                                    controller: year,
                                    onChanged: trackProvider.setYear,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Column(
                                  children: [
                                    trackProvider.cover != '' ?
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Image.file(File(trackProvider.cover), height: 90,),
                                      ),
                                    ) :
                                    SizedBox(height: 0,)
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: [
                                    Text('Cover:', style: TextStyle(color: Colors.white, fontSize: 18),)
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                SizedBox(
                                  width:  MediaQuery.of(context).size.width * 1,
                                  height: 55.0,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      primary: primaryColor,
                                      backgroundColor: Colors.white,
                                    ),
                                    onPressed: () => {
                                      _onChooseFile(trackProvider)
                                    },
                                    child: Text('Choose Cover Image', style: TextStyle(color: primaryColor),),
                                  ),
                                ),
                                SizedBox(
                                  height: 40.0,
                                ),
                                SizedBox(
                                  width:  MediaQuery.of(context).size.width * 1,
                                  height: 55.0,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: primaryColor,
                                    ),
                                    onPressed: () => {
                                      _submitTrack(context, trackProvider)
                                    },
                                    child: Text('Save', style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                              ],
                            ),
                          )
                      )
                    ],
                  ),
                ),
              ),
            )
          );
        },
      ),
    );
  }

}