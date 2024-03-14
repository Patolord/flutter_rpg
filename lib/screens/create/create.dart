import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  //submit handler
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      print('name must not be empty');
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      print('slogan must not be empty');
      return;
    }
    print('name: ${_nameController.text}');
    print('slogan: ${_sloganController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const StyledTitle('Character Creation'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // welcome message
                Center(
                  child: Icon(Icons.code, color: AppColors.primaryColor),
                ),
                const Center(
                  child: StyledHeading('Welcome, new player.'),
                ),
                const Center(
                  child:
                      StyledText('Create a name & slogan for your character'),
                ),
                const SizedBox(height: 30),

                //input for name and slogan
                TextField(
                    controller: _nameController,
                    cursorColor: AppColors.textColor,
                    style: GoogleFonts.kanit(
                        textStyle: Theme.of(context).textTheme.bodyMedium),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_2),
                        label: StyledText('Character Name'))),
                const SizedBox(height: 20),
                TextField(
                    controller: _sloganController,
                    cursorColor: AppColors.textColor,
                    style: GoogleFonts.kanit(
                        textStyle: Theme.of(context).textTheme.bodyMedium),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.chat),
                        label: StyledText('Character Slogan'))),
                const SizedBox(height: 30),

                //select vocation title
                Center(
                  child: Icon(Icons.code, color: AppColors.primaryColor),
                ),
                const Center(
                  child: StyledHeading('Choose a Vocation'),
                ),
                const Center(
                  child: StyledText('This will determine your starting stats.'),
                ),
                const SizedBox(height: 30),

                //vocation cards
                const VocationCard(vocation: Vocation.junkie),
                const VocationCard(vocation: Vocation.ninja),
                const VocationCard(vocation: Vocation.raider),
                const VocationCard(vocation: Vocation.wizard),

                Center(
                    child: StyledButton(
                        onPressed: handleSubmit,
                        child: const StyledHeading('Create Character'))),
              ],
            ),
          ),
        ));
  }
}
