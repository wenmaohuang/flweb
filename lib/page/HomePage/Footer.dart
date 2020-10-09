import 'package:flutter/material.dart';
import 'package:flweb/page/BlogPage/BlogPage.dart';
import 'package:flweb/routes/application.dart';
import 'package:flweb/routes/util.dart';
import 'package:flweb/routes/blog/blog.dart';

// class Footer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.black87,
//         height: 150,
//         padding: new EdgeInsets.all(20),
//
//         child: Row(
//           mainAxisAlignment:MainAxisAlignment.spaceAround,
//
//           children: [
//
//             Column(
//               mainAxisAlignment:MainAxisAlignment.spaceAround,
//
//               children: [
//                 Text(
//                   '风移影动',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//
//                 Text('自由自在的流浪',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),),
//                 Text('about me',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 )
//               ],
//             ),
//             Column(
//               mainAxisAlignment:MainAxisAlignment.spaceAround,
//
//               children: [
//                 Text('相关链接',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//
//                 InkWell(
//                     onTap: (){
//                       //通过Application的路由就可以跳转页面啦
//                       Application.router.navigateTo(context, "/blog");
//                     },
//                     child: Text('博客')
//                 ),
//                 RaisedButton(
//                     child:Text('博客',
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//
//                     onPressed:() {
//                       // Navigator.of(context).push(
//                       //   MaterialPageRoute(builder: (context)=>BlogPage())
//                       // );
//
//                       Application.router.navigateTo(context, "/blog");
//
//                       // Navigator.pushNamed(context, '/blog');
//                       // Navigator.of(context).pushReplacementNamed('/blog');
//                       // Navigator.popAndPushNamed(context, '/blog');
//                 }),
//                 Text('日记',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),)
//               ],
//             ),
//             Column(
//               mainAxisAlignment:MainAxisAlignment.spaceAround,
//
//               children: [
//                 Text('联系我',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text('地址:广州番禺小龙村',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text('QQ:648371113',
//
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),),
//                 Text('邮箱:648371113@qq.com',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 )
//               ],
//             )
//           ],
//         )
//
//
//     )
//     ;
//   }
// }

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  void initState(){
    super.initState();
    // Application.router.navigateTo(context, "/blog");

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black87,
        height: 150,
        padding: new EdgeInsets.all(20),

        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceAround,

          children: [

            Column(
              mainAxisAlignment:MainAxisAlignment.spaceAround,

              children: [
                Text(
                  '风移影动',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

                Text('自由自在的流浪',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                Text('about me',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment:MainAxisAlignment.spaceAround,

              children: [
                Text('相关链接',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

                // InkWell(
                //     onTap: (){
                //       //通过Application的路由就可以跳转页面啦
                //       Application.router.navigateTo(context, "/blog");
                //
                //     },
                //     child: Text('博客')
                // ),
                RaisedButton(
                    child:Text('博客',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),

                    onPressed:() {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context)=>BlogPage())
                      // );

                      // Application.router.navigateTo(context, "/blog");
                      NavigatorUtils.push(context, BlogRouter.blogPage, replace: true);
                      // Navigator.pushNamed(context, '/blog');
                      // Navigator.of(context).pushReplacementNamed('/blog');
                      // Navigator.popAndPushNamed(context, '/blog');
                    }),
                Text('日记',
                  style: TextStyle(
                    color: Colors.white,
                  ),)
              ],
            ),
            Column(
              mainAxisAlignment:MainAxisAlignment.spaceAround,

              children: [
                Text('联系我',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text('地址:广州番禺小龙村',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text('QQ:648371113',

                  style: TextStyle(
                    color: Colors.white,
                  ),),
                Text('邮箱:648371113@qq.com',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        )


    )
    ;
  }

}

