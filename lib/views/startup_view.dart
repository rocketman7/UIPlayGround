import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:UIPlayGround/view_models/startup_view_model.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //stacked 패키지의 ViewModelBuilder를 써서 View와 ViewModel을 연결한다. .reactive = rebuild 돼야 하는 경우에 쓴다. 반대는 .nonreactive
    return ViewModelBuilder<StartUpViewModel>.reactive(
      // 여기에서 Model을 연결하고
      viewModelBuilder: () => StartUpViewModel(),
      // onModelReady를 실행한다.
      onModelReady: (model) => model.handleStartUpLogic(),
      // onModelReady가 완료되기 전에 아래 화면을 보여준다
      builder: (context, model, child) => Scaffold(
        backgroundColor: Color(0xFF1A5865),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 100,
                child: Image.asset('assets/images/sailingYacht.png'),
              ),
              SizedBox(
                height: 50,
              ),
              CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
