import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/business_logic/add_note/add_note_cubit.dart';
import 'package:notes_app/business_logic/add_note/add_note_state.dart';
import 'package:notes_app/data/model/note_model.dart';
import 'package:notes_app/presentation/resources/color_manager.dart';
import 'package:notes_app/presentation/resources/values_manager.dart';
import 'package:notes_app/presentation/widgets/CustomTextField.dart';

import '../resources/strings_manager.dart';

class AddNoteModelBottomSheet extends StatefulWidget {


  const AddNoteModelBottomSheet({super.key});

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
    return BlocProvider(
      create: (_)=>AddNoteCubit(),
      child: Container(
        padding: EdgeInsets.all(AppSpace.p14),
        decoration: BoxDecoration(
          color: Theme
              .of(context)
              .canvasColor,
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
            listener: (context, state) {
              if (state is AddNoteFailedState) {
                print('failed =>${state.errorMessage}');
              }
              if (state is AddNoteSuccessState) {
                Navigator.pop(context);
              }
            },
          builder: (context,state){
           return ModalProgressHUD(
              inAsyncCall: state is AddNoteLoadingState ? true : false,
              child: Form(
                key: _formKey,
                autovalidateMode: autoValidateMode,
                child: SingleChildScrollView(
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
          },

      )),
    );
    }

  Container buildButtonAdd(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 20),
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            Note note = Note(
                title: title,
                description: description,
                date: 'date',
                color: Colors.teal.value);
            BlocProvider.of<AddNoteCubit>(context).addNote(note);
          } else {
            autoValidateMode = AutovalidateMode.always;
          }
        },
        style:
        ElevatedButton.styleFrom(backgroundColor: ColorManager.textField),
        child: Text(
          AppStrings.nameButtonAdd,
          style: Theme
              .of(context)
              .textTheme
              .titleMedium,
        ),
      ),
    );
  }
}
