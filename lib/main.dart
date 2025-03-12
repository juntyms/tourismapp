import 'package:flutter/material.dart';

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
      body: Column(
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
                        child: Image(image: AssetImage('images/Salalah2.jpg')),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text('Darbat Falls / OMR 25')),
                        Spacer(),
                        Align(alignment: Alignment.bottomRight, child: fav()),
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
                        child: Image(image: AssetImage('images/Salalah3.jpg')),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text('Haffa Beach / OMR 20 ')),
                        Spacer(),
                        Align(alignment: Alignment.bottomRight, child: fav()),
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
          Currency(),
        ],
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

class fav extends StatefulWidget {
  const fav({super.key});

  @override
  State<fav> createState() => _favState();
}

class _favState extends State<fav> {
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
  TextEditingController _curr = TextEditingController();
  double curr_rate = 0;
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
                curr_rate = (double.parse(_curr.text)) * 2.60;
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
            'OMR TO USD : ' + curr_rate.toString(),
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
