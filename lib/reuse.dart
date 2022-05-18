import 'package:flutter/material.dart';

Widget RecommendCard(Map like) => Builder(
  builder: (context) {
    return     Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(
              height: 120,
              width: double.infinity,
              image: AssetImage('images/office.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF3072BA),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              "FOR SALE",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            '${like['Title']}',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "${like['Bedroom']} Bedroom - ${like['Area']} Meters ",
            style: Theme.of(context).textTheme.caption!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          // Text(
          //   '${like['Price']}',
          //   style: Theme.of(context).textTheme.subtitle1!.copyWith(
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
        ],
      ),
    );
  }
);