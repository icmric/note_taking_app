import '/controllers/canvas_controller.dart';
import '/widgets/canvas/canvas_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Widget that displays the canvas area where users can interact with text fields.
// It uses InteractiveViewer for zooming and panning, and handles tap events to add new text fields.
class CanvasArea extends StatelessWidget {
  const CanvasArea({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the CanvasController using Provider.
    final canvasController = Provider.of<CanvasController>(context);
    final canvasPageData = canvasController.canvasPageData;

    return Expanded(
      child: InteractiveViewer(
        constrained: false, // Allows the canvas to be larger than the screen.
        boundaryMargin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20), // Sets the boundary margin for panning.
        transformationController: canvasController.transformationController, // Controller for handling transformations.
        child: SizedBox(
          width: canvasPageData.canvasSize.width,
          height: canvasPageData.canvasSize.height,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent, // Allows taps to go through to the canvas.
            onTapDown: canvasController.handleTapDown, // Handles tap down events to add new text fields.
            child: Stack(
              children: [
                CanvasBackground(canvasSize: canvasPageData.canvasSize), // Draws the background grid.
                ...canvasPageData.textFields, // Displays the draggable text fields.
              ],
            ),
          ),
        ),
      ),
    );
  }
}
