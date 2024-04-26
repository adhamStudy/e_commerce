import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.onPressedSearch,
      // required this.onPressedIcon,
      required this.onPressedfav,
      required this.onChanged,
        required this.mycontroller});
  final String title;

  // final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  final void Function()? onPressedfav;
  final  Function(String)?onChanged;
  final TextEditingController mycontroller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: mycontroller,
              onChanged:onChanged,
              decoration: InputDecoration(
                  hintText: title,
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search_outlined),
                    onPressed: onPressedSearch,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          // Container(
          //   decoration: BoxDecoration(
          //       color: Colors.grey[200],
          //       borderRadius: BorderRadius.circular(15)),
          //   width: 50,
          //   padding: const EdgeInsets.symmetric(vertical: 5),
          //   child: IconButton(
          //       onPressed: onPressedIcon,
          //       icon: Icon(
          //         Icons.notifications_active_outlined,
          //         color: Colors.grey[600],
          //         size: 30,
          //       )),
          // ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15)),
            width: 50,
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: IconButton(
                onPressed: onPressedfav,
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.grey[600],
                  size: 30,
                )),
          )
        ],
      ),
    );
  }
}
