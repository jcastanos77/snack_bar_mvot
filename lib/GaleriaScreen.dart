import 'package:flutter/material.dart';

class Galeriascreen extends StatefulWidget {
  const Galeriascreen({super.key});

  @override
  State<Galeriascreen> createState() => _GaleriascreenState();
}

class _GaleriascreenState extends State<Galeriascreen> {

  final List<String> imageUrls = [
    'https://placekitten.com/400/400',
    'https://placekitten.com/401/400',
    'https://placekitten.com/402/400',
    'https://placekitten.com/403/400',
    'https://placekitten.com/404/400',
    'https://placekitten.com/405/400',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: imageUrls.map((url) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/mvSnacks.png"),
          );
        }).toList(),
      ),
    );
  }
}
