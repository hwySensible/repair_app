import 'package:flutter/material.dart';

import 'repair_score.dart';
import 'repair_send.dart';
class RepairList extends StatelessWidget {
  final String title;
  RepairList({
    this.title
  });
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () {},
            )
          ],
          elevation: 0.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.message), text: "未读工单",),
              Tab(icon: Icon(Icons.add_alarm),text: "在办工单",),
              Tab(icon: Icon(Icons.drafts),text: "完成工单",),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _noReader(context),
            _doReader(context),
            _doneReader(context),
          ],
        ),
      ),
    );
  }
  // 未读工单页面
  Widget _noReader (BuildContext ct) {
    return Container(
      child: ListView(
            children: <Widget>[
              Card(
                child: FlatButton(
                    padding: EdgeInsets.all(6.0),
                    onPressed: () {
                      Navigator.of(ct).push(
                        MaterialPageRoute(
                          builder: (ct) => RepairSend(title: '维修派单',)
                        )
                      );
                    },
                    splashColor: Colors.grey,
                    child: ListTile(
                      // leading: FlutterLogo(size: 72.0),
                      title: Text('济南东收费站 张一三'),
                      subtitle: Text(
                        '报修时间：2019-09-11 08:23        '
                        '故障描述：发卡机设备损坏！！'
                      ),
                      trailing: Chip(
                        backgroundColor: Colors.red,
                        label: Text('未读'),
                      ),
                      isThreeLine: true,
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                  ),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                  ),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                  ),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                  ),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                  ),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                  ),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
            ],
          ),
    );
  }
  // 正在维修页面
  Widget _doReader (BuildContext ct) {
    return Container(
      child: ListView(
            children: <Widget>[
              Card(
                child: FlatButton(
                    padding: EdgeInsets.all(6.0),
                    onPressed: () {
                      Navigator.of(ct).push(
                        MaterialPageRoute(
                          builder: (ct) => RepairSend(title: '维修派单',)
                        )
                      );
                    },
                    splashColor: Colors.grey,
                    child: ListTile(
                      // leading: FlutterLogo(size: 72.0),
                      title: Text('济南东收费站 张一三'),
                      subtitle: Text(
                        '报修时间：2019-09-11 08:23        '
                        '故障描述：发卡机设备损坏！！'
                      ),
                      trailing: Chip(
                        backgroundColor: Colors.yellow,
                        label: Text('在办'),
                      ),
                      isThreeLine: true,
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                  ),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                  ),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                  ),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                  ),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                  ),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                  ),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
            ],
          ),
    );
  }
  // 完成工单页面
  Widget _doneReader (BuildContext ct) {
    return Container(
      child: ListView(
            children: <Widget>[
              Card(
                child: FlatButton(
                    padding: EdgeInsets.all(6.0),
                    onPressed: () {
                      Navigator.of(ct).push(
                        MaterialPageRoute(
                          builder: (ct) => RepairScore(title: '评价',)
                        )
                      );
                    },
                    splashColor: Colors.grey,
                    child: ListTile(
                      // leading: FlutterLogo(size: 72.0),
                      title: Text('济南东收费站 张一三'),
                      subtitle: Text(
                        '报修时间：2019-09-11 08:23        '
                        '故障描述：发卡机设备损坏！！'
                      ),
                      trailing: Chip(
                        backgroundColor: Colors.greenAccent,
                        label: Text('完成'),
                      ),
                      isThreeLine: true,
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                  ),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                  ),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                  ),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                  ),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                  ),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                  ),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
            ],
          ),
    );
  }

}