import 'package:flutter/material.dart';

class CategoryDesWidgetImage extends StatelessWidget {
  const CategoryDesWidgetImage({Key? key, required this.imageUrl})
      : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.25),
      ),
      height: MediaQuery.of(context).size.height * 1/3,
      //padding: const EdgeInsets.only(left: 15, right: 15),
      child: imageUrl.isEmpty?const Text(''):Image(image: NetworkImage(imageUrl)),
    );
  }
}
