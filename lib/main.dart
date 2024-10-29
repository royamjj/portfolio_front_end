import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  bool loaded = false;
  List<Widget> images = [];
  bool isLoadingMore = false;
  final ScrollController _scrollController = ScrollController();


  @override
  void initState(){
    super.initState();
    _scrollController.addListener(_onScroll);
    // loadData();
    loadMoreImages();
  }

  Future<void> loadMoreImages() async {
    setState(() {
      isLoadingMore = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    for (int i = 0; i < 10; i++) {
      int id = Random().nextInt(100) + 1;
      int height = Random().nextInt(400) + 200;
      int width = Random().nextInt(400) + 200;
      images.add(
        Image.network(
          "https://picsum.photos/id/$id/$width/$height",
          fit: BoxFit.cover,
        ),
      );
    }
    setState(() {
      isLoadingMore = false;
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200 && !isLoadingMore) {
      loadMoreImages();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // loadData() async{
  //   for(int i=0;i<20;i++) {
  //     int id = Random().nextInt(100) + 1;
  //     int height = Random().nextInt(400) + 200;
  //     int width = Random().nextInt(400) + 200;
  //     images.add(Image.network("https://picsum.photos/id/$id/$width/$height", fit: BoxFit.cover,));
  //   }
  //   setState(() {
  //     loaded = true;
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    // if(!loaded)return const CircularProgressIndicator();
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black87,
          child: Center(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 10.0,
                      alignment: WrapAlignment.spaceEvenly,
                      children: images.map((widget) => DynamicWidthImage(widget: widget,)).toList(),
                    ),
                  ),
                  if (isLoadingMore)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DynamicWidthImage extends StatelessWidget {
  final Widget widget;

  DynamicWidthImage({required this.widget});

  @override
  Widget build(BuildContext context) {
    double maxH = MediaQuery.of(context).size.height >= 600 ? 300 : 200;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 400, maxHeight: maxH),
      child: Container(
        color: Colors.blueGrey,
        // width: (MediaQuery.of(context).size.width / 3) - 16,
        height: 300,
        child: widget,
      ),
    );
  }
}
