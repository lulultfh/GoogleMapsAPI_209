import 'package:flutter/material.dart';
import 'package:gmaps_flutter/map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? alamatDipilih;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Pilih alamat'),
                  IconButton(
                    icon: const Icon(Icons.map, color: Colors.blue),
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MapPage(),
                        ),
                      );
                      if (result != null) {
                        setState(() {
                          alamatDipilih = result;
                        });
                      }
                    },
                  ),
                  const SizedBox(width: 8),
                  
                  Flexible(
                    child: Text(
                      alamatDipilih ?? 'Tidak ada alamat yang dipilih',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}