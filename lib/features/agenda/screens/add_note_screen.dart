import 'package:flutter/material.dart';

import 'package:mocha/common/widgets/CustomButton.dart';
import 'package:mocha/common/widgets/CustomTextField.dart';
import 'package:mocha/constants/global_variables.dart';

import 'package:mocha/features/agenda/services/add_note_service.dart';
import 'package:mocha/features/agenda/screens/agenda_screen.dart';

class AddNoteScreen extends StatefulWidget {
  static const String routeName = '/add-note-screen';

  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreen();
}

class _AddNoteScreen extends State<AddNoteScreen> {
  final AddNoteService addNoteService = AddNoteService();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  void addNote() {
    addNoteService.addNote(
      context: context,
      title: _titleController.text,
      description: _descriptionController.text,
    );
    _titleController.clear();
    _descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AgendaScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      primary: Colors.blue,
                    ),
                    child: const Icon(Icons.arrow_back_rounded),
                  ),
                ),
                const Text(
                  'Add Note',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: GlobalVariables.backgroundColor,
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: _titleController,
                      hintText: "Title",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: _descriptionController,
                      hintText: "Description",
                      maxLines: 7,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        text: "Add Note",
                        onTap: () {
                          addNote();
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
