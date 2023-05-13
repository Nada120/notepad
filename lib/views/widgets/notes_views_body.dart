import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'custom_app_bar.dart';
import 'note_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomAppBar(
          title: 'Notes', 
          icon: Icons.search,
        ),
        Expanded(
          child: NotesListView(),
        ),
      ],
    );
  }
}

