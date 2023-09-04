import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_project/comp.dart/animated_navigator.dart';
import 'package:note_project/models/note.dart';
import 'package:note_project/modules/cubit/notes_cubit.dart';
import 'package:note_project/pages/add_note_page.dart';
import 'package:note_project/services/note_services.dart';

import '../comp.dart/comp_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: BlocConsumer<NotesCubit, NotesState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NotesCubit.get(context);
          var data = cubit.readTheData();
          int? index = cubit.legthNotes;
          debugPrint('fffffff $index');
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                  ),
                  const Text(
                    'Notepad',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      focusColor: Colors.amber,
                      hintText: 'Search notes',
                      prefixIcon: const Icon(
                        Icons.search_outlined,
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  //show list of nodes here
                  // first check if there is any item in database
                  index == 0
                      ? Center(
                          child: Text(
                            'Add Notes',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        )
                      : buildNotesList(
                          itemsNumber: index,
                          title: data[index]['title'],
                          subtitle: data[index]['createdTime'],
                        ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: () {
                animatedNavigator(
                  context: context,
                  page: const AddNewNote(),
                );
              },
              child: const Icon(
                Icons.add,
                color: Colors.black,
                size: 40,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildNotesList({
    required int itemsNumber,
    required String title,
    required String subtitle,
  }) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          myListTile(title: title, subtitle: subtitle),
      separatorBuilder: (context, index) => SizedBox(
        height: MediaQuery.of(context).size.height / 60,
      ),
      itemCount: itemsNumber,
    );
  }
}
