import 'dart:math';
import 'package:flutter/material.dart';

class PhotoGalleryScreen extends StatefulWidget {
  const PhotoGalleryScreen({super.key});

  @override
  State<PhotoGalleryScreen> createState() => _PhotoGalleryScreenState();
}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  bool loaded = false;
  List<Widget> images = [];
  bool isLoadingMore = false;
  final ScrollController _scrollController = ScrollController();
  Widget imageWidget = Container();

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
        _scrollController.position.maxScrollExtent - 100 && !isLoadingMore) {
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
    return Container(
      constraints: const BoxConstraints(minHeight: 300),
      color: Colors.black87,
      child: Center(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 10.0,
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