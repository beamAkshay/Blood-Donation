import 'package:blood_donation/constant/size_config.dart';
import 'package:blood_donation/screen/blood_donate/blood_donation_request.dart';
import 'package:blood_donation/screen/blood_request/blood_request_form.dart';
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

  List<Widget> bottomNavigationItem = [Container(), Container(), Container()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: const Text('Home'),
              elevation: 4,
              pinned: true,
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.notifications))
              ],
              expandedHeight: SizeConfig.blockSizeVertical! * 20,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                    padding: const EdgeInsets.fromLTRB(0, 60, 0, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        FittedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const BloodRequest();
                              }));
                            },
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
                        ),
                        const Spacer(),
                        FittedBox(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const BloodDonationForm();
                                }));
                              },
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
                        ),
                        const Spacer(),
                      ],
                    )),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
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
                Container(
                  height: 400,
                  color: Colors.white,
                )
              ]),
            ),
          ],
        ),
      ),
      drawer: _buildDrawer(context),
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

  //Navigation drawer
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "UserName",
              style: TextStyle(
                  fontSize: 14.0,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
            accountEmail: Text(
              "sample@gmail.com",
              style: TextStyle(
                  fontSize: 14.0,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Text(
                "U",
                style: TextStyle(
                    fontSize: 40.0,
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Settings',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
            leading: Icon(Icons.settings,
                size: 24, color: Theme.of(context).colorScheme.onSurface),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
            leading: Icon(Icons.logout_rounded,
                size: 24, color: Theme.of(context).colorScheme.onSurface),
            onTap: () {
              // Navigator.pushNamed(context, loginRoute);
            },
          ),
        ],
      ),
    );
  }
}
