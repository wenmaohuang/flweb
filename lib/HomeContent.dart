import 'package:flutter/material.dart';
class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Center(
        child:TextField(
          decoration: InputDecoration(
            labelText: '表单label',
            labelStyle: TextStyle(
              color: Colors.pink,
              fontSize: 12,
            ),
            helperText: 'helperText',
            hintText: 'Placeholder...',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.pink,
              ),
            ),
          ),
        )
    );
  }
}
