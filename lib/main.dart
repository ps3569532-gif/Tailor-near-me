import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const TailorNearMeApp());
}

class TailorNearMeApp extends StatelessWidget {
  const TailorNearMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tailor Near Me',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? shopLocation;
  Position? customerLocation;
  String locationText = 'Shop location अभी सेट नहीं है';

  final String phone = '9520476152';
  final String email = 'premdass1998cv@gmail.com';

  Future<void> setShopLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        setState(() {
          locationText = 'पहले फोन की Location ON करें';
        });
        return;
      }

      LocationPermission permission =
          await Geolocator
