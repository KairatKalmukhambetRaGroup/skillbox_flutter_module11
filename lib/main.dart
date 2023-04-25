import 'package:flutter/material.dart';
import 'spaces.dart';

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
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Animations'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: <Widget>[
            ...spaces
                .map((space) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Details(data: space),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 4,
                          color: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Hero(
                                      tag: space.id,
                                      child: Image.asset(
                                        space.image,
                                        height: 100,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -20,
                                      right: 20,
                                      child: Hero(
                                        tag: '${space.id}-button',
                                        child: Material(
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            color: Colors.yellow,
                                            child: const Icon(
                                              Icons.add,
                                              weight: 100,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Hero(
                                tag: '${space.id}-title',
                                child: Material(
                                  color: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      space.description,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details({super.key, required this.data});
  final Space data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Hero(
                  tag: data.id,
                  child: Image.asset(
                    data.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -20,
                  right: 20,
                  child: Hero(
                    tag: '${data.id}-button',
                    child: Material(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.yellow,
                        child: const Icon(
                          Icons.add,
                          weight: 100,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Hero(
            tag: '${data.id}-title',
            child: Material(
              child: Container(
                clipBehavior: Clip.none,
                padding: const EdgeInsets.all(8),
                // color: Colors.grey,
                width: double.infinity,
                child: Text(data.description),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
