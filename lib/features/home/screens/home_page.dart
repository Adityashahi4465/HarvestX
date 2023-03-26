import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _page = 0;
  void onPageChanges(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('user.nae'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: const Center(child: Text('Home Page'))
        // bottomNavigationBar: CupertinoTabBar(
        //   activeColor: Colors.black,
        //   backgroundColor: Colors.white38,
        //   items: const [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'My Expenses',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'New Expense',
        //     ),
        //   ],
        //   onTap: onPageChanges,
        //   currentIndex: _page,
        // ),
        );
  }
}
