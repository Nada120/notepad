import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_project/modules/cubit/notes_cubit.dart';

import '../models/my_button_nav.dart';
import '../models/note.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({super.key});

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  var titleController = TextEditingController();
  var desController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var timeNow = DateFormat('MMM d, h:mm a').format(DateTime.now());
  final List<String> importace = ['high', 'moderate', 'low'];
  final List<Color> importaceColor = [Colors.green, Colors.yellow, Colors.red];
  Color selectedColor = Colors.amber;
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: BlocConsumer<NotesCubit, NotesState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NotesCubit.get(context);
          return addNewNote(
            process: () {
              if (formKey.currentState!.validate()) {
                var note = Note(
                  title: titleController.text, 
                  content: desController.text,
                  importance: selectedItem == null ? 'low': selectedItem!,
                  createdTime: timeNow, 
                  lastUpdated: timeNow,
                );
                cubit.saveTheData(note);
                Navigator.pop(context);
              }
            }
          );
        },
      ),
    );
  }

  Widget addNewNote({required void Function()? process}) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.amber,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Note',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.list),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Text(
                timeNow.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.53,
                    child: TextFormField(
                      controller: titleController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Can Not Be Empty';
                        }
                        return null;
                      },
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Title',
                        border: InputBorder.none,
                        focusColor: Colors.amber,
                        hintStyle: TextStyle(
                          fontSize: 45,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedColor,
                    ),
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Center(
                      child: DropdownButton<String>(
                        items: importace
                            .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                ))
                            .toList(),
                        hint: const Text(
                          'Importance',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        value: selectedItem,
                        onChanged: (value) {
                          setState(() {
                            selectedItem = value!;
                            selectedColor =
                                importaceColor[importace.indexOf(value)];
                          });
                        },
                        underline: Container(),
                        icon: const Icon(
                          Icons.arrow_circle_down,
                          color: Colors.black,
                        ),
                        selectedItemBuilder: (context) => importace
                            .map((item) => Center(
                                  child: Text(item),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: desController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Can Not Be Empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Note something down',
                  focusColor: Colors.amber,
                  border: InputBorder.none,
                ),
                maxLines: null,
              ),
              const Expanded(child: SizedBox()),
              Center(
                child: ElevatedButton(
                  onPressed: process, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Save', 
                    style: TextStyle(
                      fontSize: 25, 
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade400,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              myButtonNavigator(
                iconName: Icons.add_a_photo,
                text: 'Albom',
                process: () {},
              ),
              myButtonNavigator(
                iconName: Icons.book,
                text: 'To-Do',
                process: () {},
              ),
              myButtonNavigator(
                iconName: Icons.notifications_none,
                text: 'Notification',
                process: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
