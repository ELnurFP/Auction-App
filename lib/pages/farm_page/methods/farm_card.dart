import 'package:flutter/material.dart';

import '../../../utils/size.dart';

GestureDetector farmCard(BuildContext context, String imageUrl, String name,
    String address, GestureTapCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white,
      child: ListTile(
          title: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            address,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          leading: Container(
            width: getWidth(50, context),
            height: getWidth(50, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          )

       
          ),
    ),
  );
}
