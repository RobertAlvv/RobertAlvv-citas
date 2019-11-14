import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:bottom_navigation_badge/bottom_navigation_badge.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final _menuForm = [
    {'label': 'Crear Usuario', 'icon': Icons.person_add, 'ruta': 0},
    {
      'label': 'navegation Text',
      'icon': Icons.perm_contact_calendar,
      'ruta': 1
    },
    {'label': 'Lista de Usuario', 'icon': Icons.list, 'ruta': 2},
    {'label': 'Actualizar Usuario', 'icon': Icons.update, 'ruta': 3},
    {'label': 'Eliminar Usuario', 'icon': Icons.delete, 'ruta': 4},
  ];

  final _menuCitas = [
    {'label': 'Lista de Citas', 'ruta': 5}
  ];

  int _selectpage = 0;

  String _app = 'Crear Usuario';

  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  int _selectedIndex;
  var _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.edit),
          actions: <Widget>[Icon(Icons.search)],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: 650,
              child: RotatedBox(
                quarterTurns: 2,
                child: WaveWidget(
                  config: CustomConfig(
                    gradients: [
                      [
                        Colors.deepOrangeAccent,
                        Colors.deepOrangeAccent.shade200
                      ],
                      [Colors.indigo, Colors.indigo.shade200]
                    ],
                    durations: [19440, 10800],
                    heightPercentages: [0.20, 0.25],
                    blur: MaskFilter.blur(BlurStyle.solid, 10),
                    gradientBegin: Alignment.bottomLeft,
                    gradientEnd: Alignment.topRight,
                  ),
                  waveAmplitude: 0,
                  size: Size(double.infinity, double.infinity),
                ),
              ),
            ),
            ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: CalendarCarousel(
                    onDayPressed: (DateTime date, List events) {
                      this.setState;
                    },
                    weekendTextStyle: TextStyle(
                      color: Colors.red,
                    ),
                    thisMonthDayBorderColor: Colors.grey,
//      weekDays: null, /// for pass null when you do not want to render weekDays
//      headerText: Container( /// Example for rendering custom header
//        child: Text('Custom Header'),
//      ),
                    customDayBuilder: (
                      /// you can provide your own build function to make custom day containers
                      bool isSelectable,
                      int index,
                      bool isSelectedDay,
                      bool isToday,
                      bool isPrevMonthDay,
                      TextStyle textStyle,
                      bool isNextMonthDay,
                      bool isThisMonthDay,
                      DateTime day,
                    ) {
                      /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
                      /// This way you can build custom containers for specific days only, leaving rest as default.

                      // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
                      if (day.day == 15) {
                        return Center(
                          child: Icon(Icons.local_airport),
                        );
                      } else {
                        return null;
                      }
                    },
                    weekFormat: false,
                    height: 420.0,
                    daysHaveCircularBorder: false,

                    /// null for not rendering any border, true for circular border, false for rectangular border
                  ),
                )
              ],
            )
          ],
        ),
        drawer: Drawer(
          child: _drawerElement(context),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.perm_contact_calendar),
              title: Text('Citas'),
              activeColor: Colors.grey,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.person),
                title: Text('Clientes'),
                activeColor: Colors.grey),
            BottomNavyBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
                activeColor: Colors.grey),
          ],
        )

//      bottomNavigationBar: BubbledNavigationBar(
//        defaultBubbleColor: Colors.blue,
//        onTap: (index) {
//          // handle tap
//        },
//        items: <BubbledNavigationBarItem>[
//          BubbledNavigationBarItem(
//            icon: Icon(CupertinoIcons.home, size: 45, color: Colors.red),
//            activeIcon:
//                Icon(CupertinoIcons.home, size: 45, color: Colors.white),
//            title: Text(
//              'Home',
//              style: TextStyle(color: Colors.white, fontSize: 12),
//            ),
//          ),
//          BubbledNavigationBarItem(
//            icon: Icon(CupertinoIcons.info, size: 45, color: Colors.teal),
//            activeIcon:
//                Icon(CupertinoIcons.info, size: 45, color: Colors.white),
//            title: Text(
//              'Info',
//              style: TextStyle(color: Colors.white, fontSize: 12),
//            ),
//          ),
//          BubbledNavigationBarItem(
//            icon: Icon(CupertinoIcons.profile_circled,
//                size: 45, color: Colors.cyan),
//            activeIcon: Icon(CupertinoIcons.profile_circled,
//                size: 45, color: Colors.white),
//            title: Text(
//              'Profile',
//              style: TextStyle(color: Colors.white, fontSize: 12),
//            ),
//          ),
//        ],
//      ),
//      body: Container(
//        color: Colors.blue,
//      ),

//
        );
  }

  Widget _drawerElement(BuildContext context) {
    List<Widget> listaWidgetDrawer = List<Widget>();
    listaWidgetDrawer.add(_drawerHeader());
    for (Map it in _menuForm) {
      listaWidgetDrawer.add(itemMenu(it, context));
    }
    return ListView(
      children: listaWidgetDrawer,
    );
  }

  Widget _drawerHeader() {
    return DrawerHeader(
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: Icon(
              Icons.person,
              size: 60.0,
            ),
            backgroundColor: Colors.grey,
            radius: 45,
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 45, 13, 0),
                child: Text(
                  'USUARIO 1',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.white70),
                ),
              ),
              SizedBox(
                height: 3.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text('usuario@usuario.com'),
              )
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.deepOrangeAccent,
          Colors.red,
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [0.3, 0.8],
      )),
    );
  }

  Widget itemMenu(Map it, BuildContext context) {
    return ListTile(
      title: Text(
        it['label'],
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.grey.shade700,
          wordSpacing: 2.0,
          letterSpacing: 0.2,
        ),
      ),
      leading: Icon(it['icon']),
      onTap: () {
        setState(() {
          _selectpage = it['ruta'];
          Navigator.pop(context);
          _app = it['label'];
        });
      },
    );
  }
}
