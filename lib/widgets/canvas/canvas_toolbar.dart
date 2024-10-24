import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class CanvasToolbar extends StatelessWidget {
  final QuillController? controller;

  const CanvasToolbar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200], // Example background color
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: controller != null ? QuillToolbar.simple(controller: controller) : _buildDisabledToolbar(),
    );
  }

  Widget _buildDisabledToolbar() {
    return Opacity(
      opacity: 0.5, // Make it semi-transparent
      child: QuillToolbar.simple(
        controller: QuillController.basic(), // Use a dummy controller
      ),
    );
  }
}