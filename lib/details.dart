import 'package:flutter/material.dart';

import 'spaces.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.data});
  final Space data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Hero(
                  tag: data.id,
                  child: Image.asset(
                    data.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Container(
            clipBehavior: Clip.none,
            padding: const EdgeInsets.all(8),
            // color: Colors.grey,
            width: double.infinity,
            child: Text(data.description),
          ),
        ],
      ),
    );
  }
}
