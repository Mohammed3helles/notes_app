import 'package:flutter/material.dart';
import 'package:notes_app/presentation/resources/strings_manager.dart';
import 'package:notes_app/presentation/widgets/CustomTextField.dart';
import 'package:notes_app/presentation/widgets/custom_appBar.dart';

import '../resources/values_manager.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpace.p24),
        child: Column(
          children: [
            SizedBox(height: AppSize.s50),
            const CustomAppBar(
                title: AppStrings.editeNote, iconData: Icons.check),
            SizedBox(height: AppSize.s24),
            const CustomTextField(hint: AppStrings.titleTextFiled),
            SizedBox(height: AppSize.s16),
            const CustomTextField(
                hint: AppStrings.contentTextFiled, maxLines: 5),
            //
          ],
        ),
      ),
    );
  }
}
