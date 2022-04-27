import 'LocationModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

class LocationLoadingScreen extends StatefulWidget {
  const LocationLoadingScreen({Key? key}) : super(key: key);

  @override
  State<LocationLoadingScreen> createState() => _LocationLoadingScreenState();
}

class _LocationLoadingScreenState extends State<LocationLoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    var locationData = await LocationModel().getLocation();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(location: locationData);
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitDoubleBounce(
        color: Colors.green,
        size: 100,
      ),
    ));
  }
}
