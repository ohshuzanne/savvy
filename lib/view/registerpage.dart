import 'package:flutter/material.dart';
import 'package:savvy/utils/colors.dart';
import 'package:savvy/components/showdialog.dart';
import 'package:savvy/components/textfield.dart';
import 'package:savvy/components/buttons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:savvy/components/gradient_background.dart';
import 'package:savvy/components/panelwidget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isToggled = false;
  final panelController = PanelController();
  String? selectedPet;
  final PageController _pageController = PageController();
  final List<String> imagePaths = [
    'lib/images/3dpuppy.png',
    'lib/images/3dcat.png',
  ];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void selectPet(String pet) {
    setState(() {
      selectedPet = pet;
    });
    Navigator.pop(context);
  }

  void showPetSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Select Your Pet"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Puppy"),
                onTap: () => selectPet("Puppy"),
              ),
              ListTile(
                title: Text("Cat"),
                onTap: () => selectPet("Cat"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.5;
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.8;
    return Scaffold(
      //appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: darkGrey,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 16,
          ),
        ),
        title: const Text(
          "Register",
          style: TextStyle(
            fontFamily: 'Lexend',
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: lighterBlue,
      //panel
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            BackgroundShapesState(),

            // Pet scrolling widget
            Positioned(
              top: 30, // Adjust the position to the bottom of the Stack
              left: 0,
              right: 0,
              child: Container(
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: imagePaths.length,
                      itemBuilder: (context, index) => Image.asset(
                        imagePaths[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                    // Left button
                    Positioned(
                      left: 24,
                      child: buildButton(Icons.arrow_back_ios_rounded, () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }),
                    ),
                    // Right button
                    Positioned(
                      right: 24,
                      child: buildButton(Icons.arrow_forward_ios_rounded, () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),

            //button
            PrimaryButton(
                onTap: () {},
                buttonText: "Select",
                buttonColor: backgroundWhite,
                borderColor: backgroundWhite,
                textColor: darkGrey,
                borderRadius: 25,
                splashColor: primaryPurple),
            SlidingUpPanel(
              controller: panelController,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              maxHeight: panelHeightOpen,
              minHeight: panelHeightClosed,
              color: backgroundWhite,
              body: SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              panelBuilder: (controller) => PanelWidget(
                controller: controller,
                dragHandleColor: darkGrey.withOpacity(0.4),
                panelController: panelController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildButton(IconData icon, VoidCallback onTap) {
  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      color: backgroundWhite,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: darkBlue.withOpacity(0.6),
          offset: const Offset(0, 1),
          blurRadius: 7,
        ),
      ],
    ),
    child: IconButton(
      icon: Icon(icon, color: darkBlue, size: 18),
      onPressed: onTap,
    ),
  );
}
