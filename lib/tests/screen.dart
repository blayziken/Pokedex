import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 7),
            IconButton(
                icon: Icon(
                  Icons.home,
                  size: 24.0,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.shopping_basket,
                  size: 24.0,
                ),
                onPressed: () {}),
            SizedBox(
              width: 5.0,
            ),
            IconButton(
                icon: Icon(
                  Icons.notifications,
                  size: 24.0,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.person,
                  size: 24.0,
                ),
                onPressed: () {}),
            SizedBox(width: 7),
          ],
        ),
        color: Colors.white,
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          backgroundColor: Colors.pink,
          child: Icon(
            Icons.add,
          ),
          onPressed: () {}),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[700],
                        blurRadius: 1.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(0, 1.0), // shadow direction: bottom right
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(22.0),
                      bottomLeft: Radius.circular(22.0),
                    )),
                child: Padding(
                  padding: EdgeInsets.only(left: 3.0, right: 3.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.pink[600],
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Bamidele",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Online",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.green[600],
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          Container(
                              width: 41,
                              height: 41,
                              margin: EdgeInsets.all(7.0),
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Container(
                                  width: 38,
                                  height: 38,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/drawable-hdpi/unnamed-3.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 3.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 9.0, right: 9.0),
                child: new TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.pink,
                    tabs: <Widget>[
                      new Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.notifications_active,
                              color: Colors.grey,
                              size: 19,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              "Notificatons",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                      new Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.message,
                              color: Colors.grey,
                              size: 19,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              "Messages",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.notifications_active,
                              color: Colors.grey,
                              size: 19,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              "Notificatons",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 6.0,
              ),
//              Expanded(
//                child: TabBarView(
//                  controller: _tabController,
//                  children: <Widget>[
////                    new Notifications(),
////                    new Messages(),
//                  ],
//                ),
//              )
            ],
          ),
        ),
      ),
    );
  }
}
