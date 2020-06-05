import 'package:UIPlayGround/view_models/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // final _auth = AuthService().auth;
  // final _db = DatabaseService().db;

  // String userEmail = "a";
  // String userUid;
  // String userName = "b";
  // dynamic user;
  // User userMap;

  @override
  Widget build(BuildContext context) {
    final HomeViewModel _homeModel = HomeViewModel();

    // Future<User> getUser() async {
    //   User userMap = await _homeModel.getUser();
    //   print(userMap.email);
    //   return userMap;
    // }

    // getUser().then((value) => userName = (value.email.toString()));

    // FutureBuilder의 future: 를 불러온다. builder는 context와 future에서 부른 sanpshot을 input으로.
    // snapshot의 Data가 들어오면 Scaffold 이하 위젯 트리를 빌드한다.
    return FutureBuilder(
        future: _homeModel.getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: Colors.red,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //이미 snapshot에 data가 있는 상태이기 때문에 아래와 같이 입력하면 Text null에러가 나지 않는다.
                  Text(snapshot.data.email),
                  Center(
                    child: Container(
                      // color: Colors.white,
                      padding: EdgeInsets.all(8),
                      // constraints: BoxConstraints.expand(),
                      alignment: Alignment.center,
                      width: 200,
                      height: 200,
                      // transform: Matrix4.rotationZ(.5),
                      decoration: BoxDecoration(
                        // color: Colors.blueGrey,
                        border: Border.all(
                          color: Colors.white,
                          width: 0.5,
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 4.0,
                            spreadRadius: 2.0,
                            offset: Offset(4, 4),
                          )
                        ],
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue,
                            Colors.blueGrey,
                          ],
                        ),
                        // shape: BoxShape.circle,
                      ),
                      child: FlatButton(
                        onPressed: () {
                          _homeModel.signOut();
                        },
                        child: Text(
                          "Sign Out",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(snapshot.data.userName),
                ],
              ),
            );
            // snapshot의 데이터가 fetch될 동안 아래 화면 보여준다.
          } else {
            return Scaffold(
              body: Center(
                child: Container(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
              ),
            );
          }
        });
  }
}
