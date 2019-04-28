import 'package:flutter/material.dart';

class HybridList extends StatefulWidget {
  HybridList({Key key}) : super(key: key);

  _HybridListState createState() => _HybridListState();
}

class _HybridListState extends State<HybridList> with AutomaticKeepAliveClientMixin {
  @override
  get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint('initState');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
       child: Column(
         children: <Widget>[
           RaisedButton(
             child: Text('data'),
             color: Colors.orange,
             textColor: Colors.white,
             onPressed: () {},
           ),
           Expanded(
             child: ListView.builder(
               itemCount: 10,
               itemBuilder: (BuildContext context, int index) {
                 return ListTile(
                   leading: Icon(Icons.settings),
                   title: Text('列表项$index'),
                   trailing: Icon(Icons.arrow_forward_ios),
                 );
               }
             ),
           )
         ],
       ),
    );
  }
}