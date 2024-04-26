import 'package:e_commerce/controller/settings_controller.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettignsView extends StatelessWidget {
  const SettignsView({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImpl controller = Get.put(SettingsControllerImpl());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 2,
                color: AppColors.primaryColor,
              ),
              Positioned(
                top: Get.width / 2.5,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 168, 169, 170),
                    backgroundImage: AssetImage('assets/images/profile.png'),
                    radius: 40,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              child: Column(children: [
                ListTile(
                  title: const Text('Disable notifications'),
                  trailing: Switch(value: true, onChanged: (value) {}),
                ),
                const Divider(
                  height: 1,
                  color: AppColors.grey,
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.ordersPending);
                  },
                  title: const Text('Orders'),
                  trailing: const Icon(Icons.file_open_rounded),
                ),
                const Divider(
                  height: 1,
                  color: AppColors.grey,
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.addressHome);
                  },
                  title: Text('Address'),
                  trailing: Icon(Icons.edit_location_outlined),
                ),
                const Divider(
                  height: 1,
                  color: AppColors.grey,
                ),
                const ListTile(
                  title: Text('About us'),
                  trailing: Icon(Icons.person_3_rounded),
                ),
                const Divider(
                  height: 1,
                  color: AppColors.grey,
                ),
                const ListTile(
                  title: Text('Contact'),
                  trailing: Icon(Icons.call_made_sharp),
                ),
                const Divider(
                  height: 1,
                  color: AppColors.grey,
                ),
                ListTile(
                  onTap: () {
                    controller.logOut();
                  },
                  title: const Text('Log out'),
                  trailing: const Icon(Icons.logout_sharp),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
