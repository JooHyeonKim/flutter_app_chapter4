import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/measure': (context) => const MyForm(),
        '/milk': (context) => const MilkPage(),
        '/sweet_coffee': (context) => const SweetCoffeePage(),
        '/juice_or_latte': (context) => const JuiceOrLattePage(),
        '/coffee_again': (context) => const CoffeeAgainPage(),
        '/result': (context) => const ResultPage(),
      },
      //home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Beverage'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){},
          ),
        ],
      ),
      //body: const ResultPage(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'I want to help you choose the beverage.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height:20,
            ),
            const Text('Let\'s start!', style: TextStyle(
              fontSize: 20,
            ),
            ),
            const SizedBox(
              height:20,
            ),
            ElevatedButton(
              child: const Text('Go'),
              onPressed: (){
                setState(() {
                  Navigator.pushNamed(context,'/measure');
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  int _coffeeCnt = 0;

  void _resetCounter() {
    setState((){
      _coffeeCnt = 0;
    });
  }

  void _decrementCounter() {
    setState(() {
      _coffeeCnt--;
    });
  }

  void _incrementCounter() {
    setState(() {
      _coffeeCnt++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Measure Your Coffee'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'How many cups of coffee did you drink?',style:
            TextStyle(
              fontSize: 16,
            ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '$_coffeeCnt cups', style:
                const TextStyle(
                  fontSize: 16,
                ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _decrementCounter, child: const Text('-')),
                ElevatedButton(onPressed: _incrementCounter, child: const Text('+')),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            ElevatedButton(
              child: const Text('Next'),
              onPressed: (){
                setState(() {
                  if(_coffeeCnt <=1){
                    Navigator.pushNamed(context, '/milk', arguments:_coffeeCnt );
                  }
                  else{
                    Navigator.pushNamed(context,'/juice_or_latte', arguments:_coffeeCnt);
                  }

                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MilkPage extends StatefulWidget {
  const MilkPage({Key? key}) : super(key: key);

  @override
  State<MilkPage> createState() => _MilkPageState();
}

class _MilkPageState extends State<MilkPage> {
  @override
  Widget build(BuildContext context) {
    final _coffeeCnt = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Measure Your Coffee'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Since you drank $_coffeeCnt cup of coffee, ', style: const TextStyle(
              fontSize: 18,
            ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'you may want coffee.', style: TextStyle(
              fontSize: 18,
            ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Do you want milk in the coffee?',style: TextStyle(
                fontSize: 20,
            ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Yes'),
                  onPressed: (){
                    setState(() {
                      Navigator.pushNamed(context, '/sweet_coffee');
                    });
                  },
                ),
                ElevatedButton(
                  child: const Text('No'),
                  onPressed: (){
                    setState(() {
                      Navigator.pushNamed(context, '/result', arguments:'Americano');
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),

    );
  }
}

class SweetCoffeePage extends StatefulWidget {
  const SweetCoffeePage({Key? key}) : super(key: key);

  @override
  State<SweetCoffeePage> createState() => _SweetCoffeePageState();
}

class _SweetCoffeePageState extends State<SweetCoffeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sweet Coffee'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Do you want sweet coffee? ', style: TextStyle(
              fontSize: 18,
            ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Yes'),
                  onPressed: (){
                    setState(() {
                      Navigator.pushNamed(context, '/result', arguments:'Mocha Latte');
                    });
                  },
                ),
                ElevatedButton(
                  child: const Text('No'),
                  onPressed: (){
                    setState(() {
                      Navigator.pushNamed(context, '/result', arguments:'Caffe Latte');
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}

class JuiceOrLattePage extends StatefulWidget {
  const JuiceOrLattePage({Key? key}) : super(key: key);

  @override
  State<JuiceOrLattePage> createState() => _JuiceOrLattePageState();
}

class _JuiceOrLattePageState extends State<JuiceOrLattePage> {
  @override
  Widget build(BuildContext context) {
    final _coffeeCnt = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juice or Latte'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
              'Since you drank $_coffeeCnt cup of coffee,', style: const TextStyle(
              fontSize: 16,
            ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'you may not want coffee.',style:
                TextStyle(
                  fontSize: 16
                ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Do you want juice or latte?', style:
            TextStyle(
              fontSize: 20,
            ),),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Juice'),
                  onPressed: (){
                    setState(() {
                      Navigator.pushNamed(context, '/result', arguments:'Grapefruit Juice' );
                    });
                  },
                ),
                ElevatedButton(
                  child: const Text('Latte'),
                  onPressed: (){
                    setState(() {
                      Navigator.pushNamed(context, '/coffee_again');
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}

class CoffeeAgainPage extends StatefulWidget {
  const CoffeeAgainPage({Key? key}) : super(key: key);

  @override
  State<CoffeeAgainPage> createState() => _CoffeeAgainPageState();
}

class _CoffeeAgainPageState extends State<CoffeeAgainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Again'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Do you want some more coffee?', style: TextStyle(
              fontSize: 18,
            ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Yes'),
                  onPressed: (){
                    setState(() {
                      Navigator.pushNamed(context, '/sweet_coffee');
                    });
                  },
                ),
                ElevatedButton(
                  child: const Text('No'),
                  onPressed: (){
                    setState(() {
                      Navigator.pushNamed(context, '/result', arguments:'Sweet Potato Latte');
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final result = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const Text('Your best beverage is',style: TextStyle(
              fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('$result', style: const TextStyle(
              fontSize: 30,
              ),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        tooltip: 'reset',
        child: Icon(Icons.refresh),
      ),
    );
  }
}