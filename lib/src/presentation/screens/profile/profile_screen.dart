import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:specifit/src/presentation/providers/auth_provider.dart';
import 'package:specifit/src/presentation/screens/front/onboarding_screen.dart';
import 'package:specifit/src/presentation/screens/profile/riwayat_screen.dart';
import 'package:specifit/src/presentation/screens/profile/programtersimpan_screen.dart';
import './editprofile_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

dynamic profile;

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final authProvider = ref.read(userAuthProvider);
    try {
      http.Response res = await http
          .get(Uri.parse("${dotenv.env['API_URL']!}user"), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authProvider.token}',
      });
      if (res.statusCode == 200) {
        profile = json.decode(res.body);
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = ref.read(userAuthProvider.notifier);

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Bagian 1: Judul Profil dan Gambar
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'Profil',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            AssetImage('assets/images/profile_image.jpg'),
                      ),
                      const SizedBox(width: 16),
                      Align(
                        alignment: Alignment.topRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            isLoading
                                ? const Center(child: CircularProgressIndicator())
                                : Text(
                                    profile['data']['name'],
                                    style: const TextStyle(fontSize: 18),
                                  ),
                            // Add more information or widgets related to the profile
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Bagian 2: Tombol Edit, Tombol Program Tersimpan, dan Tombol History
            //Bagian Edit Profile

            Container(
              width: 200, // Set the desired width of the box
              margin: const EdgeInsets.symmetric(horizontal: 30),
              // Adjust the left margin to position the box
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                      )
                    ],
                  ),
                  child: TextButton.icon(
                    onPressed: () {
                      // Add the desired functionality when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const EditProfileScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.orange,
                    ),
                    label: const Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Container(
              width: 200, // Set the desired width of the box
              margin: const EdgeInsets.symmetric(horizontal: 30),
              // Adjust the left margin to position the box
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                      )
                    ],
                  ),
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const RiwayatProfileScreen(),
                        ),
                      );
                      // Add the desired functionality when the button is pressed
                    },
                    icon: const Icon(
                      Icons.history,
                      color: Colors.orange,
                    ),
                    label: const Text(
                      'Riwayat Tersimpan',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Container(
              width: 200, // Set the desired width of the box
              margin: const EdgeInsets.symmetric(horizontal: 30),
              // Adjust the left margin to position the box
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                      )
                    ],
                  ),
                  child: TextButton.icon(
                    onPressed: () {
                      // Add the desired functionality when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const ProgramTersimpanScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.archive_rounded,
                      color: Colors.orange,
                    ),
                    label: const Text(
                      'Program Tersimpan',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 150),

            // Bagian 3: Tombol Logout
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 232, 11, 11),
                    ),
                    child: TextButton.icon(
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Keluar',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        authProvider.logout();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const OnboardingScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
