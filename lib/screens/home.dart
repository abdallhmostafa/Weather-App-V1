import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  List sunnyImage=[
    'assets/images/sunny_day/4k-3150822_1920.jpg',
    'assets/images/sunny_day/4k-2413078_1920.jpg',
    'assets/images/sunny_day/4k-3314297_1920.jpg',
    'assets/images/sunny_day/landscape-1844226.png',
    'assets/images/sunny_day/mountains-55067.png'
  ];
  List nightImage=[
    'assets/images/night_day/aron-visuals-4zxSWESyZio-unsplash.jpg',
    'assets/images/night_day/izuddin-helmi-adnan-4gLtZI213Dk-unsplash.jpg',
    'assets/images/night_day/lasse-moller-4y0N8xUBsQs-unsplash.jpg',
    'assets/images/night_day/luca-bravo-a_hPPrncGlQ-unsplash.jpg',
    'assets/images/night_day/timothee-duran-ilfsT5p_qvA-unsplash (1).jpg',
    'assets/images/night_day/zac-ong-JHN1-mpgXjo-unsplash.jpg',
  ];
  Map<String,dynamic> zoneAndTime={};
late  dynamic dateOfLocation;
 bool isSun = false;
    static  Random rand = Random();
    static  Random rand2 = Random();

 late int randSunDay;
   late int randNightDay ;


    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    randSunDay = rand.nextInt(sunnyImage.length);
    randNightDay = rand2.nextInt(nightImage.length);

  }


  @override
  Widget build(BuildContext context) {
    zoneAndTime= zoneAndTime.isEmpty? ModalRoute.of(this.context)!.settings.arguments as Map<String,dynamic> :dateOfLocation ;

    isSun = zoneAndTime["isLight"] ;
      return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 0, 0, 0.5),
          image:DecorationImage( fit: BoxFit.cover,image: AssetImage(isSun? sunnyImage[randSunDay]:nightImage[randNightDay])),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            Container(
              width: double.infinity,
              padding:const EdgeInsets.symmetric(vertical: 22.0),
              decoration:const  BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.6),
              ),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${zoneAndTime["timeNow"]}",style:const TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.w600,letterSpacing: 3.0,),),
                  const SizedBox(height: 60.0,),
                  Text("${zoneAndTime["timeZone"]}",style:const TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.w600,letterSpacing: 3.0,),)
                ],
              ),
            ),


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
           dateOfLocation= await Navigator.pushNamed(context, '/location');
           setState(() {
             zoneAndTime= {"timeNow": dateOfLocation["timeNow"], "timeZone": dateOfLocation["timeZone"],"isLight":dateOfLocation["isLight"]};

             randNightDay = rand2.nextInt(nightImage.length);
             randSunDay = rand.nextInt(sunnyImage.length);

           });

        },
        backgroundColor: (Colors.grey.shade600),
        enableFeedback: true,
        tooltip: "Choose Your Location",
        isExtended: true,
        mini: false,

        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)) ,
        child: const Icon(Icons.location_on, size: 30.0, color: Colors.white),

      ),
    );
  }
}
