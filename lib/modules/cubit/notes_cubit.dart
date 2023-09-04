import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../models/note.dart';
import '../../services/note_services.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  
  static NotesCubit get (BuildContext context) {
    return BlocProvider.of(context);
  }
  
  int legthNotes = 0;
  readTheData() async {
    var allNotes = await NoteDatabase.instance.readAllNote();
    legthNotes = allNotes.length;
   // debugPrint('The length is: $legthNotes');
    emit(NotesLoaded());
    return allNotes;
  }
  
  saveTheData(Note note) async {
    await NoteDatabase.instance.create(note).then((_){
      debugPrint('The data is saved');
    });
    emit(NotesUpload());
  }

}
