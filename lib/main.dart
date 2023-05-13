import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/views/notes_views.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/views/widgets/splash_view.dart';
import 'cubits/notes/notes_cubit.dart';
import 'models/note_model.dart';
import 'simple_bloc_observer.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes_box');

  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: AnimatedSplashScreen(
          splash:  const SplashView(),
          splashIconSize: 500,
          animationDuration: const Duration(milliseconds: 600),
          splashTransition: SplashTransition.scaleTransition,
          pageTransitionType: PageTransitionType.fade,
          nextScreen: const NotesViews(),
        ),
      ),
    );
  }
}
