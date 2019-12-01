import 'package:flutter/material.dart';

import 'package:project_citas_test/models/citasModels.dart';
import 'package:project_citas_test/providers/db_provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CitasCalendarioPage extends StatefulWidget {
  @override
  _CitasCalendarioState createState() => _CitasCalendarioState();
}

class _CitasCalendarioState extends State<CitasCalendarioPage> {
  CalendarController _controller = CalendarController();
  List<DateTime> citasArray = [];


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DBProvider.db.mostrarCitas(),
      builder:
          (BuildContext context, AsyncSnapshot<List<CitasModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.data.length == 0) {
          return Center(
            child: Text(
              'No hay citas registradas',
              style: TextStyle(fontSize: 28.0, color: Colors.red),
            ),
          );
        }
  Map<DateTime, List<dynamic>> citasCalendario = {};

        snapshot.data.forEach( (cita){
          print(cita.fecha);
      int ano = int.parse(cita.fecha.split("-")[0]);
      int mes = int.parse(cita.fecha.split("-")[1]);
      int dia = int.parse(cita.fecha.split("-")[2].split(' ')[0]);
      DateTime fecha = DateTime(ano, mes, dia);
      citasCalendario.putIfAbsent(fecha, () => ['a']);
        });

        return Column(
          children: <Widget>[
            calendario(context,citasCalendario),
            Flexible(
                child: ListView(
                    scrollDirection: Axis.vertical,
                    children: mostrarCitas(snapshot.data)))
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        );
      },
    );
  }

  Widget calendario(BuildContext context,Map<DateTime, List<dynamic>> citasCalendario ) {
    return TableCalendar(
      holidays: citasCalendario,
      daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: Colors.teal.shade600),
          weekendStyle: TextStyle(color: Colors.red)),
      availableCalendarFormats: {
        CalendarFormat.month: 'Mes',
      },
      weekendDays: [7],
      availableGestures: AvailableGestures.horizontalSwipe,
      rowHeight: 39.0,
      //initialCalendarFormat: CalendarFormat.month,
      calendarStyle: CalendarStyle(
          todayColor: Colors.white,
          weekdayStyle: TextStyle(color: Colors.white),
          selectedColor: Theme.of(context).primaryColor,
          todayStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.white)),
      headerStyle: HeaderStyle(
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 23.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold),
        centerHeaderTitle: true,
        formatButtonDecoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(20.0),
        ),
        formatButtonTextStyle: TextStyle(color: Colors.white70),
        formatButtonShowsNext: false,
      ),
      startingDayOfWeek: StartingDayOfWeek.sunday,
      onDaySelected: (date, events) {
        print(date);
      },
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, events) => Container(
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: Text(
              date.day.toString(),
              style: TextStyle(color: Colors.teal.shade600),
            )),
        todayDayBuilder: (context, date, events) => Container(
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.teal.shade600,
                borderRadius: BorderRadius.circular(10.0)),
            child: Text(
              date.day.toString(),
              style: TextStyle(color: Colors.white),
            )),
      ),
      calendarController: _controller,
    );
  }

  List<Widget> mostrarCitas(List<CitasModel> citas) {
    return citas.map((cita) {
   

      return AnimationConfiguration.staggeredList(
        position: 0,
        duration: const Duration(milliseconds: 250),
        child: SlideAnimation(
          verticalOffset: 100.0,
          child: FadeInAnimation(
            child: ListTile(
              onTap: () {},
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[700],
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                  radius: 23,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      cita.cliente,
                      style: TextStyle(fontSize: 17.0, color: Colors.white),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            cita.fecha,
                            style: TextStyle(
                                fontSize: 10.0, color: Colors.white70),
                          ),
                          SizedBox(
                            width: 16,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          color: Colors.white70,
                          size: 12,
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        Text(
                          'Evento ${cita.servicio}',
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white70,
                              letterSpacing: 0.8,
                              wordSpacing: 3),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.white70,
                ),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }
}
