import 'package:flutter/material.dart';



//选择类型页面
class SelectionRoute extends StatelessWidget{
final String title;

  SelectionRoute({
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(title),
      //   elevation: 0.0,
      // ),
      body: SelectionBody()
    );
  }
}

class SelectionBody extends StatefulWidget {
    _SelectionBodyState createState() => _SelectionBodyState() ;
}

class _SelectionBodyState extends State<SelectionBody> with SingleTickerProviderStateMixin{
  //定义一个Controller
  TabController _tabController;
  //TabController _csTabController;
  List tabs = ["高速业务","城市业务"];
  //一级分类集合
  List gsLeft = [
    {"first": "收费系统","second":["视频控制平台"]},
    {"first": "监控系统","second":["串口服务器"]},
    {"first": "通信系统","second":["SDH传输设备"]},
    {"first": "隧道系统","second":["电光标志"]},
    {"first": "供配电系统","second":["UPS"]}
    ];
  //保存二级分类集合
  List gsRight = List();
  List csRight = List();
  //保存二级标签选中的内容
 //List selectRight = List();
  int index;//高速业务一级分类下标
  int csIndex;//城市业务
  int _valueChoice;//记录高速业务右侧按钮是否被选中
  int _csValueChioce;//记录城市业务右侧按钮是否被选中

  //城市业务一级分类集合
  List csLeft = [
    {"first": "智能楼宇","second":["弱电系统"]},
    {"first": "智慧停车","second":["硬件问题"]},
    {"first": "机房数据","second":["网络设备"]},
    {"first": "软件系统运维","second":["系统bug"]}
    ];
  @override
  void initState() {
    super.initState();
    //创建Controller建通tab菜单切换
    _tabController = TabController(length: tabs.length,vsync:this);//高速业务
    //分别初始化一级分类下标
    index = 0;
    csIndex = 0;
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(//生成tab菜单
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text:e)).toList()
        ),
      ),
      //drawer: new MyDrawer(),
        body: TabBarView(
          controller: _tabController,
          children: tabs.map((e) {//创建两个tab项
            return Container(
              alignment: Alignment.center,
              child: Column(
               children: <Widget>[
                  //getMenue(e.toString())
                  e.toString() == "高速业务" ?  getGsWidget(e) : getCsWidget(e)
               ],
              ),
            );
          }).toList(),
        )
    );
  }
  //高速业务菜单
  Widget getGsWidget(e) { 
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        //左边一个listView
        new Expanded(
          flex: 2,
          child: Container(
            color: Colors.white10,
            child: new ListView.builder(
              shrinkWrap: true,
              itemCount: gsLeft.length,
             //itemCount: e == "高速业务" ? gsLeft.length : csLeft.length,//判断是高速业务还是城市业务
              // itemBuilder: (BuildContext context,int position){
              //   return getRow(position,e.toString());
              // },
              itemBuilder: (BuildContext context,int position){
                 return getGsRow(position,e.toString());
              },
            ),
          ),
        ),
        //右边一个listView
        new Expanded(
          flex: 5,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                //color: Colors.grey,
               child: getGsChip(index,e.toString()),//传入一级分类下标
              )
            ],
          ),
        )
      ],
      
    );
  }
//左侧item
  Widget getGsRow(int i,String e) {
    return new GestureDetector(
      child: new Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
        //给选中的一级标签改背景色
        color: index == i ? Colors.grey[200] : Colors.white,
        //child: new Text( e == "高速业务" ? gsLeft[i]["first"] : csLeft[i]["first"],//判断城市业务/高速业务
        child: new Text(gsLeft[i]["first"],
        style: TextStyle(
          fontSize: 14,
          //给选中的一级标签字改颜色
          color: index == i ? Colors.blue : Colors.black
        )),
      ),
      onTap: (){
        setState(() {
          index = i;//记录选中的下标
          _valueChoice = null;//每换一次左侧菜单选项，重新初始化右侧选中菜单
        });
      },
    );
  }
  //右侧item
  Widget getGsChip(int i, String e){
    //更新对应下标数据
    _updategsRight(i,e);
    return Wrap(
      spacing: 15.0,//两个Widget之间横向的间隔
      direction: Axis.horizontal,//方向
      alignment: WrapAlignment.start,//内容排列方式
      children: List<Widget>.generate(gsRight.length, 
      (int item) {
        return ChoiceChip(
          //标签文字
          label: Text(gsRight[item],
            //style: TextStyle(fontSize: 16),
            style: TextStyle(
            fontSize: 14,  
            color:  _valueChoice == item ?  Colors.white : Colors.black54 //选中字体的颜色
            )            
          ),
          backgroundColor: Colors.grey[200],
          selectedColor: Colors.blue[300],//选中的颜色
          selectedShadowColor: Colors.grey,
          pressElevation: 30.0,//选中时的阴影
          onSelected: (bool selected) {
            setState(() {
             _valueChoice = selected ? item : null;
            });
            //print(gsRight[index]);
          },
          selected: _valueChoice == item
        );
      }).toList()
    );
  }
  //更新数据
  List _updategsRight(int i,String e) {
    setState(() {
    //  if(gsLeft.length != 0 && e == "高速业务"){
    //    menueRight = gsLeft[i]["second"];
    //  } else if(csLeft.length !=0 && e == "城市业务"){
    //    menueRight = csLeft[i]["second"];
    //  }
      gsRight = gsLeft[i]["second"] ;
    });
    return gsRight;
  }

  //城市业务菜单栏
 Widget getCsWidget(e) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        //左边一个listView
        new Expanded(
          flex: 2,
          child: Container(
            color: Colors.white10,
            child: new ListView.builder(
              shrinkWrap: true,
              itemCount: csLeft.length,
             //itemCount: e == "高速业务" ? gsLeft.length : csLeft.length,//判断是高速业务还是城市业务
              // itemBuilder: (BuildContext context,int position){
              //   return getRow(position,e.toString());
              // },
              itemBuilder: (BuildContext context,int position){
                return getCsRow(position,e.toString());
              },
            ),
          ),
        ),
        //右边一个listView
        new Expanded(
          flex: 5,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                //color: Colors.grey,
               // child: getChip(index,e.toString()),//传入一级分类下标
               child:  getCsChip(csIndex,e.toString()),//传入一级分类下标
              )
            ],
          ),
        )
      ],
      
    );
  }



  //左侧item
  Widget getCsRow(int i,String e) {
    return new GestureDetector(
      child: new Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
        //给选中的一级标签改背景色
        color: csIndex == i ? Colors.grey[200] : Colors.white,
        //child: new Text( e == "高速业务" ? gsLeft[i]["first"] : csLeft[i]["first"],//判断城市业务/高速业务
        child: new Text(csLeft[i]["first"],
        style: TextStyle(
          fontSize: 14,
          //给选中的一级标签字改颜色
          color: csIndex == i ? Colors.blue : Colors.black
        )),
      ),
      onTap: (){
        setState(() {
          csIndex = i;//记录选中的下标
          _csValueChioce = null;//每换一次左侧菜单选项，重新初始化右侧选中菜单
        });
      },
    );
  }
  //右侧item
  Widget getCsChip(int i, String e){
    //更新对应下标数据
    _updatecsRight(i,e);
    return Wrap(
      spacing: 15.0,//两个Widget之间横向的间隔
      direction: Axis.horizontal,//方向
      alignment: WrapAlignment.start,//内容排列方式
      children: List<Widget>.generate(csRight.length, 
      (int item) {
        return ChoiceChip(
          //标签文字
          label: Text(csRight[item],
            //style: TextStyle(fontSize: 16),
            style: TextStyle(
            fontSize: 14,  
            color:  _csValueChioce == item ?  Colors.white : Colors.black54 //选中字体的颜色
            )            
          ),
          backgroundColor: Colors.grey[200],
          selectedColor: Colors.blue[300],//选中的颜色
          selectedShadowColor: Colors.grey,
          pressElevation: 30.0,//选中时的阴影
          onSelected: (bool selected) {
            setState(() {
             _csValueChioce = selected ? item : null;
            });
            //print(gsRight[index]);
          },
          selected: _csValueChioce == item
        );
      }).toList()
    );
  }
  //更新数据
  List _updatecsRight(int i,String e) {
    setState(() {
    //  if(gsLeft.length != 0 && e == "高速业务"){
    //    menueRight = gsLeft[i]["second"];
    //  } else if(csLeft.length !=0 && e == "城市业务"){
    //    menueRight = csLeft[i]["second"];
    //  }
      csRight = csLeft[i]["second"] ;
    });
    return csRight;
  }
}
