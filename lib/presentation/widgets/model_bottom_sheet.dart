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
      child: Column(
        children: [
          SizedBox(height: AppSize.s20),
          CustomTextField(hint: 'Title'),
          SizedBox(height: AppSize.s16),
          CustomTextField(hint: 'Content',maxLines: 5,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.textField),
              child: const Text(AppStrings.nameButtonAdd),
            ),
          )
        ],
      ),
    );
  }


}
