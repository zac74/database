import 'package:flutter/material.dart';
import '../model/property_model.dart';
import '../model/details_page.dart';
import 'home/home.dart';

class Testing extends StatelessWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
      Container(
        width: double.infinity,
        height: 400,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: properties.length,
          itemBuilder: (BuildContext context, int index) {
            final PropertyModel propertyModel = properties[index];
            return RecommendationCard(
                propertyModel: propertyModel);
          },
        ),
      ),
      ]
      ),
    );
  }
}
