import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:images_scroller_assignment/viewmodels/scroller_viewmodel.dart';
import 'package:images_scroller_assignment/widgets/scroller.dart';

final scrollerProvider = ChangeNotifierProvider((_) => ScrollerViewModel());

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Home Assignment',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme:
            ThemeData.light().appBarTheme.copyWith(backgroundColor: Colors.red),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline5: const TextStyle(color: Colors.white),
            ),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(
          secondary: Colors.red,
          secondaryVariant: Colors.red[700],
        ),
      ),
      home: MyHomePage(title: 'Images Scroller', ref: ref),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.ref})
      : super(key: key);

  final String title;
  final WidgetRef ref;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    widget.ref.read(scrollerProvider).fetchPhotosFromServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Theme.of(context).colorScheme.secondaryVariant,
          shape: Border(
            bottom: BorderSide(
                width: 8,
                color: Theme.of(context).colorScheme.secondaryVariant),
          ),
          title:
              Text(widget.title, style: Theme.of(context).textTheme.headline5),
        ),
        body: const Scroller());
  }
}
