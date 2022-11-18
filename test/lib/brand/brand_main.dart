import 'package:flutter/material.dart';
import '../styles.dart';
import '../components/shadowed_brand_icon.dart';

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
          centerTitle: true,
          title: Image.asset('lib/images/Brandicon.png'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: '브랜드',
              ),
              Tab(
                text: '기프티콘',
              ),
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
                  ShadowedBrandIcon('lib/images/cat.jpg'),
                  ShadowedBrandIcon('lib/images/cat.jpg'),
                  ShadowedBrandIcon('lib/images/cat.jpg'),
                  ShadowedBrandIcon('lib/images/cat.jpg'),
                  ShadowedBrandIcon('lib/images/cat.jpg'),
                  ShadowedBrandIcon('lib/images/cat.jpg'),
                  ShadowedBrandIcon('lib/images/cat.jpg'),
                  ShadowedBrandIcon('lib/images/cat.jpg'),
                  ShadowedBrandIcon('lib/images/cat.jpg'),
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
