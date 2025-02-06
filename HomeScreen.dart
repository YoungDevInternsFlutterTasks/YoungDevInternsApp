import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youngdevinternapp/AboutScreen.dart';
import 'package:youngdevinternapp/internshipsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Default index for HomeScreen

  final List<Widget> _screens = [
    HomeScreenContent(), // HomeScreen content
    const AboutScreen(),
    const InternshipsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(Icons.home, size: 30),
      const Icon(Icons.info, size: 30),
      const Icon(Icons.business_center, size: 30),
    ];

    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Row(
          children: [
            Image.asset(
              'assets/logo1.jpg',
              width: 70,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'YoungDev Interns',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: Colors.white.withOpacity(0.2),
          height: 70,
          index: _selectedIndex,
          items: items,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}

// HomeScreenContent is a separate widget to avoid infinite recursion
class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          CarouselSlider(
            items: [
              _buildCarouselItem("assets/home-slide-1.jpg",
                  text: "EMPOWERING TOMORROW'S DEVELOPERS TODAY"),
              _buildCarouselItem("assets/home-slide-2.jpg",
                  text: "DISCOVER YOUR SKILLS"),
              _buildCarouselItem("assets/hom-slide-3.jpg",
                  text: "APPLY INTERNSHIPS FOR FREE"),
            ],
            options: CarouselOptions(
              height: 250,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 10 / 2,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              viewportFraction: 1,
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            "WE ARE HIRING",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 40),
          ),
          const SizedBox(height: 50),
          customContainer(
              text: 'Multitalented', imagePath: 'assets/icon-1.png'),
          const SizedBox(height: 50),
          customContainer(text: 'Leaders', imagePath: 'assets/icon-2.png'),
          const SizedBox(height: 50),
          customContainer(text: 'Learners', imagePath: 'assets/icon-3.png'),
          const SizedBox(height: 50),
          customContainer(text: 'Developers', imagePath: 'assets/icon-4.png'),
          const SizedBox(height: 50),
          customContainer(text: 'Programmers', imagePath: 'assets/icon-5.png'),
          const SizedBox(height: 50),
          customContainer(text: 'IT Experts', imagePath: 'assets/icon-6.png'),
          const SizedBox(height: 40),
          Container(
            height: 300,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/ab.jpg'))),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "About Us",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              'Welcome to YoungDev Interns - Your Gateway to Skill Development!',
              style: TextStyle(
                  fontSize: 20, color: const Color.fromARGB(255, 95, 95, 95)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AboutScreen()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text("Read More",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'FREE',
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              'We are Freely Assigning tasks and will guide every student',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 95, 95, 95),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 200, // Button fills width
            child: ElevatedButton(
              onPressed: () async {
                final Uri url =
                    Uri.parse('https://forms.gle/STc1h9p2eJ1pSXPr5');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Apply Now',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  static Widget _buildCarouselItem(String imagePath, {String? text}) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image:
              AssetImage(imagePath), // Use AssetImage instead of NetworkImage
          fit: BoxFit.cover,
        ),
      ),
      child: text != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : null,
    );
  }

  static Container customContainer(
      {required String text, required String imagePath}) {
    return Container(
      height: 250,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath),
          // Ensures the image covers the container properly
        ),
      ),
      child: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 170),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
