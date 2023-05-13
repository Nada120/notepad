import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          process: (){
            var currentDate = DateTime.now();
            String formattedDate = formatDate(currentDate, [dd,' ',MM,'-',yyyy]);
            widget.note.title = title ?? widget.note.title;
            widget.note.content = content ?? widget.note.content;
            if(title != null || content != null) {
              widget.note.date = formattedDate;
            }
            widget.note.save();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          },
          title: 'Edit Note', 
          icon: Icons.check,
        ),
        CustomTextField(
          onChange: (value){
            title = value;
          },
          hintText: widget.note.title,
        ),
        CustomTextField(
          onChange: (value){
            content = value;
          },
          hintText: widget.note.content,
          maxLine: 6,
        ),
      ],
    );
  }
}