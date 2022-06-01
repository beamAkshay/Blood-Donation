import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'ImageSliderDesign.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIndex = 0;
  int _current = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        elevation: 0,
        // toolbarHeight: 100,

        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
        bottom: PreferredSize(
            child: Container(
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8.0), // <-- Radius
                        ),
                        primary: const Color(0xFFF4F4F4),
                      ),
                      child: Column(
                        children: const [
                          Image(
                            image: AssetImage(
                                "assets/images/icons/bloodRequest.png"),
                            height: 35,
                            width: 40.0,
                          ),
                          Text(
                            "Request Blood",
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8.0), // <-- Radius
                          ),
                          primary: const Color(0xFFF4F4F4),
                        ),
                        child: Column(
                          children: const [
                            Image(
                              image: AssetImage(
                                  "assets/images/icons/bloodDonor.png"),
                              height: 35,
                              width: 40.0,
                            ),
                            Text(
                              "Donate Blood",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                    const Spacer(),
                  ],
                )),
            preferredSize: const Size.fromHeight(100.0)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            //Contain Carosal
            SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    CarouselSlider(
                      items: CourosalSliderIndicator.imageSliders,
                      options: CarouselOptions(
                          // autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                    CourosalSliderIndicator(current: _current),
                  ],
                )),
          ],
        ),
      )),
      drawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_sharp,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bloodtype_rounded,
              ),
              label: "Blood Bank"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Profile"),
        ],
        elevation: 4,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        selectedIconTheme: IconThemeData(
            size: 25.0, color: Theme.of(context).colorScheme.onPrimary),
        unselectedIconTheme: IconThemeData(
            size: 25.0,
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.70)),
        unselectedItemColor:
            Theme.of(context).colorScheme.onPrimary.withOpacity(0.70),
        selectedFontSize: 14,
        currentIndex: _selectIndex,
        unselectedFontSize: 14,
        onTap: _onItemTapped,
      ),
    );
  }
}
