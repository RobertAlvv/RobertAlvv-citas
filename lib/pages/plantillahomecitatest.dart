import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

Widget BodyCita(BuildContext context, CalendarController _controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      TableCalendar(
        daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: Colors.blue),
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
          print(date.toIso8601String());
        },
        builders: CalendarBuilders(
          selectedDayBuilder: (context, date, events) => Container(
              margin: const EdgeInsets.all(4.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text(
                date.day.toString(),
                style: TextStyle(color: Colors.white),
              )),
          todayDayBuilder: (context, date, events) => Container(
              margin: const EdgeInsets.all(4.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text(
                date.day.toString(),
                style: TextStyle(color: Colors.white),
              )),
        ),
        calendarController: _controller,
      ),
      Expanded(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            AnimationConfiguration.staggeredList(
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
                            'Robert Alvarez',
                            style:
                                TextStyle(fontSize: 17.0, color: Colors.white),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Nov 2'.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 10.0, color: Colors.white70),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  '12:15 PM',
                                  style: TextStyle(
                                      fontSize: 10.0, color: Colors.white70),
                                ),
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
                                'Evento Matutino',
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
            ),
            AnimationConfiguration.staggeredList(
              position: 0,
              duration: const Duration(milliseconds: 300),
              child: SlideAnimation(
                verticalOffset: 80.0,
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7.0),
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
                              'Robert Alvarez',
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.white),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Nov 2'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.white70),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    '12:15 PM',
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.white70),
                                  ),
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
                                  'Evento Matutino',
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
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 0,
              duration: const Duration(milliseconds: 325),
              child: SlideAnimation(
                verticalOffset: 70.0,
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7.0),
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
                              'Robert Alvarez',
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.white),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Nov 2'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.white70),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    '12:15 PM',
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.white70),
                                  ),
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
                                  'Evento Matutino',
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
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 0,
              duration: const Duration(milliseconds: 330),
              child: SlideAnimation(
                verticalOffset: 60.0,
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7.0),
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
                              'Robert Alvarez',
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.white),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Nov 2'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.white70),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    '12:15 PM',
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.white70),
                                  ),
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
                                  'Evento Matutino',
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
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 0,
              duration: const Duration(milliseconds: 340),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7.0),
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
                              'Robert Alvarez',
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.white),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Nov 2'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.white70),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    '12:15 PM',
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.white70),
                                  ),
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
                                  'Evento Matutino',
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
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 0,
              duration: const Duration(milliseconds: 340),
              child: SlideAnimation(
                verticalOffset: 40.0,
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7.0),
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
                              'Robert Alvarez',
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.white),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Nov 2'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.white70),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    '12:15 PM',
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.white70),
                                  ),
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
                                  'Evento Matutino',
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
              ),
            ),
          ],
        ),
      )
    ],
  );
}
