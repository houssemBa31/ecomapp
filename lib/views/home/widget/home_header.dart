import 'package:ecomapp/views/home/widget/search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../cart/cart.dart';
import '../home_page.dart';
import 'icon_btn_with_counter.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: SearchField()),
          const SizedBox(width: 16),
          IconBtnWithCounter(

            svgSrc: cartIcon,
            press: () {
              Get.to(CartScreen());},
          ),
          const SizedBox(width: 8),
         // IconBtnWithCounter(svgSrc: bellIcon, numOfitem: 3, press: () {}),
        ],
      ),
    );
  }
}
