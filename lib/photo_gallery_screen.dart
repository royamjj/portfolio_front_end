import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
  int enlargedIndex = 0;
  bool enlargedView = false;

  @override
  void initState() {
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
    for (int i = 0; i < 20; i++) {
      int id = Random().nextInt(100) + 1;
      int height = Random().nextInt(400) + 200;
      int width = Random().nextInt(400) + 200;
      images.add(
        Image.network(
          "https://picsum.photos/id/$id/$width/$height",
          fit: BoxFit.cover,
        ),
      );
      // images.add(
      //   CachedNetworkImage(
      //     imageUrl: "https://picsum.photos/id/$id/$width/$height",
      //     fit: BoxFit.cover,
      //   ),
      // );
    }

    setState(() {
      isLoadingMore = false;
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100 && !isLoadingMore) {
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

  int getCount() {
    double width = MediaQuery.sizeOf(context).width;
    if (width >= 800) {
      return 4;
    }
    if (width >= 600) {
      return 3;
    }
    if (width >= 400) {
      return 2;
    }
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      // constraints: const BoxConstraints(minHeight: 300),
      color: Colors.black87,
      child: Stack(
        children: [
          Positioned(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(width >= 800 ? 70 : 30, 20, width >= 800 ? 70 : 30, 10),
                    child: MasonryGridView.count(
                      controller: _scrollController,
                      crossAxisCount: getCount(),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      shrinkWrap: true,
                      // physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              enlargedView = true;
                              enlargedIndex = index;
                            });
                          },
                            child: DynamicWidthImage(widget: images[index])
                        );
                      },
                    ),
                    // Wrap(
                    //   spacing: 10.0,
                    //   runSpacing: 10.0,
                    //   alignment: WrapAlignment.spaceBetween,
                    //   children: images.map((widget) => DynamicWidthImage(widget: widget,)).toList(),
                    // ),
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
          if(enlargedView)Container(
            color: Colors.black.withOpacity(0.7),
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 10),
                    child: images[enlargedIndex],
                  ),
                ),
                // Close Button
                Positioned(
                  top: 40,
                  right: 20,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white, size: 30),
                    onPressed: (){
                      setState(() {
                        enlargedView = false;
                      });
                    }
                  ),
                ),
                if(width > 600)Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_left, color: Colors.white, size: 60),
                    onPressed: navigateLeft,
                  ),
                ),
                if(width > 600)Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_right, color: Colors.white, size: 60),
                    onPressed: navigateRight,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void navigateLeft() {
    setState(() {
      enlargedIndex = (enlargedIndex > 0) ? enlargedIndex - 1 : 0;
    });
  }

  void navigateRight() {
    setState(() {
      enlargedIndex = (enlargedIndex < images.length - 1) ? enlargedIndex + 1 : enlargedIndex;
    });
  }

// @override
// Widget build(BuildContext context) {
//   return Container(
//     constraints: const BoxConstraints(minHeight: 300),
//     color: Colors.black87,
//     child: Center(
//       child: Column(
//         children: [
//           Expanded(
//             child: GridView.builder(
//               controller: _scrollController,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 crossAxisSpacing: 10.0,
//                 mainAxisSpacing: 10.0,
//               ),
//               itemCount: images.length,
//               itemBuilder: (context, index) {
//                 return DynamicWidthImage(widget: images[index]);
//               },
//             ),
//           ),
//           if (isLoadingMore)
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: CircularProgressIndicator(),
//             ),
//         ],
//       ),
//     ),
//   );
// }
}

class DynamicWidthImage extends StatelessWidget {
  final Widget widget;

  const DynamicWidthImage({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        // color: Colors.blueGrey,
        constraints: const BoxConstraints(maxHeight: 300),
        // width: (MediaQuery.of(context).size.width / 3) - 16,
        // height: 300,
        child: widget,
      ),
    );
  }
}
