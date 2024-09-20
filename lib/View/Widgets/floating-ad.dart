import 'package:flutter/material.dart';

class FloatingAd extends StatelessWidget {
  const FloatingAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          const Center(
            child: Text(
              'Advertisement',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                print('Ad closed');
              },
            ),
          ),
        ],
      ),
    );
  }
}