import 'package:flutter/material.dart';

import 'navegationBar.dart';

class SenttingPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold( 
      appBar: AppBar(title: Text('Senttings App ')),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
