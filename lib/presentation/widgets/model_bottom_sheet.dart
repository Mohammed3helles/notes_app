import 'package:flutter/material.dart';
import 'package:notes_app/presentation/resources/color_manager.dart';
import 'package:notes_app/presentation/resources/values_manager.dart';
import 'package:notes_app/presentation/widgets/CustomTextField.dart';

import '../resources/strings_manager.dart';

class AddNoteModelBottomSheet extends StatefulWidget {
  const AddNoteModelBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddNoteModelBottomSheet> createState() =>
      _AddNoteModelBottomSheetState();
}

class _AddNoteModelBottomSheetState extends State<AddNoteModelBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpace.p14),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              SizedBox(height: AppSize.s20),
              CustomTextField(
                  hint: AppStrings.titleTextFiled,
                  onSaved: (value) {
                    title = value;
                  }),
              SizedBox(height: AppSize.s16),
              CustomTextField(
                hint: AppStrings.contentTextFiled,
                maxLines: 5,
                onSaved: (value) {
                  description = value;
                },
              ),
              buildButtonAdd(context)
            ],
          ),
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
        onPressed: onAddNote,
        style:
            ElevatedButton.styleFrom(backgroundColor: ColorManager.textField),
        child: Text(
          AppStrings.nameButtonAdd,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }

  void onAddNote() {
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
    }else{
      autoValidateMode=AutovalidateMode.always;

    }
  }
}
