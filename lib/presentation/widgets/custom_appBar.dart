import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData iconData;

  const CustomAppBar(
      {super.key, required this.iconData, this.title = AppStrings.nameApp});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            if (iconData == Icons.search) {
            } else {
              Navigator.pop(context);
            }
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: ColorManager.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(AppSize.s16)),
            child: Icon(
              iconData,
              size: AppSize.s28,
            ),
          ),
        ),
      ],
    );
  }
}
