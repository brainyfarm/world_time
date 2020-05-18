import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; // Location name for the UI
  String time;// Time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDayTime;

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {
    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);


      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set time property
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch(e) {
      print('caught error: $e');
      time = 'unable to get time data';
    }
  }
}


/**
 * Documentation
 * Documenting the Icons and the Text
 * This is a reality check for the most of us
 * I am detecting the location in the text field in the jazz
**/

/**
 * Document
 * Retrofitting: Hater relationship
 * Text information and the reaction and the fact that
 * For the information and the intuition and the activity mannerism
 * Help for the app rebuild and recompilation process will be needed
 * If this project is going will take a while to manifest and the futures of
 * The entirety
**/

