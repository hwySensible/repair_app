import 'package:repair_app/widgets/repair/repair_add.dart';
import '../index.dart';
import 'package:flukit/flukit.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    final Widget _floatingActionButton = FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => RepairAdd(title: '故障报修'),
          )
        );
      },
      child: Icon(Icons.add),
      elevation: 0.0,
      backgroundColor: Colors.lightBlue,
      // shape: BeveledRectangleBorder(
      //   borderRadius: BorderRadius.circular(30.0)
      // ),
    );

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(GmLocalizations.of(context).home),
      // ),
      // body: _buildBody(), // 构建主页面
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: _userInfoCard(),
            ),
            Expanded(
              flex: 2,
              child: _userInfoList(),
            )
          ],
        ),
      ),
      drawer: MyDrawer(), //抽屉菜单
      // 底部按钮部分开始
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
   // 主页面头部分
  Widget _userInfoCard() {
    return new Container(
      color: Colors.blue,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Scaffold(
          //   body: Center(
          //     child: Text('Press the extended button below!'),
          //   ),
          //   floatingActionButton: _floatingActionButtonExtended,
            
          // )
          new Container(
            // margin: const EdgeInsets.all(10.0),
            // decoration: new BoxDecoration(
            //     color: GlobalConfig.dark == true ? Colors.white10 : new Color(0xFFF5F5F5),
            //     borderRadius: new BorderRadius.all(new Radius.circular(6.0))
            // ),
            child: new FlatButton(
                onPressed: (){},
                child: new Container(
                  child: new ListTile(
                    leading: new Container(
                      child: new CircleAvatar(
                          backgroundImage: new NetworkImage("https://pic1.zhimg.com/v2-ec7ed574da66e1b495fcad2cc3d71cb9_xl.jpg"),
                          radius: 20.0
                      ),
                    ),
                    title: new Container(
                      margin: const EdgeInsets.only(bottom: 2.0),
                      child: new Text("learner"),
                    ),
                    subtitle: new Container(
                      margin: const EdgeInsets.only(top: 2.0),
                      child: new Text("济南分公司"),
                    ),
                  ),
                )
            ),
          ),
          // floatactionbutton
        ],
      ),
    );
  }

  // 主页面list部分
  Widget _userInfoList() {
    List<Icon> iconItems = <Icon>[
      new Icon(Icons.account_circle,color: Colors.blue), new Icon(Icons.check_circle_outline,color: Colors.blue),
      new Icon(Icons.cloud_circle,color: Colors.blue), new Icon(Icons.pause_circle_filled,color: Colors.blue),
      new Icon(Icons.person_pin_circle,color: Colors.blue), 
    ];
    final List<String> entries = <String>['个人中心', '知识库', '未读工单', '维修记录', '数据统计'];
    final List<int> colorCodes = <int>[50, 50, 50, 50, 50];
    const size = FontWeight.w500; // 定义一个字体类型
    return new Container(
      child: ListView.separated(
      padding: const EdgeInsets.all(8.0),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 65,
          color: Colors.amber[colorCodes[index]],
          child: Center(
            child: FlatButton(
              padding: EdgeInsets.all(6.0),
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) => RepairList(title: '故障信息列表'),
                //   )
                // );
              },
              splashColor: Colors.white70,
              child: ListTile(
              title: Text('${entries[index]}', style: TextStyle(fontWeight: size),),
              leading: iconItems[index],
              trailing: Container(
                child:
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: index == 2 ? Colors.red.shade500 : Colors.amber[50],
                    child: index == 2 ? Text('2') : Text(''),
                  ),
                  label: Icon(Icons.keyboard_arrow_right),
                  backgroundColor: Colors.amber[50],
                )
              ),
              // onTap: () { // 点击跳转
              //   Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (BuildContext context) => RepairList(title: '故障信息列表'),
              //     )
              //   );
              // },
            )
            )
            
          )
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider()
    ),
    );
  }
  
  Widget _buildBody() {
    UserModel userModel = Provider.of<UserModel>(context);
    if (!userModel.isLogin) {
      //用户未登录，显示登录按钮
      return Center(
        child: RaisedButton(
          child: Text(GmLocalizations.of(context).login),
          onPressed: () => Navigator.of(context).pushNamed("login"),
        ),
      );
    } else {
      //已登录，则显示用户信息、项目列表
      return InfiniteListView<Repo>(
        onRetrieveData: (int page, List<Repo> items, bool refresh) async {
          var data = await Git(context).getRepos(
            refresh: refresh,
            queryParameters: {
              'page': page,
              'page_size': 20,
            },
          );
          //把请求到的新数据添加到items中
          items.addAll(data);
          return data.length > 0 && data.length % 20 == 0;
        },
        itemBuilder: (List list, int index, BuildContext ctx) {
          // 项目信息列表项
          return RepoItem(list[index]);
        },
      );
    }
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // DrawerHeader consumes top MediaQuery padding.
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(), //构建抽屉菜单头部
            Expanded(child: _buildMenus()), //构建功能菜单
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Consumer<UserModel>(
      builder: (BuildContext context, UserModel value, Widget child) {
        return GestureDetector(
          child: Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(top: 40, bottom: 20),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipOval(
                    // 如果已登录，则显示用户头像；若未登录，则显示默认头像
                    child: value.isLogin
                        ? gmAvatar(value.user.avatar_url, width: 80)
                        : Image.asset(
                            "imgs/avatar-default.png",
                            width: 80,
                          ),
                  ),
                ),
                Text(
                  value.isLogin
                      ? value.user.login
                      : GmLocalizations.of(context).login,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            if (!value.isLogin) Navigator.of(context).pushNamed("login");
          },
        );
      },
    );
  }

  // 构建菜单项
  Widget _buildMenus() {
    return Consumer<UserModel>(
      builder: (BuildContext context, UserModel userModel, Widget child) {
        var gm = GmLocalizations.of(context);
        return ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: Text(gm.theme),
              onTap: () => Navigator.pushNamed(context, "themes"),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(gm.language),
              onTap: () => Navigator.pushNamed(context, "language"),
            ),
            if(userModel.isLogin) ListTile(
              leading: const Icon(Icons.power_settings_new),
              title: Text(gm.logout),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) {
                    //退出账号前先弹二次确认窗
                    return AlertDialog(
                      content: Text(gm.logoutTip),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(gm.cancel),
                          onPressed: () => Navigator.pop(context),
                        ),
                        FlatButton(
                          child: Text(gm.yes),
                          onPressed: () {
                            //该赋值语句会触发MaterialApp rebuild
                            userModel.user = null;
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
