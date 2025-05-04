import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.nameController,
    required this.labelText,
    this.keyboardType,
    this.onSubmitted,
    required this.focusNode,
  });
  final void Function(String)? onSubmitted;
  final TextEditingController nameController;
  final FocusNode focusNode;
  final String labelText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final secondary = Theme.of(context).colorScheme.secondary;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return '$labelText is required';
          }
          return null;
        },
        focusNode: focusNode,
        onFieldSubmitted: onSubmitted,
        keyboardType: keyboardType,
        controller: nameController,
        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondary,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondary,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
