import 'package:flutter/material.dart';

import 'navegationBar.dart';

class RegistroPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(title: Text('Registros App ')),
      bottomNavigationBar: BottomNavBar(),
    );
  }

}