import 'package:flutter/material.dart';
import 'package:the_national_dawn/Common/Constants.dart';

class HomeStoriesScreen extends StatefulWidget {
  @override
  _HomeStoriesScreenState createState() => _HomeStoriesScreenState();
}

class _HomeStoriesScreenState extends State<HomeStoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          // scrollDirection: Axis.horizontal,
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top + 2,
                  ),
                  Container(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          child: Container(
                            height: 420,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              "assets/z.jpeg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15, top: 25),
                                child: Text(""))),
                        Positioned(
                            top: 8.0,
                            right: 8.0,
                            child: Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  color: Colors.grey[100],
                                ),
                                child: Icon(
                                  Icons.star_border,
                                  color: Colors.black,
                                  size: 30.0,
                                ))),
                        Positioned(
                            bottom: 15.0,
                            right: 10.0,
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(context,MaterialPageRoute(builder:(context) =>Offers()));
                              },
                              child: Container(
                                height: 74,
                                width: 74,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        color:
                                            Color(0xff16B8FF).withOpacity(0.2),
                                        spreadRadius: 3,
                                        offset: Offset(1, 6))
                                  ],
                                ),
                                child: CircleAvatar(
                                    radius: 30.0,
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.star,
                                        color: appPrimaryMaterialColor,
                                        size: 45.0)
//                            Image.asset("assets/Lheart.png"),
                                    //Icon(Icons.favorite,color: Colors.red,size: 45.0,),
                                    ),
                              ),
                            )
//                      child: CircleAvatar(
//                        radius: 40,
//                          backgroundColor: Colors.white,
//                          child: Icon(Icons.favorite,color: Colors.red,size: 45.0,))
                            ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                    ),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                                height: 80,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.grey[200], width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                      ),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(
                                            'assets/pic.png',
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6.0),
                                      child: Text(
                                        "IT Futurz InfoSolution",
                                        //successStoriesList[index]["headline"],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: appPrimaryMaterialColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 22),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              "We build powerful web applications to solve complex business problems.Sleek, responsive Front-End  Development. Not only for you but for your users.Handcrafted apps to streamline all of your processes and drive customer engagement.We build powerful web applications to solve complex business problems.Sleek, responsive Front-End  Development.We build powerful web applications to solve complex business problems.Sleek, responsive Front-End  Development.We build powerful web applications to solve complex business problems.Sleek, responsive Front-End  Development",

                              //  successStoriesList[index]["storyContent"],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Color(0xff010101),
                                  fontSize: 14,
                                  letterSpacing: 0)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
