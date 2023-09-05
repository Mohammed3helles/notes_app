import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/business_logic/get_note/get_note_cubit.dart';
import 'package:notes_app/presentation/resources/color_manager.dart';
import 'package:notes_app/presentation/resources/routes_manager.dart';

import '../../data/model/note_model.dart';
import '../resources/values_manager.dart';

class NoteItem extends StatelessWidget {
  final Note note;

  const NoteItem({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppRoute.editScreen,arguments: note),
      child: Container(
        margin: EdgeInsets.only(top: AppSize.s10),
        padding: EdgeInsets.only(
          top: AppSpace.p20,
          bottom: AppSpace.p20,
          right: AppSpace.p16,
          left: AppSpace.p24,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(note.color ?? 0),
            borderRadius: BorderRadius.circular(AppSize.s22)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                note.title.toString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Padding(
                padding:
                    EdgeInsets.only(top: AppSpace.p16, bottom: AppSpace.p14),
                child: Text(
                  note.description.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<GetNoteCubit>(context).getNotes();
                  },
                  splashColor: Colors.red.withOpacity(0.7),
                  icon: Icon(
                    Icons.delete,
                    color:note.color==Colors.red.value?ColorManager.white:Colors.red,
                    size: AppSize.s30,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: AppSpace.p16,
                right: AppSpace.p8,
              ),
              child: Text(
                note.date.toString(),
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}
