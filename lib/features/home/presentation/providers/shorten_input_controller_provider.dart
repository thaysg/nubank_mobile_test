import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shorten_input_controller_provider.g.dart';

@riverpod
TextEditingController shortenInputController(Ref ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
}
