import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InternshipsScreen extends StatelessWidget {
  const InternshipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow/elevation
        title: const Text(
          'Internships',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              customCard(
                'assets/im-1.jpg',
                'Full-Stack Web',
                'All the tasks will be assigned on Backend and frontend of the website',
              ),
              const SizedBox(height: 20),
              customCard(
                'assets/im-2.jpg',
                'Frontend Development',
                'All the tasks will be assigned on only frontend of a website',
              ),
              const SizedBox(height: 20),
              customCard(
                'assets/im-3.jpg',
                'Backend Development',
                'All the tasks will be assigned on only backend of a website',
              ),
              const SizedBox(height: 20),
              customCard(
                'assets/im-4.jpg',
                'Android Development',
                'The tasks will be on Android Studio using Java/Kotlin and XML',
              ),
              const SizedBox(height: 20),
              customCard(
                'assets/im-5.jpg',
                'Python Development',
                'Basic tasks of Python on different modules',
              ),
              const SizedBox(height: 20),
              customCard(
                'assets/im-6.jpg',
                'Flutter Development',
                'Flutter tasks will be assigned like, cross-platform applications',
              ),
              const SizedBox(height: 20),
              customCard(
                'assets/im-7.jpg',
                'C# .NET Development',
                'C# .NET 2 simple and 1 complex task will be assigned',
              ),
              const SizedBox(height: 20),
              customCard(
                'assets/im-8.jpg',
                'ASP .NET Development',
                'Simple and Complex tasks will be there using ASP.NET',
              ),
              const SizedBox(height: 20),
              customCard(
                'assets/im-9.jpg',
                'Django (Python)',
                '3 tasks will be assigned for a month using Django (Python)',
              ),
              const SizedBox(height: 20),
              customCard(
                'assets/im-10.jpg',
                'Graphic Design',
                'All the tasks will be assigned to be done on AI and also on Figma',
              ),
              const SizedBox(height: 20),
              customCard(
                'assets/im-11.jpg',
                'Java Desktop',
                'The tasks will be assigned for Java effects',
              ),
              const SizedBox(height: 20),
              customCard(
                'assets/im-12.jpg',
                'Machine Learning',
                'Machine Learning complex tasks will be assigned',
              ),
              const SizedBox(height: 20),
              customCard(
                'assets/img-13.jpg',
                'WordPress',
                'Simple and Difficult WordPress tasks will be assigned here',
              ),
              const SizedBox(height: 20),
              customCard(
                'assets/im-14.jpg',
                'C++',
                'C++ Complex and simple tasks will be assigned',
              ),
              const SizedBox(height: 20),
              customCard(
                'assets/img-15.jpg',
                'Figma Design',
                'Figma App design and Web Design tasks will be assigned here',
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Card customCard(String imagePath, String title, String text) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imagePath,
              width: double.infinity, // Responsive width
              height: 200, // Fixed height
              fit: BoxFit.cover, // Ensures it covers the area
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  text,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity, // Button fills width
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
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Apply Now',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
