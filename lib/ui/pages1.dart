// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, unused_local_variable, prefer_final_fields, unnecessary_this, camel_case_types

part of 'pages.dart';

class Pages1 extends StatefulWidget {
  const Pages1({Key key}) : super(key: key);
  @override
  _Pages1State createState() => _Pages1State();
}

String title;

class _Pages1State extends State<Pages1> {
  DateTime timeBackPressed = DateTime.now();
  int _total = 0;

  Future<List<Data>> futureData;
  @override
  void initState() {
    super.initState();
    // _loadUserData();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    futureData = fetchData();
  }

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 70;

    final primaryColor = Colors.orange;
    const secondaryColor = Colors.black54;
    const accentColor = Colors.white;
    const backgroundColor = Colors.white;
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= Duration(seconds: 2);
        SystemNavigator.pop();
        if (isExitWarning) {
          return false;
        } else {
          exit(0);
        }
      },
      child: Scaffold(
        body: _Isi(),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 15.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            height: height,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              height: height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Total Makanan",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      Text(
                        _total > 0 ? _total.toString() : _total.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ],
                  ),
                  InkWell(
                      child: Container(
                        width: 150,
                        color: Colors.red,
                        child: Center(
                          child: Text('Cek Out'),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Pages2()));
                        setState(() {});
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _Isi() {
    return Center(
      child: FutureBuilder<List<Data>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Data> data = snapshot.data;
            return ListView.builder(
                itemCount: data.length = 7,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 12.0),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Color(0xFFF1F1F1)),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                            child: Container(
                              height: 82,
                              width: 109,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.0),
                                  image: DecorationImage(
                                    alignment: Alignment.topCenter,
                                    fit: BoxFit.fill,
                                    image: AssetImage(sample[index].image),
                                  )),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 30.0, 0, 8.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width -
                                      2 * 24 -
                                      17 -
                                      17 -
                                      100,
                                  child: Text(
                                    data[index].title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: Text(
                                  sample[index].fav,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13,
                                      color: Colors.grey),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10.0),
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 100,
                                          margin: EdgeInsets.only(top: 10.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              border: Border.all(
                                                  color: Colors.grey)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  if (sample[index].jumlah >
                                                      0) {
                                                    setState(() {
                                                      sample[index].jumlah--;
                                                      _total--;
                                                    });
                                                  }
                                                },
                                                child: Icon(Icons.remove,
                                                    color: Colors.black,
                                                    size: 22),
                                              ),
                                              Text(
                                                _total == 0
                                                    ? _total.toString()
                                                    : sample[index]
                                                        .jumlah
                                                        .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.0),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  setState(() {
                                                    sample[index].jumlah++;
                                                    _total++;
                                                  });
                                                },
                                                child: Icon(Icons.add,
                                                    color: Colors.black,
                                                    size: 22),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default show a loading spinner.
          return CircularProgressIndicator(
            color: Colors.red,
          );
        },
      ),
    );
  }
}
