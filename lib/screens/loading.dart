import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_appv1/classes/fetch_data.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  getInitialData() async {
    try {
      FetchData fetchData =FetchData();
       await fetchData.getData();
      Navigator.pushReplacementNamed(context, '/home',
          arguments: {"timeNow": fetchData.timeNow, "timeZone": fetchData.timeZone,"isLight":fetchData.isLight});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: const Center(
        child: SpinKitRing(
          lineWidth: 10.0,
          color: Colors.black54,
          size: 80.0,
          duration: Duration(seconds: 1),
        ),
      ),
    );
  }
}
