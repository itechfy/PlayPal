import 'package:flutter/material.dart';
import "GroundService.dart";
import "Ground.model.dart";

class GroundList extends StatefulWidget {
  const GroundList({Key? key}) : super(key: key);

  @override
  State<GroundList> createState() => _GroundListState();
}

class _GroundListState extends State<GroundList> {
  List<Ground> _grounds =
      []; //either index[0] for cricket[] or index[1] for football[]
  List<City> _cityGrounds = []; // storing city's grounds.
  bool _loading = true;
  int selected = 0;

  @override
  void initState() {
    super.initState();
    _loading = true;
    GroundService.getGrounds().then((grounds) {
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
      _cityGrounds = _grounds[selected]
          .islamabad; // cricket grounds on index[0] with islamabad
      print(_grounds.length);
      print(_cityGrounds[0].name);
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  customRadio("assets/imgs/Football-ico.png", 0),
                  SizedBox(
                    width: 3,
                  ),
                  customRadio("assets/imgs/Cricket-ico.png", 1),
                ],
              ),
              GestureDetector(
                onTap: (() => {}),
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
                  itemCount: null == _cityGrounds ? 0 : _cityGrounds.length,
                  itemBuilder: ((context, index) {
                    City city = _cityGrounds[index];
                    return Container(
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
                                  Container(
                                    color: Colors.white,
                                    margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                                    width: double.maxFinite,
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
                                        Text(city.status)
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                city.name,
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
                                      Text(city.location)
                                    ],
                                  ),
                                  Text("PKR ${city.price}")
                                ],
                              )
                            ],
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
