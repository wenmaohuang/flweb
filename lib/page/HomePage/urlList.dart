import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Map urlListData = {
  'uniapp': "https://uniapp.dcloud.io/quickstart",
  'dart': "https://dart.cn/guides/language/language-tour",
  'flutterLearn': "https://learnku.com/blog/ZeLingNing",
  'bilibiliFlutter': "https://www.bilibili.com/video/BV1S4411E7LY?p=4",
  'pub': "https://pub.flutter-io.cn",
  'ant': "https://ant.design/components/divider/",
  'bilibiliGulp': "https://www.bilibili.com/video/BV1D4411P7tx?p=3",
  'github': "https://github.com/",
  'mongoosejs': "https://mongoosejs.com/docs/guide.html",
  'npmjs': "https://www.npmjs.com/",
  'element': "https://element.eleme.cn/#/zh-CN/component/installation",
  'vuejs': "https://vuejs.org/",
  'layui': "https://www.layui.com/",
  'qqMusic': "https://y.qq.com/portal/player.html",
  'aliyun': "https://www.aliyun.com/",
  'iconfont':
      "https://www.iconfont.cn/manage/index?manage_type=myprojects&projectId=1811983",
  'fanyi': "https://fanyi.baidu.com/?aldtype=16047#auto/zh",
  'photoGirls': "https://www.umei.cc/bizhitupian/meinvbizhi/",
  'yinshi':
      "https://www.shiguangkey.com/video/1346?videoId=141606&classId=9262&playback=1",
  'afei': "https://www.shiguangkey.com/video/5404?classId=13017&videoId=221997",
  'remi':
      "https://www.shiguangkey.com/video/903?videoId=242629&classId=17830&playback=1",
  'zhuimeng':
      "https://www.shiguangkey.com/video/1561?videoId=53934&classId=4298&playback=1",
  'haiwen':
      "https://www.shiguangkey.com/video/1561?videoId=86919&classId=6240&playback=1",
  'wanzhang1':
      "https://www.shiguangkey.com/video/5404?videoId=125677&classId=8638&playback=1",
  'wanZhang2':
      "https://www.shiguangkey.com/video/903?videoId=191211&classId=12327&playback=1",
  'cctv': "http://tv.cctv.com/live/",
  'yanshisan': "https://www.yanshisan.cn/Blog/Article",
  'afeifeifei':
      "https://github.com/afeifeifei/front-end-interview-handbook/blob/master/Translations/Chinese/README.md",
  'lagou': "https://www.lagou.com/resume/myresume.html",
  "51job": "https://i.51job.com/userset/my_51job.php?lang=c",
  'zhaopin': "https://i.zhaopin.com/",
  "58tongcheng":
      "https://my.58.com/pro/myjob/index/?PGTID=0d000000-0000-05c4-710e-6428d7138f3a&ClickID=1",
  'zhipin': "https://www.zhipin.com/web/geek/recommend?ka=header-personal",
  'weixin': "https://developers.weixin.qq.com/miniprogram/en/dev/framework/",
  'weixinAdmin':
      "https://mp.weixin.qq.com/wxamp/wacodepage/getcodepage?token=174094833&lang=zh_CN",
  'bilibiliWeixin': "https://www.bilibili.com/video/BV1nE41117BQ?p=9",
  'movie': "http://27k.cc/?m=vod-play-id-37805-src-1-num-1.html",
  'flutter': "https://flutter.dev/docs/development/tools/android-studio",
  'typescript': "https://www.typescriptlang.org/docs/handbook/gulp.html",
  'node': "https://nodejs.org/dist/latest-v14.x/docs/api/",
  'webpack':
      "https://webpack.js.org/concepts/entry-points/#single-entry-shorthand-syntax",
  'react': "https://reactjs.org/docs/getting-started.html",
  'angular': "https://angular.cn/guide/architecture-modules",
  'ngblog': "http://www.fyyd.vip:3003",
  'nginx': "http://nginx.org/en/docs/",
  'centos': "https://www.linuxidc.com/Linux/2018-06/152959.htm",
  'express': "https://www.expressjs.com.cn/5x/api.html",
  'blogadmin': "http://www.fyyd.vip:3002/",
  'reblog': "http://www.fyyd.vip:3001/",
  'mysql': "https://dev.mysql.com/doc/refman/8.0/en/connection-options.html",
  'apache': "http://httpd.apache.org/docs/2.4/",
  'gulpjs': "https://gulpjs.com/docs/en/api/registry",
  'babel': "https://babeljs.io/docs/en/",
  'less': "http://lesscss.org/",
  'meinv': "https://www.tupianzj.com/meinv/mm/",
  'mdn': "https://developer.mozilla.org/en-US/docs/Web/JavaScript",
  'threejs': "http://www.webgl3d.cn/",
  'bootCDN': "https://www.bootcdn.cn/",
  'bilibiliAngualar':
      "https://www.bilibili.com/video/BV1bt411e71b?from=search&seid=15562787847422779010",
  'angularcn': "https://angular.cn/tutorial/toh-pt3",
  'angulartantui': "https://ng.ant.design/components/collapse/en#ng-content",
};

Map urlListDataSort = new Map();
List newKeys = urlListData.keys.toList();
class UrlList extends StatefulWidget {
  @override

  _UrlListState createState() => _UrlListState();
}
class _UrlListState extends State<UrlList> {
  List<Widget> urlTitles = []; //先建一个数组用于存放循环生成的widget
  Map newUrlListData = new Map();
  FocusNode _focusNode2 = FocusNode();
  final myController2 = TextEditingController();
  Map newUrlListDataState;
  @override
  void initState() {
    _focusNode2.addListener(() {
      if (_focusNode2.hasFocus) {
        print('得到焦点');
        print(myController2);
      } else {
        print('失去焦点');
        // var url = 'http://www.baidu.com/s?wd=${myController.text}';
        // launch(url);
        print(myController2);
      }
    });

    List newKeys = urlListData.keys.toList();
    newKeys.sort((a, b) {
      List<int> al = a.codeUnits;
      List<int> bl = b.codeUnits;
      for (int i = 0; i < al.length; i++) {
        if (bl.length <= i) return 1;
        if (al[i] > bl[i]) {
          return 1;
        } else if (al[i] < bl[i]) return -1;
      }
      return 0;
    });
    // print('${newKeys}sw');
    newKeys.forEach((element) {
      urlListDataSort[element] = urlListData[element];
    });
    print('${urlListDataSort}sw');
    setState(() {
    newUrlListDataState = {};
    });
  }

  @override
  void dispose() {
    //页面销毁时
    myController2.dispose();

    super.dispose();
  }
  Widget _buildUrlInput() {
    List<Widget> urlTitlesState = []; //先建一个数组用于存放循环生成的widget
    return Column(
      children: [
        Container(
          width: 350,
          height: 40.0,
          padding: new EdgeInsets.only(left: 10),
          decoration: new BoxDecoration(
            color: Colors.blue[200],
            borderRadius: new BorderRadius.circular(25.0),
          ),
          child: TextFormField(
            style: new TextStyle(color: Colors.white70, fontSize: 14),
            //输入文字颜色和大小
            onChanged: (String val) {
              List<String> newKeysResult = [];
              // print('${urlListData.keys.toList().length}za');
              List urlListDataKeys = urlListData.keys.toList();
              urlListDataKeys.forEach((element) {
                RegExp reg = new RegExp(r"^" + myController2.text + ".+");
                String regResult = reg.stringMatch(element);
                if (regResult != null) {
                  newUrlListData[regResult]=urlListData[regResult];
                  // print('${newUrlListData}FFF');
                }
                if(myController2.text == ''){
                  newUrlListData = {};
                }
              });
              // print('${newUrlListData}ccc');
              if (myController2.text != ''){
                  setState(() {
                    newUrlListDataState = newUrlListData;
                  });
              }else{
                  setState(() {
                    newUrlListDataState = urlListDataSort;
                  });

              }
            },
            controller: myController2,
            focusNode: _focusNode2,
            decoration: InputDecoration(
              hintText: '请输入关键字搜索',
              //文字提示
              hintStyle: new TextStyle(color: Colors.white70),
              //提示文字颜色
              icon: Icon(Icons.search, color: Colors.white70),
              //图标
              border: InputBorder.none, //去掉下划线
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUrlList() {
    List<Widget> urlTitles = []; //先建一个数组用于存放循环生成的widget
    for (var item in newUrlListDataState.keys) {
      urlTitles.add(new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton(
              onPressed: () {
                // var url = 'http://www.baidu.com/s?wd=${item}';
                var url = newUrlListDataState[item];

                launch(url);
              },
              // child: Text(item),
              child: Text('${item}'),
            ),
            // new Text(item)
          ]));
    }
    // print('${urlTitles}aaa');

    return Column(
      children: [
        Container(
          //1 注意：父容器的宽高是200 减去pading后是180
          padding: EdgeInsets.all(10),
          // color: Colors.green,
          // width: 200,
          height: 200,
          child: new OverflowBox(
              maxHeight: 200, //2 不能小于父容器的高度180
              child: SingleChildScrollView(
                child: Column(children: urlTitles),
              )),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),

      child: Column(
        children: [_buildUrlInput(), _buildUrlList()],
      ),
    );
  }
}
