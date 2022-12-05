import 'package:flutter/material.dart';
import 'package:w3_class/network/brand_crud.dart';
import '../styles.dart';
import '../components/shadowed_brand_icon.dart';
import '../gifticon/gifticon_list.dart';
import '../components/custom_floatingActionButton.dart';
import '../network/gifticon_crud.dart';
import 'brand_detail.dart';
import 'package:provider/provider.dart';
import '../provider/sort_provider.dart';
import 'brand_list.dart';

class BrandMainPage extends StatefulWidget {
  const BrandMainPage({Key? key}) : super(key: key);

  @override
  State<BrandMainPage> createState() => _BrandMainPageState();
}

class _BrandMainPageState extends State<BrandMainPage> {
  final GifticonCRUD gifticonCRUD = GifticonCRUD();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SortOption(),
      builder: (context, child) => DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Image.asset('lib/images/Brandicon.png'),
              actions: [
                IconButton(
                    onPressed: () {
                      gifticonCRUD.logout();
                    },
                    icon: const Icon(Icons.logout))
              ],
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
                BrandListPage(),
                const GifticonListPage(),
              ],
            ),
            floatingActionButton: CustomFloatingActionButton(),
          )),
    );
  }
}
