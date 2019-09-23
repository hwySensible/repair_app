import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';//导折叠面板的包
//import 'package:repair_app/widgets/repair/repair_selection.dart';//选择类型页面
import 'package:image_picker/image_picker.dart';//从相册里面选择图片或者拍照获取照片
import 'package:flutter_drag_scale/flutter_drag_scale.dart';
import 'package:http/http.dart' as http;
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
      body: RepairBody()
    );
  }
}

class RepairBody extends StatefulWidget {
  _RepairBodyState createState() => _RepairBodyState();
}

class _RepairBodyState extends State<RepairBody> {
    bool _isExpanded = false;//折叠面板闭合控制 默认全部关闭
    //表单验证
    GlobalKey globalKey = new GlobalKey<FormState>();

  


    List _imageList = []; //图片列表
    int _photoIndex = 0; //选择拍照还是相册的索引

    List _actionSheet = [
     {"name": "拍照", "icon": Icon(Icons.camera_alt)},
     {"name": "相册", "icon": Icon(Icons.photo_library)}
    ];
    
  

    //拍照或者相册选取图片，只能单选
    Future _getImage() async {
      Navigator.of(context).pop();
      var image = await ImagePicker.pickImage(
        source: _photoIndex == 0 ? ImageSource.camera : ImageSource.gallery
      );
      //选择图片或拍照将图片存入列表
      if(image != null){
        setState(() {
         _imageList.add(image); 
        });
      }
    }

    //获取sheet选择
    Future _getActionSheet() async{
      await showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _actionSheet.length,
              itemExtent: 50.0,
              itemBuilder: (innerCtx,i){
                return ListTile(
                  title: Text(_actionSheet[i]["name"]),
                  leading: _actionSheet[i]["icon"],
                  onTap: () {
                    setState(() {
                     _photoIndex = i; 
                    });
                    _getImage();
                  },
                );
              },
            ),
          );
        }
      );
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
      padding: const EdgeInsets.all(8.0),
      children: <Widget>[
        Container(
          /*child: Text(
            '基本信息',
            textAlign: TextAlign.start,
          ),*/
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.white,
          child: Form(
            key: globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /*TextFormField(
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
                ),*/
                //基本信息
                Card(
                  child: ListTile(
                    leading: ClipOval(
                      child: Image.asset("imgs/logo_dark.png",width: 45),
                    ),
                    title: Text('济南东收费站  张三',
                    style: TextStyle(
                      fontSize: 14.0,
                    )),
                    subtitle: Text(
                      '电话：13678826101',
                      style: TextStyle(
                        fontSize: 12.0
                      ),
                    ),
                    trailing: IconButton(
                      icon:Icon(Icons.phone,color: Colors.blue,size: 30),
                      onPressed: (){},
                      ),
                    isThreeLine: true,
                    //selected: true,
                  ),
                ),

                 //选择类型
                /*RaisedButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("类型选择"),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: (){
                    //导航到新路由选择类型
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) {
                      return SelectionRoute();
                    }));
                  },
                ),*/

                /*TextFormField(
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
                ),*/

              Container(
                child: Text(
                  '故障描述',
                  textAlign: TextAlign.start,
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.all(10.0),
              //   color: Colors.white,
              //   child: Form(
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          // icon: Icon(Icons.person),
                          hintText: '请输入故障描述信息',
                          labelText: '*故障描述'
                        ),
                        validator: (value) {
                          return value.trim().length > 0 ? null : "*故障描述不能为空";
                        },
                      ),
              //       ],
              //     ),
              //   ),
              // ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 15, 0, 20),  
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,                                                   
                  children: <Widget>[
                      //展示选择的图片
                  _imageList.isNotEmpty ? Wrap(
                      spacing: 25.0,
                      children: _getImageList()
                    ) : Container(
                      child: new Text("上传图片"),
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
                    ),
                    FloatingActionButton(
                      child: Icon(Icons.add_a_photo),
                      tooltip: "上传图片",
                          onPressed: () => _getActionSheet(),                                      
                          foregroundColor: Colors.white,
                    ),                           
                  ],
                ),
                ),
              ],
            ),
          ),
        ),
        
        //折叠面板
        /*ExpansionPanelList(
           children: <ExpansionPanel>[
             ExpansionPanel(
               headerBuilder:(context,isExpanded){
                 return ListTile(
                   //title: Text("隐藏内容"),
                 );
               },
               body: Padding(
                 padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                 child: ListBody(
                   children: <Widget>[
                     Card(                                      
                      child: Container(
                        margin: EdgeInsets.fromLTRB(15, 15, 0, 20),  
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,                                                   
                          children: <Widget>[
                             //展示选择的图片
                          _imageList.isNotEmpty ? Wrap(
                              spacing: 25.0,
                              children: _getImageList()
                            ) : Container(
                              child: new Text("暂无内容"),
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
                            ),
                            FloatingActionButton(
                              child: Icon(Icons.add_a_photo),
                              tooltip: "上传图片",
                                  onPressed: () => _getActionSheet(),                                      
                                  foregroundColor: Colors.white,
                            ),                           
                          ],
                        ),
                      ),                       
                     ),
                      Card(
                       margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                       child: Container(
                        margin: const EdgeInsets.all(10.0),
                        color: Colors.white,
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextFormField(
                                decoration: InputDecoration(
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
                     ),
                      Card(
                       margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                       child: Container(
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
                     ),
                   ],
                 ),
               ),
               isExpanded: _isExpanded,
               canTapOnHeader: true, 
             )
           ], 
           expansionCallback:(panelIndex, isExpanded){
              setState(() {
                _isExpanded = !isExpanded;
              });
           },
           animationDuration: kThemeAnimationDuration,
        ),*/
        /*Container(
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
        ),*/
        Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  child: Text('提交'),
                  onPressed: () {
                    //  if((globalKey.currentState as FormState).validate()){
                    //    print("验证通过");
                    //    //提交描述、（如果有位置信息、选择了类型提交类型）、登录人id、已报修（status=0）、时间
                    //     await http.post
                    //  }
                  },
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
  //刻画图片列表
    List<Widget> _getImageList() {
      return _imageList.map((img){
        return Container(
          child: InkWell(
            child: Hero(
              tag: img.toString(),//唯一标记，前后两个路由页Hero的tag必须相同
              child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
                child:Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                      child: Stack(                    
                      children: <Widget>[
                        Image.file(
                          img,
                          fit: BoxFit.cover,
                          width: 150.0,
                          height: 120.0
                        ),                     
                        Positioned(
                          right: 5.0,
                          top: 5.0,
                          child: GestureDetector(
                            child: ClipOval(
                              child: Container(
                                width: 18.0,
                                height: 18.0,
                                color: Colors.lightBlue,
                                child: Icon(
                                  Icons.close,
                                  color:Colors.white,
                                  size: 15.0
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                              _imageList.remove(img); 
                              });                    
                            },
                          ),
                        )
                      ]                
                )            
              ),
            ),
            ),
            onTap: (){
              //打开图片展示原图路由
              Navigator.push(context, PageRouteBuilder(
                pageBuilder: (BuildContext context,Animation animation,Animation secondaryAnimation) {
                  return new FadeTransition(
                    opacity: animation,
                    child: Scaffold(
                       appBar: AppBar(
                      //   title: Text("原图"),
                       ),
                      body: showMaxImg(img),
                    ),
                  );
                }
              ));
            }
          ),         
        ); 
      }).toList();
    }
}


//原图路由
Widget showMaxImg(img){
    return Center(
      child: DragScaleContainer(
        doubleTapStillScale: true,
        child: Hero(
        tag: img.toString(),
        child:  Image.file(img),
      ),
      )
      
    );
}