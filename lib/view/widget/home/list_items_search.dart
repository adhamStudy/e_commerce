import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/home_controller/home_controller.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsSearch extends StatelessWidget {
  const ListItemsSearch({super.key, required this.listDataModel});
  final List<ItemsModel> listDataModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listDataModel.length,
      itemBuilder: (context, index) {
        return SearchItemCard(
          model: listDataModel[index],
        );
      },
    );
  }
}

class SearchItemCard extends GetView<HomeControllerImp> {
  const SearchItemCard({super.key, required this.model});
  final ItemsModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotoProductsDetails(model);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                  child: CachedNetworkImage(
                      height: 80,
                      width: 80,
                      imageUrl:
                          '${AppLink.imageStatic}/items/${model.itemsImage}')),
              Expanded(
                  flex: 2,
                  child: ListTile(
                    title: Text(model.itemsName!),
                    subtitle: Text(model.categoriesName!),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
