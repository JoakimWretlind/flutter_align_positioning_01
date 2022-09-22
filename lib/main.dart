import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  static const String title = 'Align Example';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: const MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.orangeAccent,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              buildBackground(),
              // like absolute poistioning
              Positioned(
                top: 8,
                right: 4,
                child: buildBookmark(),
              ),
              // Center is the same as Alignment.center
              Center(
                child: buildTitle(),
              ),
              Align(
                alignment: const Alignment(0.0, 0.8),
                child: buildActions(),
              ),
              Positioned(
                top: 20,
                left: -32,
                child: buildBadge(),
              ),
            ],
          ),
        ),
      );

  // Title
  Widget buildTitle() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'LIMITLESS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 42),
            child: const Text(
              'A science fiction thriller film directed by Neil Burger',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );

  // Badge
  Widget buildBadge() => RotationTransition(
        turns: const AlwaysStoppedAnimation(-45 / 360),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 32),
          color: Colors.white,
          child: const Text('POPULAR',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
        ),
      );

  // Actions
  Widget buildActions() => Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.favorite_border,
              color: Colors.red,
            ),
            SizedBox(width: 8),
            Text(
              '27 K',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 32),
            Icon(Icons.share, color: Colors.blue),
            SizedBox(width: 8),
            Text(
              '3.2 K',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      );

  // Bookmark
  Widget buildBookmark() => IconButton(
        icon: const Icon(
          Icons.bookmark_border,
          color: Colors.white,
          size: 40,
        ),
        onPressed: (() {}),
      );

  // Background
  Widget buildBackground() => ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          color: Colors.black,
          child: Opacity(
            opacity: 0.8,
            child: Image.network(
              'https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      );
}
