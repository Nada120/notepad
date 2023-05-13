import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, this.maxLine=1, this.onSaved, this.onChange});
  
  final String hintText;
  final int maxLine;  
  final void Function(String?)? onSaved;
  final void Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      child: TextFormField(
        onSaved: onSaved,
        onChanged: onChange,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Field is required';
          }
          else {
            return null;
          }
        },
        maxLines: maxLine,
        cursorColor: const Color(0xff04aa6d),
        decoration: InputDecoration(
          hintText: hintText,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(const Color(0xff04aa6d)),
        ),
      ),
    );
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: color ?? Colors.white,
    ),
  );
}