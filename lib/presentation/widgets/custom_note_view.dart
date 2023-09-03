import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/presentation/resources/values_manager.dart';
import 'package:notes_app/presentation/widgets/custom_appBar.dart';
import 'package:notes_app/presentation/widgets/custom_list_view.dart';

import '../../business_logic/get_note/get_note_cubit.dart';

class CustomNoteView extends StatefulWidget {
  const CustomNoteView({Key? key}) : super(key: key);

  @override
  State<CustomNoteView> createState() => _CustomNoteViewState();
}

class _CustomNoteViewState extends State<CustomNoteView> {
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<GetNoteCubit>(context).getNotes();
 }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpace.p24),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: AppSize.s50),
          const CustomAppBar(
            iconData: Icons.search,
          ),
          const Expanded(
            child: CustomListView(),
          ),
        ],
      ),
    );
  }
}
