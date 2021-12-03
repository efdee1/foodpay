import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({ Key? key,this.text,this.press }) : super(key: key);
   final String? text;
  @required final  VoidCallback? press ;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 15, 16, 15),
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text!,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.white,
                    
                    fontWeight: FontWeight.w600,
                    fontSize: 24)),
                     ],
                    ),
      ),
    );
  }
}
