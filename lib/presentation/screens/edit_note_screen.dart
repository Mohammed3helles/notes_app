import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/business_logic/get_note/get_note_cubit.dart';
import 'package:notes_app/data/model/note_model.dart';
import 'package:notes_app/presentation/resources/strings_manager.dart';
import 'package:notes_app/presentation/widgets/CustomTextField.dart';
import 'package:notes_app/presentation/widgets/custom_appBar.dart';

import '../resources/values_manager.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({Key? key, required this.note}) : super(key: key);
  final Note note;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  String? title, description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpace.p24),
        child: Column(
          children: [
            SizedBox(height: AppSize.s50),
            CustomAppBar(
                onTap: () {
                  widget.note.title=title??widget.note.title;
                  widget.note.description=description??widget.note.description;
                  widget.note.save();
                  BlocProvider.of<GetNoteCubit>(context).getNotes();
                  Navigator.pop(context);
                },
                title: AppStrings.editeNote,
                iconData: Icons.check),
            SizedBox(height: AppSize.s24),
            CustomTextField(
              hint: AppStrings.titleTextFiled,
              onChange: (value) {
                title = value;
              },
            ),
            SizedBox(height: AppSize.s16),
            CustomTextField(
              hint: AppStrings.contentTextFiled,
              maxLines: 5,
              onChange: (value) {
                description = value;
              },
            ),
            //
          ],
        ),
      ),
    );
  }
}
