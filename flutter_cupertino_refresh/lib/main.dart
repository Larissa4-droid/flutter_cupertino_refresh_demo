import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const RefreshDemoApp());

class RefreshDemoApp extends StatelessWidget {
  const RefreshDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
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
  // An assignment list
  List<String> items = ['Math Assignment', 'ML Project', 'Flutter Lab'];

  double triggerDistance = 100.0;
  double indicatorHeight = 60.0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            largeTitle: Text('My Assignments'),
          ),

          CupertinoSliverRefreshControl(
            // Attribute 1
            refreshTriggerPullDistance: triggerDistance,

            // Attribute 2
            refreshIndicatorExtent: indicatorHeight,

            // Attribute 3
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 2));

              setState(() {
                items.insert(0, 'New Assignment ${items.length + 1}');
              });
            },
          ),

          // Displaying the list items
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Material(
                  child: ListTile(
                    leading: const Icon(CupertinoIcons.book),
                    title: Text(items[index]),
                    subtitle: const Text('Due: Friday at 5:00 PM'),
                    trailing: const Icon(CupertinoIcons.right_chevron),
                    onTap: () {},
                  ),
                );
              },
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}
