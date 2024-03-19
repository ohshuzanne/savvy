import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final Color dragHandleColor;
  final PanelController panelController;

  const PanelWidget({
    Key? key,
    required this.controller,
    required this.dragHandleColor,
    required this.panelController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.all(10),
        controller: controller,
        children: <Widget>[
          SizedBox(height: 36),
          buildDragHandle(),
          SizedBox(height: 36),
          buildAboutText(),
          SizedBox(height: 24),
        ],
      );
  Widget buildDragHandle() => GestureDetector(
        child: Center(
          child: Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: dragHandleColor,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
          ),
        ),
        onTap: togglePanel,
      );

  void togglePanel() => panelController.isPanelOpen
      ? panelController.close()
      : panelController.open();

  Widget buildAboutText() => Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Spending and Saving"),
            const SizedBox(height: 20),
            Text(
              "It's important to understand why it's so crucial that you start saving as early on in your life as possible, so here's a lesson for you to learn today:... Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            ),
            Text(
              "It's important to understand why it's so crucial that you start saving as early on in your life as possible, so here's a lesson for you to learn today:... Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            ),
          ],
        ),
      );
}
