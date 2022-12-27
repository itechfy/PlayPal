import 'package:flutter/material.dart';
import 'package:playpal/view/Pages/Final-Payment-Ground/final_payment_ground.dart';
import 'package:playpal/view/Pages/Payment/paymentjazzcash.dart';
import 'dart:async';
import 'package:table_calendar/table_calendar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:weather/weather.dart';

import '../../../models/Slot/slot.model.dart';
import '../../../services/slots.services.dart';

class GroundInfo extends StatefulWidget {
  //need to show ground information here
  final int? rate;
  final double lat, lon;
  final String? groundName,
      location,
      openAt,
      closeAt,
      ownerName,
      ownerPhone,
      gid;
  const GroundInfo(
      {super.key,
      this.groundName,
      this.location,
      required this.lat,
      required this.lon,
      this.rate,
      this.openAt,
      this.closeAt,
      this.ownerName,
      this.ownerPhone,
      this.gid});

  @override
  State<GroundInfo> createState() => _GroundInfoState(
        this.groundName,
        this.location,
        this.lat,
        this.lon,
        this.rate,
        this.openAt,
        this.closeAt,
        this.ownerName,
        this.ownerPhone,
      );
}

class _GroundInfoState extends State<GroundInfo> {
  double latitude = 0.0, longitude = 0.0;

  int selected = 0;
  List<Slot> slots = [];
  Slot? mySlot;

  List<Slot> multiSlots = [];

  final Set<Marker> _markers = {};
  late BitmapDescriptor mapMarker;

  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOn; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  String? myDay = '';
  int? groundTotalPrice = 0;

  String weather = '';
  String weatherIcon = '';

  WeatherFactory wf = WeatherFactory('a8253075612226c6347b34f771135383');

  static LatLng _center = LatLng(0.0, 0.0);
  _GroundInfoState(
      String? groundName,
      String? location,
      double lat,
      double lon,
      int? rate,
      String? openAt,
      String? closeAt,
      String? ownerName,
      String? phoneNumber) {
    _center = LatLng(lat, lon);
    this.latitude = lat;
    this.longitude = lon;
    this.groundTotalPrice = rate;
    getCurrentWeather(lat, lon);
  }
  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/images/custom-marker.png');
  }

  Future<void> getCurrentWeather(lat, lon) async {
    Weather w = await wf.currentWeatherByLocation(lat, lon);
    print(w.weatherDescription);
    print(w.weatherIcon);
    setState(() {
      this.weather = w.weatherDescription ?? "Not able to get weather";
      this.weatherIcon = w.weatherIcon ?? "";
    });
  }

  final Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    _markers.add(Marker(
        markerId: MarkerId('id=1'),
        position: LatLng(this.latitude, this.longitude),
        icon: mapMarker));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    bool isLiked = false;

    List icons = [
      Icon(Icons.image),
      Icon(Icons.sports_soccer_outlined),
      Icon(Icons.sports_hockey),
      Icon(Icons.sports_tennis),
      Icon(Icons.sports_hockey),
      Icon(Icons.sports_bar),
      Icon(Icons.image),
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: width * 1,
                      height: height * .40,
                      color: Colors.red,
                      child: Stack(
                        children: [
                          Container(
                            width: width * 1,
                            height: height * .40,
                            color: Colors.green,
                            child: GoogleMap(
                              onMapCreated: _onMapCreated,
                              markers: _markers,
                              zoomControlsEnabled: true,
                              trafficEnabled: false,
                              mapType: MapType.terrain,
                              initialCameraPosition: CameraPosition(
                                target: _center,
                                zoom: 16.0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            child: Container(
                              width: width * .90,
                              height: height * .09,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: width * .12,
                                      height: height * .06,
                                      decoration: BoxDecoration(
                                        color: Colors.purple,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 4,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(18),
                                        ), //BorderRadius.all
                                      ),
                                      child: Icon(
                                        Icons.arrow_back_ios_new_sharp,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 3),
                                    width: width * .12,
                                    height: height * .06,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(18),
                                      ), //BorderRadius.all
                                    ),

                                    child: LikeButton(
                                      size: 18,
                                      isLiked: isLiked,
                                    ),
                                    // child: Icon(
                                    //   FontAwesomeIcons.heart,
                                    //   color: Colors.purple,
                                    //   size: 18,
                                    // ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Container(
                        width: width * .95,
                        // height: MediaQuery.of(context).size.height,

                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            )),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: width * .90,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      '${widget.groundName ?? 'No Ground Name'}',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 156, 23, 101),
                                        fontFamily: 'Syne',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(
                                      FontAwesomeIcons.link,
                                      color: Color.fromARGB(255, 67, 12, 77),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: width * .90,
                              height: height * .09,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 7,
                                itemBuilder: (context, index) => Container(
                                  width: 80,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 156, 23, 101),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: EdgeInsets.only(right: 10),
                                  child: Center(
                                    child: icons[index],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              color: Color.fromARGB(10, 155, 39, 176),
                              width: width * .90,
                              child: Row(
                                children: [
                                  weatherIcon != ''
                                      ? Image.network(
                                          'http://openweathermap.org/img/w/${weatherIcon}.png',
                                        )
                                      : Icon(
                                          Icons.bolt,
                                          color: Colors.orange,
                                        ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Weather Today',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Syne',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${weather}',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 156, 23, 101),
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: width * .85,
                              height: height * .09,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 6),
                                      Icon(
                                        FontAwesomeIcons.locationDot,
                                        color:
                                            Color.fromARGB(255, 156, 23, 101),
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Address',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Syne',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                              )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Islamabad, G-11',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 156, 23, 101),
                                              fontFamily: 'Syne',
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: width * .15,
                                      height: height * .07,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 156, 23, 101),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.map,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text('Map',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Syne',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: width * .85,
                              height: height * .09,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Icon(
                                        FontAwesomeIcons.clock,
                                        color:
                                            Color.fromARGB(255, 156, 23, 101),
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Timings',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Syne',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                              )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                              '${widget.openAt} am-${widget.closeAt} pm',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 156, 23, 101),
                                                fontFamily: 'Syne',
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16,
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Container(
                                                width: width * .95,
                                                height: height * .60,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 25,
                                                    ),
                                                    Container(
                                                      width: width * .65,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Hours',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.purple,
                                                              fontFamily:
                                                                  'Syne',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 24,
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Container(
                                                                width:
                                                                    width * .15,
                                                                height: height *
                                                                    .04,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .black26,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Icon(
                                                                  Icons.close,
                                                                  color: Colors
                                                                      .black38,
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Container(
                                                      width: width * .65,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text('Saturday',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .purple,
                                                                fontFamily:
                                                                    'Syne',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 14,
                                                              )),
                                                          Text(
                                                              '${widget.openAt} am-${widget.closeAt} pm',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .purple,
                                                                fontFamily:
                                                                    'Syne',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 13,
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Container(
                                                      width: width * .65,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Sunday',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.purple,
                                                              fontFamily:
                                                                  'Syne',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          Text(
                                                            'closed',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.purple,
                                                              fontFamily:
                                                                  'Syne',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Container(
                                                      width: width * .65,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Monday',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.purple,
                                                              fontFamily:
                                                                  'Syne',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          Text(
                                                            '${widget.openAt} am-${widget.closeAt} pm',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.purple,
                                                              fontFamily:
                                                                  'Syne',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Container(
                                                      width: width * .65,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Tuesday',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.purple,
                                                              fontFamily:
                                                                  'Syne',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          Text(
                                                            '${widget.openAt} am-${widget.closeAt} pm',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.purple,
                                                              fontFamily:
                                                                  'Syne',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Container(
                                                      width: width * .65,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Wednesday',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.purple,
                                                              fontFamily:
                                                                  'Syne',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          Text(
                                                              '${widget.openAt} am-${widget.closeAt} pm',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .purple,
                                                                fontFamily:
                                                                    'Syne',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 13,
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Container(
                                                      width: width * .65,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Thursday',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.purple,
                                                              fontFamily:
                                                                  'Syne',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          Text(
                                                            '${widget.openAt} am-${widget.closeAt} pm',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.purple,
                                                              fontFamily:
                                                                  'Syne',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Container(
                                                      width: width * .65,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Friday',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.purple,
                                                              fontFamily:
                                                                  'Syne',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          Text(
                                                            '${widget.openAt} am-${widget.closeAt} pm',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.purple,
                                                              fontFamily:
                                                                  'Syne',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    child: Container(
                                      width: width * .30,
                                      height: height * .07,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 156, 23, 101),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'SAT',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Syne',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_up_outlined,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: width * .80,
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.dotCircle,
                                    color: Colors.green,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Opened',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Syne',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Next open at ${widget.openAt}am',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 156, 23, 101),
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              width: width * .80,
                              child: Row(
                                children: [
                                  Text(
                                    'Contact info',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Syne',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: width * .80,
                              height: height * .09,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.purple,
                                        child: Icon(
                                          FontAwesomeIcons.user,
                                          color: Colors.white,
                                        ),
                                        radius: 35,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${widget.ownerName}',
                                            style: TextStyle(
                                              color: Colors.purple,
                                              fontFamily: 'Syne',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            '${widget.ownerPhone}',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Syne',
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: width * .14,
                                    height: height * .07,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 156, 23, 101),
                                      borderRadius: BorderRadius.circular(80),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.phone,
                                          color: Colors.green,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              width: width * .75,
                              height: height * .07,
                              child: Text(
                                'Typically accepts 50% as an advanced payment. Pay remaining reaching the venue.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Syne',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 25),
                              width: width * .80,
                              height: height * .15,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${widget.rate}',
                                        style: TextStyle(
                                          color: Colors.purple,
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'RS',
                                        style: TextStyle(
                                          color: Colors.purple,
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          builder: (context) {
                                            return StatefulBuilder(builder:
                                                (BuildContext context,
                                                    StateSetter setState) {
                                              return SingleChildScrollView(
                                                child: Container(
                                                  width: width * .90,
                                                  height: height * .90,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(25),
                                                      topRight:
                                                          Radius.circular(25),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Container(
                                                        width: width * .90,
                                                        child: TableCalendar(
                                                          firstDay: DateTime
                                                                  .now()
                                                              .subtract(
                                                                  Duration(
                                                                      days: 0)),
                                                          lastDay: DateTime.utc(
                                                              2030, 3, 14),
                                                          focusedDay:
                                                              _focusedDay,
                                                          selectedDayPredicate:
                                                              (day) => isSameDay(
                                                                  _selectedDay,
                                                                  day),
                                                          rangeStartDay:
                                                              _rangeStart,
                                                          rangeEndDay:
                                                              _rangeEnd,
                                                          calendarFormat:
                                                              _calendarFormat,
                                                          rangeSelectionMode:
                                                              _rangeSelectionMode,
                                                          onDaySelected:
                                                              (selectedDay,
                                                                  focusedDay) {
                                                            print(
                                                                selectedDay.day
                                                                        .toString() +
                                                                    "-" +
                                                                    selectedDay
                                                                        .month
                                                                        .toString() +
                                                                    "-" +
                                                                    selectedDay
                                                                        .year
                                                                        .toString());
                                                            String tempDate = selectedDay
                                                                    .day
                                                                    .toString() +
                                                                "-" +
                                                                (selectedDay
                                                                        .month)
                                                                    .toString() +
                                                                "-" +
                                                                selectedDay.year
                                                                    .toString();
                                                            print(widget.gid);
                                                            print(tempDate);
                                                            setState(() => {
                                                                  this.myDay =
                                                                      tempDate
                                                                });
                                                            SlotService
                                                                    .getAvailableSlots(
                                                                        widget
                                                                            .gid,
                                                                        tempDate)
                                                                .then((value) {
                                                              setState(() => {
                                                                    this.slots =
                                                                        value
                                                                  });
                                                            }).catchError(
                                                                    (error) => {
                                                                          print(
                                                                              error)
                                                                        });

                                                            if (!isSameDay(
                                                                _selectedDay,
                                                                selectedDay)) {
                                                              setState(() {
                                                                _selectedDay =
                                                                    selectedDay;
                                                                _focusedDay =
                                                                    focusedDay;
                                                                _rangeStart =
                                                                    null; // Important to clean those
                                                                _rangeEnd =
                                                                    null;
                                                                _rangeSelectionMode =
                                                                    RangeSelectionMode
                                                                        .toggledOff;
                                                              });
                                                            }
                                                          },
                                                          onRangeSelected:
                                                              (start, end,
                                                                  focusedDay) {
                                                            print(
                                                                "Range triggered");
                                                            setState(() {
                                                              _selectedDay =
                                                                  null;
                                                              _focusedDay =
                                                                  focusedDay;
                                                              _rangeStart =
                                                                  start;
                                                              _rangeEnd = end;
                                                              _rangeSelectionMode =
                                                                  RangeSelectionMode
                                                                      .toggledOn;
                                                            });
                                                          },
                                                          onFormatChanged:
                                                              (format) {
                                                            if (_calendarFormat !=
                                                                format) {
                                                              setState(() {
                                                                _calendarFormat =
                                                                    format;
                                                              });
                                                            }
                                                          },
                                                          onPageChanged:
                                                              (focusedDay) {
                                                            _focusedDay =
                                                                focusedDay;
                                                          },
                                                          daysOfWeekHeight: 20,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 30,
                                                      ),
                                                      Container(
                                                        width: width * .85,
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'Select Available Slots',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'Arial',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        width: width * .85,
                                                        height: height * .06,
                                                        child: ListView.builder(
                                                          itemCount:
                                                              this.slots.length,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemBuilder: (context,
                                                                  index) =>
                                                              Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 20),
                                                            child: this.slots[index].startTime !=
                                                                        "" &&
                                                                    this.slots[index].slotId !=
                                                                        'fullDay'
                                                                ? OutlinedButton(
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        selected =
                                                                            index;
                                                                        this.mySlot = new Slot(
                                                                            startTime:
                                                                                this.slots[index].startTime,
                                                                            closeTime: this.slots[index].closeTime,
                                                                            slotId: this.slots[index].slotId);
                                                                      });
                                                                    },
                                                                    child: Text(
                                                                        "${this.slots[index].startTime}am to ${this.slots[index].closeTime}:pm",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white)),
                                                                    style: OutlinedButton
                                                                        .styleFrom(
                                                                      side: BorderSide
                                                                          .none,
                                                                      backgroundColor: (selected ==
                                                                              index)
                                                                          ? Color(
                                                                              0xff290629)
                                                                          : Colors
                                                                              .grey
                                                                              .shade500,
                                                                    ),
                                                                  )
                                                                : this.slots[index].slotId ==
                                                                        'fullDay'
                                                                    ? OutlinedButton(
                                                                        onPressed:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            selected =
                                                                                index;
                                                                            this.mySlot = new Slot(
                                                                                startTime: this.slots[index].startTime,
                                                                                closeTime: this.slots[index].closeTime,
                                                                                slotId: this.slots[index].slotId);
                                                                          });
                                                                        },
                                                                        child: Text(
                                                                            "${this.slots[index].slotId}",
                                                                            style:
                                                                                TextStyle(color: Colors.white)),
                                                                        style: OutlinedButton
                                                                            .styleFrom(
                                                                          side:
                                                                              BorderSide.none,
                                                                          backgroundColor: (selected == index)
                                                                              ? Color(0xff290629)
                                                                              : Colors.grey.shade500,
                                                                        ),
                                                                      )
                                                                    : SizedBox(
                                                                        width:
                                                                            1,
                                                                      ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 50,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        PaymentJazzCash(
                                                                          myDay:
                                                                              myDay,
                                                                          ownerName:
                                                                              widget.ownerName,
                                                                          ownerPhone:
                                                                              widget.ownerPhone,
                                                                          rate:
                                                                              this.groundTotalPrice,
                                                                          s: mySlot,
                                                                          groundName:
                                                                              widget.groundName,
                                                                          gid: widget
                                                                              .gid,
                                                                        )),
                                                          );
                                                        },
                                                        child: Container(
                                                          width: width * .85,
                                                          height: height * .09,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          156,
                                                                          23,
                                                                          101),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            10),
                                                                  )),
                                                          child: Center(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'Book now',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                SizedBox(
                                                                  width: 15,
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .arrow_forward_rounded,
                                                                  size: 18,
                                                                  color: Colors
                                                                      .white,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                          });
                                    },
                                    child: Container(
                                      width: width * .45,
                                      height: height * .07,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 156, 23, 101),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Book now',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Syne',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                              )),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_rounded,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
