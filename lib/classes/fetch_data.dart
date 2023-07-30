import 'dart:convert';
import 'package:http/http.dart';

class FetchData{
    Map decodeDataCountry ={"":""};
    String timeNow ="00:01 PM";
    String timeZone="Africa/Cairo" ;
    bool isLight =true;
   String link;
 FetchData({this.link="Africa/Cairo"});

 getData() async {
    try {
      Response response = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$link'));
      decodeDataCountry = jsonDecode(response.body);

      DateTime utcDateTime = DateTime.parse(decodeDataCountry["utc_datetime"]);
      int utcOffset =
      int.parse(decodeDataCountry["utc_offset"].substring(0, 3));
      DateTime realTime = utcDateTime.add(Duration(hours: utcOffset));
      if (realTime.hour > 12) {
        timeNow =
        "${(realTime.hour - 12).toString().padLeft(2, "0")}:${(realTime.minute).toString().padLeft(2, '0')} PM ";
      } else {
        timeNow =
        "${realTime.hour.toString().padLeft(2, "0")}:${realTime.minute.toString().padLeft(2, "0")} AM ";
      }
      timeZone= decodeDataCountry["timezone"] ;

      if(5<realTime.hour && realTime.hour <21){
        isLight =true;
      }else {isLight=false;}

    } catch (e) {
      print(e);

    }
  }

}


