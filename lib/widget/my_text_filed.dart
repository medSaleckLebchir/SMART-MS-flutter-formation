import 'package:flutter/material.dart';

class MyTextFiled extends StatefulWidget {
  final String? hint;
  final bool hasIcon;
  final TextEditingController? controller;
  const MyTextFiled(
      {super.key, this.hint, this.hasIcon = false, this.controller});

  @override
  State<MyTextFiled> createState() => _MyTextFiledState();
}

class _MyTextFiledState extends State<MyTextFiled> {
  bool _obscureText = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
        ),
        suffixIcon: widget.hasIcon
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: _obscureText
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off))
            : null,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Champ vide !';
        }
        return null;
      },
    );
  }
}
