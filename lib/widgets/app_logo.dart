import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
  child: Center(
    child: ClipOval(
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 139, 85, 5),
          border: Border.all(color: Colors.black, width: 5),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
            bottom: Radius.circular(20),
          ),
        ),
        child: Center(
          child: Text(
            "0>1",
            style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 1, 0, 0), fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  ),
);




    


  }
}
