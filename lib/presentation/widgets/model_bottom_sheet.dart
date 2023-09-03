import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/business_logic/add_note/add_note_cubit.dart';
import 'package:notes_app/business_logic/add_note/add_note_state.dart';
import 'package:notes_app/data/model/note_model.dart';
import 'package:notes_app/presentation/resources/color_manager.dart';
import 'package:notes_app/presentation/resources/values_manager.dart';
import 'package:notes_app/presentation/widgets/CustomTextField.dart';
import 'package:intl/intl.dart';

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
      create: (_) => AddNoteCubit(),
      child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
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
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.all(AppSize.s14),
                child: AbsorbPointer(
                  absorbing: state is AddNoteLoadingState ? true : false,
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
                          buildButtonAdd(
                            ctx: context,
                            isLoading:
                                state is AddNoteLoadingState ? true : false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }

  Container buildButtonAdd(
      {required BuildContext ctx, required bool isLoading}) {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 20),
      width: MediaQuery.of(ctx).size.width,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            String currentDate = DateFormat.yMd().format(DateTime.now());
            Note note = Note(
                title: title,
                description: description,
                date: currentDate,
                color: Color.fromRGBO(
                  Random().nextInt(254),
                  Random().nextInt(254),
                  Random().nextInt(254),
                  1,
                ).value);
            BlocProvider.of<AddNoteCubit>(ctx).addNote(note);
          } else {
            autoValidateMode = AutovalidateMode.always;
          }
        },
        style:
            ElevatedButton.styleFrom(backgroundColor: ColorManager.textField),
        child: isLoading
            ? SizedBox(
                height: AppSize.s24,
                width: AppSize.s24,
                child: const CircularProgressIndicator(
                  strokeWidth: 1.5,
                  color: ColorManager.black,
                ),
              )
            : Text(
                AppStrings.nameButtonAdd,
                style: Theme.of(ctx).textTheme.titleMedium,
              ),
      ),
    );
  }
}
