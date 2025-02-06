import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  final String facebookUrl =
      "https://www.facebook.com/profile.php?id=61552048663871";
  final String linkedinUrl =
      "https://www.linkedin.com/company/youngdev-intern/";

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'About Us',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: double.infinity,
              height: 400,
              child: Image.asset(
                'assets/header-bg-1.png',
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Why Choose Us?",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Image.asset(
              'assets/ab.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "At YoungDev Interns, we're committed to fostering talent and offering exceptional learning experiences. We believe in breaking down barriers to entry by providing free, remote internship opportunities that empower aspiring developers to kickstart their careers.We offer a unique month-long internship program, allowing you to gain practical experience from the comfort of your own workspace. Each month, interns will tackle 3 to 4 real-world tasks, giving you hands-on exposure to industry-relevant projects. Upon successful completion of the internship, we provide a certificate to recognize your dedication and skills gained during your time with us.",
              style: TextStyle(
                  fontSize: 20, color: const Color.fromARGB(255, 95, 95, 95)),
            ),
          ),
          Stack(children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/footer-bg.jpg', // Change to your footer background image
                fit: BoxFit.cover,
              ),
            ),
            // Footer Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Contacts',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email, color: Colors.purple),
                      SizedBox(width: 10),
                      Text(
                        'youngdevinterns60@gmail.com',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_city, color: Colors.purple),
                      SizedBox(width: 10),
                      Text(
                        'Pakistan - Islamabad',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Follow Us',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => _launchURL(facebookUrl),
                        child: const Row(
                          children: [
                            Icon(Icons.facebook, color: Colors.purple),
                            SizedBox(width: 10),
                            Text('Facebook',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 30),
                      InkWell(
                        onTap: () => _launchURL(linkedinUrl),
                        child: const Row(
                          children: [
                            Icon(Icons.business, color: Colors.purple),
                            SizedBox(width: 10),
                            Text('LinkedIn',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ])
        ])));
  }
}
