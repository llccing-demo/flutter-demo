import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.loose(const Size(600, 200)),
      height: ScreenUtil().setHeight(535),
      width: ScreenUtil().setWidth(750),

      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/loginTopBg.png'), fit: BoxFit.cover)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("AstraZeneca",
                style: TextStyle(
                    color: Colors.white, decoration: TextDecoration.none)),
            Icon(
              Icons.remove_done,
              color: Colors.orange,
              size: 48,
            )
          ],
        ),
      ),
    );
  }
}
