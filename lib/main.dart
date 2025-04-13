import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tourism App',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.green[800],
              margin: EdgeInsets.zero,
              padding: EdgeInsets.all(20),
              height: 300.0,
              width: 500.0,
              child: Image(
                image: AssetImage('images/Salalah1.jpg'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.amber,
              child: Text(
                'Popular Places',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Card(
                        elevation: 0.0,
                        margin: EdgeInsets.all(10),
                        child: SizedBox(
                          width: 200,
                          child:
                              Image(image: AssetImage('images/Salalah2.jpg')),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text('Darbat Falls / OMR 25')),
                          Spacer(),
                          Align(alignment: Alignment.bottomRight, child: Fav()),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Card(
                        elevation: 0.0,
                        margin: EdgeInsets.all(10),
                        child: SizedBox(
                          width: 200,
                          child:
                              Image(image: AssetImage('images/Salalah3.jpg')),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text('Haffa Beach / OMR 20 ')),
                          Spacer(),
                          Align(alignment: Alignment.bottomRight, child: Fav()),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              color: Colors.amber[900],
              height: 5,
            ),
            Container(
              width: double.infinity,
              color: Colors.grey,
              child: Text(
                'Currency Converter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Currency(),
            Discount(),
            Tours(),
            MyTableCalendar(),
            SizedBox(
              height: 100.0,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green[400],
        foregroundColor: Colors.white,
        child: Icon(Icons.add_circle_sharp),
      ),
    );
  }
}

class Fav extends StatefulWidget {
  const Fav({super.key});

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() => liked = !liked);
      },
      icon: liked
          ? (Icon(
              Icons.favorite,
              color: Colors.red,
            ))
          : (Icon(Icons.favorite)),
    );
  }
}

class Currency extends StatefulWidget {
  const Currency({super.key});

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  final TextEditingController _curr = TextEditingController();
  double currRate = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _curr,
            decoration: InputDecoration(
              labelText: 'Currency in OMR',
              prefixIcon: Icon(Icons.money),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          OutlinedButton(
            onPressed: () {
              setState(() {
                currRate = (double.parse(_curr.text)) * 2.60;
              });
            },
            style: OutlinedButton.styleFrom(maximumSize: Size(100, 50)),
            child: Text(
              'Convert',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'OMR TO USD : $currRate',
            style: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Discount extends StatefulWidget {
  const Discount({super.key});

  @override
  State<Discount> createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  String mtype = "mc";
  final TextEditingController _tourRate = TextEditingController();
  double discount = 0.0;
  double netRate = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.amber[900],
          height: 5,
        ),
        Container(
          width: double.infinity,
          color: Colors.grey,
          child: Text('Tour Discount',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _tourRate,
                onChanged: (value) {
                  setState(() {
                    if (_tourRate.text.isNotEmpty &&
                        double.parse(_tourRate.text) != 0) {
                      discount = double.parse(_tourRate.text) * 0.8;
                      netRate = double.parse(_tourRate.text) - discount;
                    } else {
                      discount = 0.0;
                      netRate = 0.0;
                    }
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Tour Rate',
                  prefixIcon: Icon(Icons.money),
                  border: OutlineInputBorder(),
                ),
              ),
              RadioListTile(
                title: Text("Member Customer"),
                value: "mc",
                groupValue: mtype,
                onChanged: (value) {
                  setState(() {
                    mtype = value.toString();
                    if (_tourRate.text.isNotEmpty &&
                        double.parse(_tourRate.text) != 0) {
                      discount = double.parse(_tourRate.text) * 0.8;
                      netRate = double.parse(_tourRate.text) - discount;
                    }
                  });
                },
              ),
              RadioListTile(
                  title: Text("Guest Customer"),
                  value: "gc",
                  groupValue: mtype,
                  onChanged: (value) {
                    setState(() {
                      mtype = value.toString();

                      if (_tourRate.text.isNotEmpty &&
                          double.parse(_tourRate.text) != 0) {
                        discount = double.parse(_tourRate.text) * 0.5;
                        netRate = double.parse(_tourRate.text) - discount;
                      }
                    });
                  }),
              Text('Tour Estimated Rate'),
              Text('Discount: $discount'),
              Text('Net Rate: $netRate'),
              SizedBox(
                height: 50.0,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Tours extends StatefulWidget {
  const Tours({super.key});

  @override
  State<Tours> createState() => _ToursState();
}

class _ToursState extends State<Tours> {
  bool ta = false;
  bool tb = false;
  bool tc = false;
  bool td = false;
  double tourPrice = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.grey,
          alignment: Alignment.center,
          child: Text(
            'Tours',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CheckboxListTile(
          title: Image(image: AssetImage('images/Salalah1.jpg')),
          value: ta,
          onChanged: (value) {
            setState(() {
              ta = value!;
              if (ta) {
                tourPrice += 150;
              } else {
                tourPrice -= 150;
              }
            });
          },
        ),
        CheckboxListTile(
          title: Image(image: AssetImage('images/Salalah2.jpg')),
          value: tb,
          onChanged: (value) {
            setState(() {
              tb = value!;
              if (tb) {
                tourPrice += 50;
              } else {
                tourPrice -= 50;
              }
            });
          },
        ),
        CheckboxListTile(
          title: Image(image: AssetImage('images/Salalah3.jpg')),
          value: tc,
          onChanged: (value) {
            setState(() {
              tc = value!;
              if (tc) {
                tourPrice += 70;
              } else {
                tourPrice -= 70;
              }
            });
          },
        ),
        CheckboxListTile(
          title: Image(image: AssetImage('images/Salalah4.jpg')),
          value: td,
          onChanged: (value) {
            setState(() {
              td = value!;
              if (td) {
                tourPrice += 70;
              } else {
                tourPrice -= 70;
              }
            });
          },
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          color: Colors.grey,
          child: Text(
            'Total Tour Price: $tourPrice',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 100.0,
        ),
      ],
    );
  }
}

class MyTableCalendar extends StatefulWidget {
  const MyTableCalendar({super.key});

  @override
  State<MyTableCalendar> createState() => _MyTableCalendarState();
}

class _MyTableCalendarState extends State<MyTableCalendar> {
  DateTime selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            'Select Tour Date',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        TableCalendar(
          rowHeight: 40,
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: selectedDay,
          calendarFormat: CalendarFormat.month,
          startingDayOfWeek: StartingDayOfWeek.sunday,
          daysOfWeekVisible: true,
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              this.selectedDay = selectedDay;
            });
          },
          selectedDayPredicate: (day) => isSameDay(selectedDay, day),
        ),
      ],
    );
  }
}
