import 'package:flutter/material.dart';

class NextWidget extends StatelessWidget {
  final IconData icon;
  final Function() navigate;
   NextWidget({super.key, required this.icon, required this.navigate});


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: IconButton(
          icon: Icon(icon,size: 30,color: Colors.white70,),
          onPressed: navigate,
        ),
      );

  }
}
