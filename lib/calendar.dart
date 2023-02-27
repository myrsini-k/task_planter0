import 'package:flutter/material.dart';
import 'package:task_planter/home.dart';
//import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatelessWidget {
  static final String home = 'Calendar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: () {
                index = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PageViewDemo()),
                );
              },
              child: const Icon(
                Icons.home,
                size: 40,
                color: Color(0xFF2E5627),
              ),
            ),
            centerTitle: true,
            title: const Text('Calendar', style: TextStyle(fontSize: 34))),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/cat3.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: null),
        bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: home,
                  backgroundColor: const Color(0xFFB3F39B)),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.checklist_rtl,
                  ),
                  label: home,
                  backgroundColor: const Color(0xFFB3F39B)),
              BottomNavigationBarItem(
                icon: const Icon(Icons.calendar_today),
                label: home,
                backgroundColor: const Color(0xFFB3F39B),
              ),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.spa_outlined),
                  label: home,
                  backgroundColor: const Color(0xFFB3F39B)),
              BottomNavigationBarItem(
                icon: const Icon(Icons.emoji_emotions_outlined),
                label: home,
                backgroundColor: const Color(0xFFB3F39B),
              ),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: 2,
            selectedItemColor: const Color(0xFF022100),
            unselectedItemColor: const Color(0xFF2E5627),
            iconSize: 40,
            //selectedIconTheme:,

            onTap: (curr) {
              index = curr;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PageViewDemo()),
              );
            },
            elevation: 5));
  }
}
/*
class CalPage extends StatefulWidget {
  @override
  _CalPageState createState() => _CalPageState();
}

class _CalPageState extends State<CalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableCalendar Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: Text('Basics'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => TableBasicsExample()),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: Text('Range Selection'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => TableRangeExample()),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: Text('Events'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => TableEventsExample()),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: Text('Multiple Selection'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => TableMultiExample()),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: Text('Complex'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => TableComplexExample()),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
*/