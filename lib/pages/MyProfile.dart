
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../components/GradientButton.dart';
import '../components/MyLoading.dart';

class MyProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('个人中心'),
      // ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: <Widget>[
              GradientButton(
                child: Text('渐变'),
                colors: [ Colors.yellow[800], Colors.purple[800], ],
                color: Color(0xFF7964E3),
                radius: 20.0,
                width: MediaQuery.of(context).size.width * 0.8,
                onTap: () {
                  print('点击渐变按钮');
                },
              ),
              Container(height: 20.0,),
              CupertinoButton(
                child: Text('个人中心'),
                color: Color(0xFF7964E3),
                // minSize: MediaQuery.of(context).size.width * 0.8,
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                onPressed: () {
                  showMyCustomLoadingDialog(context);
        //           showDialog(
        //             context: context,
        //             builder: (BuildContext context) {
        //               return Center(
        //   child: new CircularProgressIndicator(),
        // );
        //               // return CupertinoAlertDialog(
        //               //   title: Text('提示信息'),
        //               //   content: Text('IOS dialog'),
        //               //   actions: [
        //               //     CupertinoDialogAction(
        //               //       isDefaultAction: true,
        //               //       child: Text("关闭"),
        //               //       onPressed: () { Navigator.of(context).pop(); },
        //               //     )
        //               //   ]
        //               // );
        //             }
        //           );
                },
              ),
            ],
          )
        )
      )
    );
  }

  // showLoading() {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     builder: (BuildContext context) {
  //       return Center(
  //         child: new CircularProgressIndicator(),
  //       );
  //     }
  //   );
  // }
}
