import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const RefreshDemoApp());

class RefreshDemoApp extends StatelessWidget {
  const RefreshDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: RefreshDemoPage(),
    );
  }
}

class RefreshDemoPage extends StatefulWidget {
  const RefreshDemoPage({super.key});

  @override
  State<RefreshDemoPage> createState() => _RefreshDemoPageState();
}

class _RefreshDemoPageState extends State<RefreshDemoPage> {
  // This is where we will put our list of data later!
  List<String> items = ['Assignment 1', 'Assignment 2', 'Assignment 3'];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(

      child: CustomScrollView(

        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            largeTitle: Text('My Assignments'),
          ),

          CupertinoSliverRefreshControl(
            onRefresh: () async {

              await Future.delayed(const Duration(seconds: 2));
              setState(() {
                items.insert(0, 'New Assignment ${items.length + 1}');
              });
            },
          ),
          
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text(items[index]),
                trailing: const Icon(CupertinoIcons.right_chevron),
              ),
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}
