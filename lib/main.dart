import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/business_logic/get_note/get_note_cubit.dart';
import 'package:notes_app/presentation/resources/routes_manager.dart';
import 'package:notes_app/presentation/resources/theme_manager.dart';
import 'package:notes_app/presentation/resources/values_manager.dart';
import 'package:notes_app/simple_bloc_observer.dart';

import 'data/model/note_model.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>(kNoteBox);
  runApp(
    const NoteApp(),
  );
}

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetNoteCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getTheme(),
        onGenerateRoute: AppRoute.getGenerateRoutes,
      ),
    );
  }
}
