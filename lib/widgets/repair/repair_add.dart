import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RepairAdd extends StatelessWidget {

  final String title;

  RepairAdd({
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      body: repairBody()
    );
  }
}

class repairBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
      padding: const EdgeInsets.all(8.0),
      children: <Widget>[
        Container(
          child: Text(
            '基本信息',
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.white,
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    // icon: Icon(Icons.person),
                    hintText: '请输入故障名称',
                    labelText: '名称'
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    // icon: Icon(Icons.person),
                    hintText: '济南东收费站',
                    labelText: '位置'
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    // icon: Icon(Icons.person),
                    hintText: '请选择类型',
                    labelText: '类型'
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Text(
            '故障描述',
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.white,
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    // icon: Icon(Icons.person),
                    hintText: '请输入故障描述信息',
                    labelText: '故障描述'
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.white,
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    // icon: Icon(Icons.person),
                    hintText: '上传图片',
                    labelText: '上传图片'
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.white,
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    // icon: Icon(Icons.person),
                    hintText: '上传语音',
                    labelText: '上传语音'
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.white,
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    // icon: Icon(Icons.person),
                    hintText: '上传视频',
                    labelText: '上传视频'
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  child: Text('提交'),
                  onPressed: () {},
                  splashColor: Colors.blueGrey,
                  textColor: Colors.white,
                  color: Colors.blue,
                  padding: EdgeInsets.all(8.0),
                ),
              )
            ],
          ),
        )
      ],
    ),
    );
  }
}