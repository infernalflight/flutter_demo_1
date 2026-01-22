import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello/CommutePage.dart';
import 'package:hello/titrepage.dart';

import 'FormPage.dart';
import 'model/Todo.dart';

void main() {
  runApp(MyApp());
}

final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => MyHomePage(title: 'Acccueil'),
      ),
      GoRoute(
        path: '/commute',
        builder: (context, state) {
          final String arg = state.extra as String;
          return CommutePage(arg);
        },
      ),
    ]
);


class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.purple),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

class MyHomePage extends StatelessWidget
{
  final String title;

  MyHomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('TabBar Sample'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.cloud_outlined)),
              Tab(icon: Icon(Icons.beach_access_sharp)),
              Tab(icon: Icon(Icons.brightness_5_sharp)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Tabl(),
            Tabl2(),
            FormPage(),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: 0,
          onDestinationSelected: (int index) {
            if(index == 1) {
              context.go('/commute', extra: 'Bonjour Go Route !');
            }
          },
          destinations: const <Widget>[
            NavigationDestination(icon: Icon(Icons.explore), label: 'Explore'),
            NavigationDestination(icon: Icon(Icons.commute), label: 'Commute'),
            NavigationDestination(
              selectedIcon: Icon(Icons.bookmark),
              icon: Icon(Icons.bookmark_border),
              label: 'Saved',
            ),
          ],
        ),
      ),
    );
  }
}



class Tabl extends StatelessWidget
{

  List<Todo> todos = [
    Todo('mon 1er todo', "c'est un truc à faire en priorité"),
    Todo('mon 2e todo', "c'est un truc à faire ensuite"),
    Todo('mon dernier todo', "c'est un truc à faire en dernier"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitrePage(),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(20.0),
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: Icon(Icons.warning),
                  title: Text(todos[index].name),
                  subtitle: Text(todos[index].desc),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

}

class Tabl2 extends StatefulWidget
{
  @override
  State<Tabl2> createState() => _Tabl2State();
}

class _Tabl2State extends State<Tabl2> {

  int _compteur = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Compteur : $_compteur', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _compteur++;
              });
            },
            child: Text('Clique moi !')
        )
      ]
    );
  }
}
