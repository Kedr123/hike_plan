import 'package:flutter/material.dart';
import 'package:hike_plan/LocalDataBase/Database.dart';
import 'package:hike_plan/Pages/CreatePlan.dart';
import 'package:hike_plan/Pages/HikePlans.dart';
import 'package:hike_plan/Pages/Index.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }



  @override
  Widget build(BuildContext context) {
    // Provider.of<DBProvider>(context, listen: true).initDB();
    return ChangeNotifierProvider<DBProvider>(create: (context)=>DBProvider(), child: MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == '/Index')
          return PageRouteBuilder(pageBuilder: (_, __, ___) => Index());
        else if (settings.name == '/HikePlans')
          return PageRouteBuilder(pageBuilder: (_, __, ___) => HikePlans());
        else if (settings.name == '/CreatePlan')
          return PageRouteBuilder(pageBuilder: (_, __, ___) => CreatePlan());

        return null;
      },
      debugShowCheckedModeBanner: false,
      initialRoute: "/Index",
      routes: {
        // '/Index': (context) => Index(),
        // '/HikePlan': (context) => HikePlans(),

      },
    ));
    // return Scaffold(
    //   // appBar: AppBar(
    //   //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    //   //
    //   //   title: Text(widget.title),
    //   // ),
    //   body: Center(
    //
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         const Text(
    //           'You have pushed the button this many times:',
    //         ),
    //         Text(
    //           '$_counter',
    //           style: Theme.of(context).textTheme.headlineMedium,
    //         ),
    //       ],
    //     ),
    //   ),
    //
    //   appBar: AppBar(), // This trailing comma makes auto-formatting nicer for build methods.
    // );
  }
}
