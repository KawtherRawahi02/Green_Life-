import 'package:app/payment/payment.dart';
import 'package:app/products/info_palant_screen.dart';
import 'package:flutter/material.dart';
import 'LocationModel.dart';

class LocationScreen extends StatefulWidget {
  final location;
  //final  locationRoute = '/location_screen';
  LocationScreen({this.location});

  void moveToPayment(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return Payment();
    }));
  }

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  LocationModel weatherModel = LocationModel(); // for the two remaining methods

  var cityName = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print(widget.locationWeather);
    updateUI(widget
        .location); //widegt => it belongs to stateful =>  without it there will be an error
  }

//this method will extract the data from the weatherdata
  void updateUI(dynamic location) {
    if (location == null) {
      cityName = '';
      return;
    }
    print(location);
    cityName = location['name'];
    print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 63, 106, 66),
        title: Text('Your address'),
      ),
      backgroundColor: Color.fromARGB(100, 63, 106, 66),
      body: Container(
        //--------------------------------------------
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Screen.jpg'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        //margin: EdgeInsets.all(20),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                //   mainAxisAlignment: MainAxisAlignment.s,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocation();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),

                  Text('Update your address',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))

                  //-----------------------------------------------------------------------------
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$cityName",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 63, 106, 66),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => moveToPayment(context),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 60, 100, 65),
                  onPrimary: Colors.white,
                  fixedSize: const Size(150, 50),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                child: Text("Pay"),
              )
            ],
          ),
        ),

        //--------------------------------------------
      ),
    );
  }
}
