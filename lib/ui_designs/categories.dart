import 'package:dog_app/database/database.dart';
import 'package:dog_app/model/signup_table.dart';

import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  var _databaseprovider;

  late Future<List<signUpModel>> signUpdetailList;

  void initState() {
    super.initState();
    _databaseprovider = Databaseprovider.instance;
    refreshData();
  }

  refreshData() {
    setState(() {
      getUserData();
    });
  }

  getUserData() {
    setState(() {
      signUpdetailList = _databaseprovider.getAllsignUpdetail();
      print('Data from categoryList $signUpdetailList');
    });
  }

  void _showHeroAnimation(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Hero(
              tag: 'hero-Animation-on-profile',
              child: Image.asset('images/profile.jpg'),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black87),
        ),
        leading: Icon(
          Icons.menu,
          color: Colors.black87,
        ),
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://images4.alphacoders.com/286/286746.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FutureBuilder(
                        future: signUpdetailList,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<signUpModel>> snapshot) {
                          if (snapshot.hasData) {
                            print(
                                'Length of transaction $snapshot.data?.length');
                            return ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (BuildContext context, int index) {
                                signUpModel dogModel = snapshot.data![index];

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      child: Hero(
                                        transitionOnUserGestures: mounted,
                                        tag: 'hero-animation_tag',
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundImage:
                                              AssetImage('images/profile.jpg'),
                                        ),
                                      ),
                                      onTap: () => {
                                        _showHeroAnimation(context),
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            '${dogModel.userName}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              //fontFamily: 'Times New Roman',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Please Wait.....'),
                                  SizedBox(height: 30),
                                  CircularProgressIndicator(),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 8,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 6,
                                right: 6,
                                top: 8,
                                bottom: 2,
                              ),
                              child: Card(
                                elevation: 1.2,
                                child: Container(
                                  height: 70,
                                  child: Text('info'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 6,
                                right: 6,
                                top: 2,
                                bottom: 2,
                              ),
                              child: Card(
                                elevation: 1.2,
                                child: Container(
                                  height: 70,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 6,
                                right: 6,
                                top: 2,
                                bottom: 2,
                              ),
                              child: Card(
                                elevation: 1.2,
                                child: Container(
                                  height: 70,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 6,
                                right: 6,
                                top: 2,
                                bottom: 2,
                              ),
                              child: Card(
                                elevation: 1.2,
                                child: Container(
                                  height: 70,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 6,
                                right: 6,
                                top: 2,
                                bottom: 2,
                              ),
                              child: Card(
                                elevation: 1.2,
                                child: Container(
                                  height: 70,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 6,
                                right: 6,
                                top: 2,
                                bottom: 2,
                              ),
                              child: Card(
                                elevation: 1.2,
                                child: Container(
                                  height: 70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
