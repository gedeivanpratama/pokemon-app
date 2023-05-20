import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchToggleProvider = StateProvider<bool>((ref) {
  return false;
});

final textFieldProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

final isTextfiledEmptyProvider = Provider<bool>((ref) {
  final textfield = ref.watch(textFieldProvider);
  return textfield.text.isEmpty;
});
