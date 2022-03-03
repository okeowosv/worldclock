import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String time = '';
  String flag;
  String url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    Response response =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    // print(data);

    //Get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 2);
    // print('date/time: $datatime utc: $offset');

    // create datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    //set the time property
    time = now.toString();
  }
}
