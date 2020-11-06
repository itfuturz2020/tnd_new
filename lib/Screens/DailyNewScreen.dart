import 'package:flutter/material.dart';
import 'package:the_national_dawn/Common/Constants.dart';
import 'package:the_national_dawn/Components/DailyNewsComponent.dart';

class DailyNewScreen extends StatefulWidget {
  @override
  _DailyNewScreenState createState() => _DailyNewScreenState();
}

class _DailyNewScreenState extends State<DailyNewScreen>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              "The",
              style: TextStyle(
                  color: appPrimaryMaterialColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5),
              child: Text(
                "National",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "Dawn",
              style: TextStyle(
                  color: appPrimaryMaterialColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 18, bottom: 19),
            child: Image.asset("assets/scan.png"),
          ),
          Image.asset("assets/bell.png"),
        ],
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  //scroll tabbar
                  height: 50.0,
                  child: TabBar(
                    isScrollable: true,
                    controller: _tabController,
                    unselectedLabelColor: Colors.black,
                    labelColor: appPrimaryMaterialColor,
                    indicatorColor: appPrimaryMaterialColor,
                    //labelPadding: EdgeInsets.symmetric(horizontal: 8),
                    tabs: [
                      Tab(text: "Explore"),
                      Tab(text: "Entertainment"),
                      Tab(text: "Sports"),
                      Tab(text: "Politics"),
                      Tab(text: "News"),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 35.0, right: 35, top: 25),
                  child: Container(
                    height: 35,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 15),
                      cursorColor: appPrimaryMaterialColor,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.search,
                          size: 25,
                          color: Colors.black,
                        ),

//                    Padding(
//                      padding: const EdgeInsets.only(right: 5.0, top: 0),
//                      child: Image.asset("assets/search.png"),
//                    ),
                        counterText: "",
                        contentPadding: EdgeInsets.only(
                            top: 0.0, bottom: 0, left: 15, right: 5),
                        hintText: "Type to Search...",
                        hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w500),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: TabBarView(
                    //contents
                    controller: _tabController,
                    children: [
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 15, right: 15),
                            child: DailyNewsComponent(),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 15, right: 15),
                            child: DailyNewsComponent(),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 15, right: 15),
                            child: DailyNewsComponent(),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 15, right: 15),
                            child: DailyNewsComponent(),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 15, right: 15),
                            child: DailyNewsComponent(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
