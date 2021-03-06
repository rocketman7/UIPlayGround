import 'dart:math';

import 'package:UIPlayGround/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:UIPlayGround/view_models/login_view_model.dart';
import 'package:UIPlayGround/locator.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  // 애니메이션 컨트롤러, 애니메이션 선언
  AnimationController _aniController;
  Animation _animation;

  // 뷰 모델과 service 선언
  final LoginViewModel _loginModel = LoginViewModel();
  final NavigationService _naviService = locator<NavigationService>();

  // input과 관련된 컨트롤러 선언
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _aniController = AnimationController(
      duration: const Duration(seconds: 7),
      vsync: this,
    );
    // Tween은 _animation의 두 사이 값을 지정
    _animation = Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(
        curve: Curves.easeIn,
        parent: _aniController,
      ),
    );
    _aniController.repeat();
  }

  @override
  void dispose() {
    _aniController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 키보드 켜질 때 bottom 얼마나 올라오는지 알 수 있음
    // final botInset = MediaQuery.of(context).viewInsets.bottom;
    // final botPadd = MediaQuery.of(context).viewPadding;
    // print(botInset);
    // print(botPadd);

    return Scaffold(
        // resizeToAvoidBottomInset: false,
        // resizeToAvoidBottomPadding: false,
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, .35, 1],
              colors: <Color>[
                const Color(0xFFFFDA7A),
                const Color(0xFFBFFFF4),
                const Color(0xFF82D2FF),
              ],
            ),
          ),
        ),
        // 이걸로 column 전체 감싸줘야 키보드 열릴 때 화면 가변적으로 움직이게 됨
        SingleChildScrollView(
          // reverse를 true로 둬야 Email Textform 클릭했을 때 column 맨 아래까지 키보드 위로 올라감.
          reverse: true,
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 130, right: 20), //이미지가 쏠려서 패딩으로 위치 약간 수정
                child: AnimatedBuilder(
                    animation: _aniController.view,
                    child: Image(
                      image: AssetImage('assets/images/sailingYacht.png'),
                      height: 130,
                    ),
                    builder: (context, child) {
                      // translate는 offset 값에 tween을 넣어 child의 시작, 끝 위치 지정
                      return Transform.translate(
                        offset: Offset(_animation.value * 300, 0),
                        // angle: _controller.value * 2.0 * pi,
                        child: Transform.rotate(
                          angle: sin(_animation.value * pi * 3) / 10,
                          child: child,
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "yacht",
                style: TextStyle(
                  fontFamily: 'PostNoBills',
                  fontSize: 50,
                  color: const Color(0xFF333A54),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/googleLogo.png'),
                    height: 27,
                  ),
                  SizedBox(width: 15),
                  Text(
                    'Sign in with Google Account',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF093842),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // 아래 따로 위젯으로 만듬
              _inputForm(),
              SizedBox(
                height: 11,
              ),
              FlatButton(
                onPressed: () {
                  _naviService.navigateTo('register');
                },
                child: Text(
                  "계정이 없으신가요? 지금 가입하세요!",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ],
    ));
  }

  // 로그인 관련한 inputForm 위젯
  Widget _inputForm() {
    return Column(children: <Widget>[
      // TextFormField 크기 제한
      ConstrainedBox(
        constraints: BoxConstraints.tight(
          Size(250, 50),
        ),
        child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFF79D0E5).withOpacity(.41),
            labelText: "Email",
            labelStyle: TextStyle(fontSize: 11),
            // border 둥글게 하고 inputform 밑줄 및 테두리 없앰
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 2,
      ),
      ConstrainedBox(
        constraints: BoxConstraints.tight(
          Size(250, 50),
        ),
        child: TextFormField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFF79D0E5).withOpacity(.41),
              labelText: "Password",
              labelStyle: TextStyle(fontSize: 11),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              )),
        ),
      ),
      SizedBox(height: 4),
      // Card는 child의 크기를 이어 받는다 -> ConstrainedBox로 제한
      FlatButton(
        //VIewModel의 login함수로 계정 정보를 넘긴다.
        onPressed: () => _loginModel.login(
            email: _emailController.text, password: _passwordController.text),
        child: Card(
          color: Color(0xFF09C3CF).withOpacity(.56),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(
              Size(250, 50),
            ),
            child: Center(
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
