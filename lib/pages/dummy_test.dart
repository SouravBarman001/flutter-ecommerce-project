import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/apis/banner_apis.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter/material.dart';

import '../../widgets/appbar_action_widgets.dart';
import '../model/banner_model.dart';

class DummyHomePage extends StatefulWidget {
  const DummyHomePage({super.key});

  @override
  State<DummyHomePage> createState() => _DummyHomePageState();
}

class _DummyHomePageState extends State<DummyHomePage> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'images/fluttersourav.jpg',
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.account_circle_rounded),
                  title: const Text('Profile'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.favorite),
                  title: const Text('Favourites'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                ),
                const Spacer(),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: const Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
         // title: const Text('Advanced Drawer Example'),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
          actions: const [
            AppBarActionWidgets(),
          ],
        ),
        body: const CarouselSliderWidgets(),
      ),
    );
  }
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}

// ----------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------

// Scaffold(
// appBar: AppBar(
// elevation: 3,
// backgroundColor: const Color(0xffdf0100),
// actions: const [
// AppBarActionWidgets(),
// ],
// ),
// body: const SafeArea(
// child:SingleChildScrollView(
// child: Column(
// children: [
// CarouselSliderWidgets(),
// SizedBox(height: 10,),
//
// ],
// ),
// ),
// ),
// ),

class CarouselSliderWidgets extends StatefulWidget {
  const CarouselSliderWidgets({super.key});

  @override
  State<CarouselSliderWidgets> createState() => _CarouselSliderWidgetsState();
}

class _CarouselSliderWidgetsState extends State<CarouselSliderWidgets> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
          width: double.infinity,
          child: FutureBuilder<List<BannerModel>>(
            future: BannerApis.fetchImages(),
            builder: (context, AsyncSnapshot<List<BannerModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: RefreshProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return CarouselSlider(
                  options: CarouselOptions(
                    height: 400.0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                   animateToClosest: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    pauseAutoPlayOnTouch: false,
                    aspectRatio: 16 / 9,
                    onPageChanged: (index, reason) {
                      // Do something when the page changes
                    },
                    scrollDirection: Axis.horizontal,

                  ),
                  items: snapshot.data!.map((BannerModel banner) {
                    final imagePath = banner.imageUrl;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                      child: SizedBox(
                        // height: 400,
                        // width: 500, // Specify a fixed width for each item
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            imagePath.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              }
            },
          ),
        ),





        const SizedBox(height: 1,),
        //  Row(
        //    mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     for(var i = 0;i<images.length;i++)
        //         buildIndicator(currentIndex == i)
        //
        //   ],
        // ),
      ],
    );
  }

}