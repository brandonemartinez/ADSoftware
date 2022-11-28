import 'package:flutter/material.dart';
import 'package:home_life/src/util/utils.dart';

class PrimaryTextField extends StatefulWidget {
  const PrimaryTextField({
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    bool? filled,
    bool? obscureText,
    bool? readOnly,
    this.onTap,
    this.readOnlyText,
    this.validator,
    this.onSaved,
    bool? isEmail,
    int? maxLines,
  })  : filled = filled ?? false,
        obscureText = obscureText ?? false,
        readOnly = readOnly ?? false,
        isEmail = isEmail ?? false,
        maxLines = maxLines ?? 1,
        super();

  final String label;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool filled;
  final bool obscureText;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? readOnlyText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final bool isEmail;
  final int maxLines;

  @override
  _PrimaryTextFieldState createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  late TextEditingController _controller;

  String? get value => _controller.text;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    if (widget.readOnly == true && widget.readOnlyText != null) {
      _controller.text = widget.readOnlyText!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      controller: _controller,
      readOnly: widget.readOnly,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        filled: widget.filled,
        fillColor: Colors.white,
        border: border,
        prefixIcon: Icon(
          widget.prefixIcon,
        ),
        label: Text(
          widget.label,
        ),
        suffixIcon: widget.suffixIcon,
      ),
      onTap: widget.onTap,
      validator: widget.validator,
      onSaved: widget.onSaved,
      keyboardType:
          widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
    );
  }
}
