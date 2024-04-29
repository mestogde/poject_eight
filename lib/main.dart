import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ляляля',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImageLoaderPage(),
    );
  }
}

class ImageLoaderPage extends StatefulWidget {
  const ImageLoaderPage({super.key});

  @override
  _ImageLoaderPageState createState() => _ImageLoaderPageState();
}

class _ImageLoaderPageState extends State<ImageLoaderPage> {
  final List<String> imageUrls = [
    'https://news.ralali.com/wp-content/uploads/2021/07/capuccino-scaled.jpg',
    "https://avatars.dzeninfra.ru/get-zen_doc/271828/pub_65605c87a767964d45b88dde_65605c98368ff544362c2655/scale_1200",
    "https://avatars.dzeninfra.ru/get-zen_doc/271828/pub_6518021545c0495f1349c4a4_6518026c69319f27a49cb73b/scale_1200",
    "https://static.tildacdn.com/tild3434-6538-4337-b634-386635346362/latte.jpg",
    "https://img.razrisyika.ru/kart/83/1200/331605-kakao-6.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('кэширование картинок'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return CachedNetworkImage(
            imageUrl: imageUrls[index],
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
        },
      ),
    );
  }
}
