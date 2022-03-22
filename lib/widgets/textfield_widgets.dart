import 'package:flutter/material.dart';
import 'package:owlmovie/constant/utils.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    required this.isPass,
    required this.hintext,
    required this.style,
    this.controller,
    required this.textInputType,
    this.validator,
    this.onSaved,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final String hintext;
  final TextInputType textInputType;
  final bool isPass;
  final TextStyle style;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      cursorColor: Colors.black,
      obscureText: widget.isPass,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      style: poppinsLight,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 5.0),
        fillColor: const Color(0xff008797).withOpacity(0.06),
        filled: true,
        hintText: widget.hintext,
        hintStyle: widget.style,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xffA9BCCF).withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xffA9BCCF).withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
