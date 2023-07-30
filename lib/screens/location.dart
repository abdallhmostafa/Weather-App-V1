import 'package:flutter/material.dart';
import 'package:weather_appv1/classes/fetch_data.dart';

import '../classes/all_country.dart';
class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
    List<AllCountry> countryData=[
      AllCountry(countryName: "Egypt - Cairo", flag: 'egypt.png', link: "Africa/Cairo"),
      AllCountry(countryName: "Bahrain", flag: 'bahrain.png', link: "Africa/Cairo"),
      AllCountry(countryName: "China", flag: 'china.png', link: "Africa/Cairo"),
      AllCountry(countryName: "Iraq", flag: 'iraq.png', link: "Africa/Cairo"),
      AllCountry(countryName: "Lebanon", flag: 'lebanon.png', link: "Africa/Cairo"),
      AllCountry(countryName: "Pakistan", flag: 'pakistan.png', link: "Africa/Cairo"),
      AllCountry(countryName: "Saudi Arabia", flag: 'saudi-arabia.png', link: "Africa/Cairo"),
      AllCountry(countryName: "Tunisia", flag: 'tunisia.png', link: "Africa/Tunis"),
      AllCountry(countryName: "United Kingdom", flag: 'united-kingdom.png', link: "Africa/Cairo"),
      AllCountry(countryName: "United States", flag: 'united-states.png', link: "Africa/Cairo"),
    ];
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.grey.shade600,
          shape:const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
          title: const Text("Choose Your Country",style: TextStyle(fontSize: 25.0,letterSpacing: 3.0,fontWeight: FontWeight.w500,color: Colors.white),),),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5.0),
            itemCount: countryData.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_,index){
              return Card(

                color: Colors.white,

                shape:const RoundedRectangleBorder(borderRadius:BorderRadius.horizontal(right: Radius.circular(15.0))),
                child: ListTile(
                  onTap: () async{
                  try{
                    FetchData fetchData =FetchData();
                    fetchData.link=countryData[index].link;
                    await fetchData.getData();
                    Navigator.pop(context, {
                      "timeNow":fetchData.timeNow ,
                      "timeZone": fetchData.timeZone,
                      "isLight":fetchData.isLight});
                  }
                      catch(exception){
                    print("The Error IS : $exception");
                      }
                  },
                  title: Text("${countryData[index].countryName}",textAlign: TextAlign.start, style: const TextStyle(fontWeight: FontWeight.w400, letterSpacing: 2.0,fontSize: 25.0,),),
                  leading:CircleAvatar(backgroundImage: AssetImage("assets/images/country_flag/${countryData[index].flag}")),

                ),
              ) ;
            }),

      ),
      onWillPop: ()async{
        return false;
      },
    );
  }
}
