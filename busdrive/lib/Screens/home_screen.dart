import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart'; // Import geolocator package
import 'map_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  final locationController =
      TextEditingController(); // Add a controller for location
  final String token = '1234567890';
  var uuid = const Uuid();
  List<dynamic> locationsList = [];
  bool isFocused = false;
  Position? _currentPosition; // Variable to store current location
  LatLng? _destinationPosition; // Variable to store destination position

  @override
  void initState() {
    searchController.addListener(() {
      _onChange();
    });
    super.initState();
  }

  _onChange() {
    placeSuggestion(searchController.text);
  }

  void placeSuggestion(String input) async {
    const String apiKey = "AIzaSyAw_JKxikQSCVB_QccweBoxrmKitqptLJs";
    try {
      String baseUrl =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json";
      String request = '$baseUrl?input=$input&key=$apiKey&sessiontoken=$token';
      var response = await http.get(Uri.parse(request));
      var data = json.decode(response.body);
      if (kDebugMode) {
        print(data);
      }
      if (response.statusCode == 200) {
        setState(() {
          locationsList = data['predictions'];
        });
      } else {
        throw Exception("Fail to load");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void _handleLocationSelected(String description) async {
    setState(() {
      searchController.text = description;
      isFocused = false; // Hide the overlay when a location is selected
    });
    FocusScope.of(context).unfocus(); // Dismiss the keyboard

    // Fetch the coordinates of the selected address
    await _getCoordinatesFromAddress(description);
  }

  Future<void> _getCoordinatesFromAddress(String address) async {
    const String apiKey = "AIzaSyAw_JKxikQSCVB_QccweBoxrmKitqptLJs";
    try {
      String baseUrl = "https://maps.googleapis.com/maps/api/geocode/json";
      String request = '$baseUrl?address=$address&key=$apiKey';
      var response = await http.get(Uri.parse(request));
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        double lat = data['results'][0]['geometry']['location']['lat'];
        double lng = data['results'][0]['geometry']['location']['lng'];
        setState(() {
          _destinationPosition = LatLng(lat, lng);
        });
      } else {
        throw Exception("Failed to load coordinates");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _getCurrentLocation(bool fromIcon) async {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, show a message to the user
      print("Location services are disabled.");
      return;
    }

    // Check location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Request location permission
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permission denied, show a message to the user
        print("Location permission denied.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permission denied forever, show a message to the user
      print("Location permission permanently denied.");
      return;
    }

    // If we have permission, get the current location
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = position;
      });

      // Fetch the address using the coordinates
      await _getAddressFromCoordinates(position);

      // Navigate to the map screen if called from the icon
      if (fromIcon) {
        _navigateToMapScreen(destination: null);
      }
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  Future<void> _getAddressFromCoordinates(Position position) async {
    const String apiKey = "AIzaSyAw_JKxikQSCVB_QccweBoxrmKitqptLJs";
    try {
      String baseUrl = "https://maps.googleapis.com/maps/api/geocode/json";
      String request =
          '$baseUrl?latlng=${position.latitude},${position.longitude}&key=$apiKey';
      var response = await http.get(Uri.parse(request));
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        String address = data['results'][0]['formatted_address'];
        setState(() {
          locationController.text = address;
        });
      } else {
        throw Exception("Failed to load address");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void _navigateToMapScreen({LatLng? destination}) {
    if (_currentPosition != null) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MapScreen(
          initialPosition:
              LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          destination: destination,
        ),
      ));
    } else {
      print("Current location not available.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (!isFocused)
            Positioned(
              top: 0.h,
              child: SizedBox(
                height: 443.h,
                width: 393.w,
                child: Image.asset(
                  'assets/map.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          Positioned(
            top: 335.h,
            right: 16.w,
            child: Container(
              height: 46.h,
              width: 46.h,
              decoration: BoxDecoration(
                color: const Color(0xFFFF725E),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    _getCurrentLocation(true); // Called from the map icon
                  },
                  icon: Icon(Icons.map, color: Colors.white, size: 28.h,),
                ),
              ),
            ),
          ),
          if (!isFocused)
            Positioned(
              top: 47.h,
              left: 39.w,
              child: Container(
                height: 40.h,
                width: 315.w,
                decoration: BoxDecoration(
                  color: const Color(0xB3F9F9F9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trevo",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.bell_fill,
                            color: Color(0xFFFF725E),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (!isFocused)
            Positioned(
              bottom: 0.h,
              child: Container(
                height: 467.h,
                width: 393.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 27.h, left: 39.w, right: 39.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Text(
                          'Search For Your',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 31.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Text(
                          'Route',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w900,
                              color: const Color(0xFFFF725E),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 13.h),
                      Container(
                        height: 159.h,
                        width: 315.w,
                        decoration: BoxDecoration(
                          color: const Color(0xDBDBDBEC),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 23.h, bottom: 23.h, right: 20.w, left: 35.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 13.h, left: 8.w),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _getCurrentLocation(
                                            false); // Called from the location.png image
                                      },
                                      child: ColorFiltered(
                                        colorFilter: const ColorFilter.mode(
                                          Colors.blue,
                                          BlendMode.srcIn,
                                        ),
                                        child: Image.asset(
                                          'assets/location.png',
                                          height: 26.h,
                                        ),
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/-----.png',
                                      height: 33.h,
                                    ),
                                    Icon(
                                      Icons.location_on,
                                      color: const Color(0xFFFF725E),
                                      size: 26.h,
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 216.w,
                                    height: 48.h,
                                    child: TextFormField(
                                      controller: locationController,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide.none,
                                        ),
                                        hintText: 'Your Location',
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.h, horizontal: 10.w),
                                      ),
                                      readOnly: true,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  SizedBox(
                                    width: 216.w,
                                    height: 48.h,
                                    child: TextFormField(
                                      controller: searchController,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide.none,
                                        ),
                                        hintText: 'Enter Destination',
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.h, horizontal: 10.w),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          isFocused = true;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 28.h),
                      if (!isFocused)
                        Center(
                          child: Container(
                            height: 55.h,
                            width: 236.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: const Color(0xFFFF725E),
                            ),
                            child: MaterialButton(
                              onPressed: () => _navigateToMapScreen(
                                destination: _destinationPosition,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Search",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          if (isFocused)
            Positioned(
              top: 10.h,
              left: 15.w,
              right: 15.w,
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: const Color(0xDBDBDBEC),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                setState(() {
                                  isFocused = false;
                                });
                              },
                            ),
                            Expanded(
                              child: TextField(
                                controller: searchController,
                                autofocus: true,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search",
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                searchController.clear();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 400.h,
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: locationsList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(locationsList[index]['description']),
                            onTap: () => _handleLocationSelected(
                                locationsList[index]['description']),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
