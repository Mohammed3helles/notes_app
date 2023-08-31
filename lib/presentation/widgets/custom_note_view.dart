import 'package:flutter/material.dart';
import 'package:notes_app/presentation/resources/color_manager.dart';
import 'package:notes_app/presentation/resources/strings_manager.dart';
import 'package:notes_app/presentation/resources/values_manager.dart';
import 'package:notes_app/presentation/widgets/custom_appBar.dart';

import 'note_item.dart';

class CustomNoteView extends StatelessWidget {
  const CustomNoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpace.p24),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: AppSize.s50),
          CustomAppBar(iconData: Icons.search,),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpace.p16),
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return const NoteItem();
                }),
          )),
        ],
      ),
    );
  }
}
