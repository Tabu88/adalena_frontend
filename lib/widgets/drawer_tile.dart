import 'package:flutter/material.dart';

import '../helpers/constants.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final void Function() navigation;
  const DrawerTile({
    super.key,
    required this.title,
    required this.navigation});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: Color(Constants.primaryWhite())
        ),
      ),
      onTap:  navigation,
    );
  }
}
