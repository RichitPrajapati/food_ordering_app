import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/views/component/items.dart';
import 'package:get/get.dart';

import '../../controllers/favourites controllers.dart';
import '../../helpers/cloud firestore helper.dart';
import '../../models/item models.dart';


final FavouritesController favouritesController =
Get.find<FavouritesController>();

fruitsTab() {
  return Container(
    padding: const EdgeInsets.all(12),
    child: StreamBuilder<QuerySnapshot>(
      stream: CloudFirestoreHelper.cloudFirestoreHelper
          .fetchAllRecords(collectionName: 'food_items'),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Error:${snapshot.error}"),
          );
        } else if (snapshot.hasData) {
          QuerySnapshot? document = snapshot.data;
          List<QueryDocumentSnapshot> documents = document!.docs;

          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: documents.length,
            itemBuilder: (context, i) {
              return itemBox(
                id: documents[i].id,
                name: documents[i]['name'],
                image: documents[i]['image_URL'],
                time: documents[i]['delivery_time'],
                ratings: documents[i]['ratings'],
                price: documents[i]['price'],
                isFavourite: documents[i]['isFavourite'],
                quantity: 0,
                item: Item(
                  id: documents[i].id,
                  name: documents[i]['name'],
                  price: documents[i]['price'],
                  ratings: documents[i]['ratings'],
                  deliveryTime: documents[i]['delivery_time'],
                  image: documents[i]['image_URL'],
                  isFavourite: documents[i]['isFavourite'],
                  quantity: 0,
                ),
                context: context,
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 275,
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(color: Colors.green),
        );
      },
    ),
  );
}
