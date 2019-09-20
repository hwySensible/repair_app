import 'package:flutter/material.dart';
import 'package:repair_app/common/rating_bar.dart';

class RepairScore extends StatefulWidget  {

  final String title;
  RepairScore({
    this.title
  });
  @override
  _ratingBody createState() => new _ratingBody();
}

class _ratingBody extends State<RepairScore> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          // decoration: BoxDecoration(// 设置子控件背后装饰
          //   boxShadow: <BoxShadow>[
          //     BoxShadow(
          //       color: Colors.white,
          //       blurRadius: 2.0
          //     )
          //   ]
          // ),
          // color: Colors.blue[50],
          child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Text('张三（济南分公司）'),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text('匿名评价'),
                          )
                        ],
                      ),
                      Row(
                          children: <Widget>[
                            new RatingBar(
                              size: 30.0,
                              radiusRatio: 1.4,
                              onChange: (int value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
                            new Text("分数${_value}"),
                          ],
                        ),
                    ],
                  ),
        ),
      ),
    );
  }
}
