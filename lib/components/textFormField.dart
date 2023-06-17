import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  final String text;
  final IconData? icon;
  final bool isPasswordType;
  final TextEditingController controller;

  const TextFields({
    Key? key,
    required this.text,
    this.icon,
    required this.isPasswordType,
    required this.controller,
  }) : super(key: key);

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  bool isPasswordSeen = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText:
          widget.isPasswordType ? isPasswordSeen : widget.isPasswordType,
      enableSuggestions: !widget.isPasswordType,
      autocorrect: !widget.isPasswordType,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white.withOpacity(0.9)),
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.icon,
          color: Colors.white70,
        ),
        suffixIcon: widget.isPasswordType
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordSeen = !isPasswordSeen;
                  });
                },
                icon: isPasswordSeen
                    ? const Icon(
                        Icons.visibility_off,
                        size: 24,
                        color: Colors.black26,
                      )
                    : const Icon(
                        Icons.visibility,
                        size: 24,
                        color: Colors.black26,
                      ),
              )
            : null,
        labelText: widget.text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
        ),
      ),
      keyboardType: widget.isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    );
  }
}
