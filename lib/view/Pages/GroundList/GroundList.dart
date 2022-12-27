import 'package:flutter/material.dart';
import 'package:playpal/view/Pages/Ground-Info/groundinfo.dart';
import "GroundService.dart";
import "Ground.model.dart";

class GroundList extends StatefulWidget {
  const GroundList({Key? key}) : super(key: key);

  @override
  State<GroundList> createState() => _GroundListState();
}

class _GroundListState extends State<GroundList> {
  Map<String, Ground> _grounds =
      {}; //either index[0] for cricket[] or index[1] for football[]
  // List<City> _cityGrounds = []; // storing city's grounds.
  bool _loading = true;
  int selected = 0;

  @override
  void initState() {
    super.initState();
    _loading = true;
    GroundService.getGrounds().then((grounds) {
      print(grounds.length);
      setState(() {
        _grounds = grounds;
        onChangeSports();
        _loading = false;
      });
    });
  }

  void onChangeSports() {
    _loading = true;
    setState(() {
      // _cityGrounds = _grounds[selected]
      //     .islamabad; // cricket grounds on index[0] with islamabad
      // print(_grounds.length);
      // print(_cityGrounds[0].name);
      _loading = false;
    });
  }

  Widget customRadio(String icon, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selected = index;
          print(selected);
          onChangeSports();
        });
      },
      child: Image.asset(icon),
      style: OutlinedButton.styleFrom(
        fixedSize: Size(57, 57),
        shape: CircleBorder(),
        side: BorderSide.none,
        backgroundColor:
            (selected == index) ? Color(0xffA91079) : Color(0xff290629),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF2E0249),
            Color(0xFF570A57),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(_loading ? "Loading..." : "List of grounds"),
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    customRadio("assets/imgs/Football-ico.png", 0),
                    SizedBox(
                      width: 3,
                    ),
                    customRadio("assets/imgs/Cricket-ico.png", 1),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (() => {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 200,
                            color: Colors.white,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Text('Modal BottomSheet'),
                                  ElevatedButton(
                                    child: const Text('Close BottomSheet'),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    }),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff570A57),
                  ),
                  margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
                  padding: EdgeInsets.fromLTRB(6, 13, 6, 13),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Color(0xffF806CC),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Your Location here",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Color(0xffF806CC),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: _grounds.isEmpty ? 0 : _grounds.length,
                  itemBuilder: ((context, index) {
                    // City city = _cityGrounds[index];
                    String key = _grounds.keys.elementAt(index);
                    print(key);
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GroundInfo(
                                    groundName: _grounds[key]!.name,
                                    lat: _grounds[key]!.lat,
                                    lon: _grounds[key]!.lon,
                                    openAt: _grounds[key]!.openAt,
                                    closeAt: _grounds[key]!.closeAt,
                                    location: _grounds[key]!.mapAddress,
                                    ownerName: _grounds[key]!.owner.displayName,
                                    ownerPhone:
                                        _grounds[key]!.owner.phoneNumber,
                                    rate: _grounds[key]!.bookingRate,
                                    gid: key,
                                  )),
                        );
                      },
                      child: Container(
                        height: 150,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.maxFinite,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          "https://images.unsplash.com/photo-1474899452492-5eea44100ec4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
                                        ),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.bottomCenter),
                                  ),
                                  child: Stack(children: [
                                    FittedBox(
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                                        height: 24,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              height: 3,
                                              width: 3,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Open',
                                              style: TextStyle(
                                                color: Color(0xff989898),
                                                fontSize: 12,
                                                fontFamily: "Syne",
                                                fontWeight: FontWeight.w300,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  _grounds[key]!.name,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Syne',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.location_pin),
                                        Text(_grounds[key]!.city)
                                      ],
                                    ),
                                    // Text("PKR ${city.price}")
                                    Text(_grounds[key]!.bookingRate.toString())
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
