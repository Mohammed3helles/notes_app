import 'package:flutter/material.dart';
import 'package:notes_app/presentation/resources/color_manager.dart';
import 'package:notes_app/presentation/resources/values_manager.dart';
import 'package:notes_app/presentation/widgets/CustomTextField.dart';

import '../resources/strings_manager.dart';

class AddNoteModelBottomSheet extends StatelessWidget {
  const AddNoteModelBottomSheet({Key? key}) : super(key: key);

  // TextEditingController  _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpace.p14),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppSize.s20),
            CustomTextField(hint: AppStrings.titleTextFiled),
            SizedBox(height: AppSize.s16),
            CustomTextField(hint: AppStrings.contentTextFiled, maxLines: 5),
            buildButtonAdd(context)
          ],
        ),
      ),
    );
  }

  Container buildButtonAdd(BuildContext context) {
    return Container(
            margin: const EdgeInsets.only(top: 40, bottom: 20),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.textField),
              child: Text(
                AppStrings.nameButtonAdd,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          );
  }
}
