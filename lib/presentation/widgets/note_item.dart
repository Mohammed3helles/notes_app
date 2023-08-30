import 'dart:math';

import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppSize.s10),
      padding: EdgeInsets.only(
        top: AppSpace.p20,
        bottom: AppSpace.p20,
        right: AppSpace.p16,
        left: AppSpace.p24,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color.fromRGBO(Random().nextInt(254), Random().nextInt(254),
              Random().nextInt(254), 1),
          borderRadius: BorderRadius.circular(AppSize.s22)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              AppStrings.nameApp,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: AppSpace.p16, bottom: AppSpace.p14),
              child: Text(
                AppStrings.desApp,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            trailing: IconButton(
                onPressed: () {},
                splashColor: Colors.red.withOpacity(0.7),
                icon: Icon(
                  Icons.delete,
                  color: ColorManager.black,
                  size: AppSize.s30,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: AppSpace.p16,
              right: AppSpace.p8,
            ),
            child: Text(
              "may ${DateTime.now().month},${DateTime.now().year}",
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          )
        ],
      ),
    );
  }
}
