import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:voicenotesapp/constants/constants.dart';
import 'package:voicenotesapp/utils/utilities.dart';
import 'package:voicenotesapp/widgtes/detailsField.dart';
import 'package:voicenotesapp/widgtes/titleField.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  final titleController = TextEditingController();
  final detailsController = TextEditingController();

  User? userId=FirebaseAuth.instance.currentUser;

  addNote()async{
    await FirebaseFirestore.instance.collection("notes").doc().set({
      "title":titleController.text,
      "details":detailsController.text,
      "createdAt":DateTime.now(),
      "uid":userId?.uid
    });
    Utils().toasteMessage('Note Added');
    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.background,
      appBar: AppBar(
        backgroundColor: darkShadow,
        centerTitle: true,
        title: Text(
          'Add Note',
          style: TextStyle(
            color: theme.onPrimaryContainer,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        iconTheme: IconThemeData(color: theme.onPrimaryContainer),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: addNote,
            color: theme.onPrimaryContainer,
          ),
        ],
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TitleField(controller: titleController, focus: true),
              DetailsField(controller: detailsController)
            ],
          ),
        ),
      ),

    );
  }
}
