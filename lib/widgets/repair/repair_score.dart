import 'package:flutter/material.dart';
import 'package:repair_app/common/rating_bar.dart';

import '../../index.dart';

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
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            margin: EdgeInsets.all(8.0),
            // color: Colors.amber[600],
            // width: 100.0,
            // height: 100.0,
              // color: Colors.blue[50],
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    // padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text('张三（济南分公司）', style: TextStyle(fontSize: 20.0),),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: <Widget>[
                              Checkbox(
                                // tristate: false,
                                value: isChecked,
                                activeColor: Provider.of<ThemeModel>(context).theme,
                                onChanged: (bool bo){
                                  setState(() {
                                    this.isChecked = !this.isChecked;
                                  });
                                },
                              ),
                              Text('匿名评价', style: TextStyle(color: Colors.grey[500]),),
                            ],
                          ),
                        )
                      ],
                  ),
                  ),
                  Container(
                    height: 20.0,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                  ),
                  Container(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                    height: 300.0,
                    color: Colors.grey[300],
                    child: new Stack(
                      children: <Widget>[
                        TextField(
                          maxLines: 10,
                          maxLength: 200,
                          decoration: InputDecoration(
                            labelText: '可以在这里写下您的评价',
                            border: InputBorder.none,
                          ),
                        ),
                        Positioned(
                          left: 8.0,
                          bottom: 8.0,
                          child: IconButton(
                            iconSize: 50.0,
                            icon: Icon(Icons.add_photo_alternate),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    
                  ),
                ],
              ),
            ),
        )
      ),
      bottomNavigationBar: BottomAppBar(
        // notchMargin: 6,
        color: Colors.grey,
        // shape: CircularNotchedRectangle(),
        child: Container(
          child: FlatButton(
            child: Text('确认提交'),
            onPressed: () {},
            textColor: Colors.white,
            splashColor: Colors.blueGrey,
            color: Provider.of<ThemeModel>(context).theme,
            padding: EdgeInsets.all(8.0),
        ),
        )
      ),
    );
  }
}
