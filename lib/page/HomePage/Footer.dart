import 'package:flutter/material.dart';
class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black87,

        child: Row(

          children: [

            Column(
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

              children: [
                Text('相关链接',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text('博客',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text('日记',
                  style: TextStyle(
                    color: Colors.white,
                  ),)
              ],
            ),
            Column(
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
