import 'package:gigqo_assignment/core/constants/api_url.dart';
import 'package:gigqo_assignment/modules/main/models/requests.dart';
import 'package:gigqo_assignment/modules/main/models/track.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'dart:async';

class ApiServices {

  Future<List<Track>> fetchTrackList() async {
    final response =
    await http.get(Uri.parse('$baseApiURL/mockup/tracks'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return List<Track>.from(jsonDecode(response.body)['data'].map((track) => Track.fromJson(track)));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load track');
    }
  }

  Future<Track> fetchSingleTrack(String id) async {
    final response =
    await http.get(Uri.parse('$baseApiURL/mockup/tracks/$id'));

    if(response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Track track = Track.fromJson(jsonDecode(response.body)['data']);

      return track;
    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load single track');
    }
  }

  Future<bool> fetchAddNewTrack(RequestPostTrackBody requestPostTrackBody) async {

    try {

      final response =
      await http.post(Uri.parse('$baseApiURL/mockup/tracks'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode(requestPostTrackBody.toJson()),
      );

      if(response.statusCode == 201) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return true;
      }
      else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return false;
      }

    }
    catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> fetchEditTrack(RequestPostTrackBody requestPostTrackBody) async {

    try {

      final response =
      await http.put(Uri.parse('$baseApiURL/mockup/tracks'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode(requestPostTrackBody.toJson()),
      );

      if(response.statusCode == 201) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return true;
      }
      else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return false;
      }

    }
    catch (e) {
      print(e);
      return false;
    }
  }

}

