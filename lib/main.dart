import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'add_popular_place.dart';
import 'view_popular_place.dart';
import 'login_page.dart';
import 'registration_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAz2ghiKEexz36J-nfxEQ3DwF-bt1rusR8",
          appId: "1:503670974512:android:a7d9e1885cf11cc599e5f5",
          messagingSenderId: "503670974512",
          projectId: "tourismappasus"));

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
        leading: Builder(builder: (context) {
          return IconButton(
            color: Colors.white,
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: Drawer(
        child: SideDrawer(),
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
            DropButton()
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

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, ModalRoute.withName("/"));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        UserAccountsDrawerHeader(
          accountName: Text('Junn Eric'),
          accountEmail: Text('junn.eric@utas.edu.om'),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image(
                image: AssetImage('images/profile.png'),
                fit: BoxFit.cover,
                width: 100.0,
                height: 100.0,
              ),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text(
            'Home',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.question_answer),
          title: Text(
            'About',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.question_answer),
          title: Text(
            'Add Popular Places',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddPopularPlace(),
            ));
          },
        ),
        ListTile(
          leading: Icon(Icons.question_answer),
          title: Text(
            'View Popular Places',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ViewPopularPage(),
            ));
          },
        ),
        ListTile(
          leading: Icon(Icons.edit_document),
          title: Text(
            'Registration',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RegistrationPage(),
            ));
          },
        ),
        ListTile(
          leading: Icon(Icons.login),
          title: Text(
            'Sign In',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text(
            'Sign Out',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            signOut();
          },
        ),
      ]),
    );
  }
}

class DropButton extends StatefulWidget {
  const DropButton({super.key});

  @override
  State<DropButton> createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  String selectedval = 'Sightseeing';
  List tours = ['Sightseeing', 'Adventure', 'Relaxation'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200.0,
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            color: Colors.grey,
            child: Text('Tour Type',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber)),
          ),
          Text(
            'Select Tour Type',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          DropdownButton(
            icon: Icon(Icons.arrow_drop_down),
            items: tours.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            value: selectedval,
            onChanged: (value) {
              setState(() {
                selectedval = value.toString();
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
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
