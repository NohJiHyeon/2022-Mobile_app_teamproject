import 'package:flutter/material.dart';
import '../styles.dart';

class BrandMainPage extends StatefulWidget {
  const BrandMainPage({Key? key}) : super(key: key);

  @override
  State<BrandMainPage> createState() => _BrandMainPageState();
}

class _BrandMainPageState extends State<BrandMainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
               tabs: [
                Tab(text: '브랜드',),
                Tab(text: '기프티콘',),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Tab(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(30),
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 20,
                  crossAxisCount: 3,
                  children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('lib/images/cat.jpg',),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('lib/images/cat.jpg',),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('lib/images/cat.jpg',),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('lib/images/cat.jpg',),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('lib/images/cat.jpg',),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('lib/images/cat.jpg',),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('lib/images/cat.jpg',),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('lib/images/cat.jpg',),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('lib/images/cat.jpg',),
                        ),
                      ],
                    ),
                    ),
                  ],
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
            backgroundColor: AppColor.GRAY,
          ),
          ),
        );
  }
}
