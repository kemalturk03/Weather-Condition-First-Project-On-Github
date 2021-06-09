import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Function onTapSearch, onTapLocation;

  CustomAppBar({@required this.onTapSearch, @required this.onTapLocation});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff000000),
      shadowColor: Color(0xFF501274),
      elevation: 24.0,
      leading: Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: IconButton(
          icon: Icon(CupertinoIcons.antenna_radiowaves_left_right, size: 32),
          onPressed: onTapLocation,
        ),
      ),
      title: Text('HOW A DURUMU'),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: IconButton(
            icon: Icon(Icons.search, size: 32),
            onPressed: onTapSearch,
          ),
        ),
      ],
    );
  }
}
