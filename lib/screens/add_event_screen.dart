
import 'dart:io';

import 'package:emergenciesevents/database/database_helper.dart';
import 'package:emergenciesevents/model/emergency_event.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {

  final _textController = TextEditingController();
  final _descriptionController = TextEditingController();
  File? _image;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _takePhoto() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveData() async {
    if ( _textController.text.isEmpty || _descriptionController.text.isEmpty || _image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text('Por favor llena todos los campos antes de guardar')));
    }

    final String currentDate = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());

    final newEvent = EmergencyEvent(
      title: _textController.text, 
      description: _descriptionController.text, 
      date: currentDate, 
      imagePath: _image!.path,
    );

    await DatabaseHelper.instance.insert(newEvent);

    if (mounted) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Evento 911'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: _takePhoto,
              child: Container(
                height: 220,
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: theme.colorScheme.primary.withOpacity(.5),
                    width: 2
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ]
                ),
                child: _image != null
                ? ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.file(_image!, fit: BoxFit.cover),
                )
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_a_photo_outlined,
                      size: 50,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(height: 12,),
                    Text('Capturar Evento', style: theme.textTheme.titleMedium,),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32,),
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Titulo de la Emergencia',
                prefixIcon: Icon(Icons.emergency),
              ),
            ),

            const SizedBox(height: 32,),
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Descripcion de la Emergencia',
                alignLabelWithHint: true
              ),
            ),

            const SizedBox(height: 32,),
            ElevatedButton.icon(
              onPressed: _saveData,
              icon: Icon(Icons.check_circle_outline), 
              label: const Text('Save Event'),),
          ],
      ),
      )
      
    );
  }

}
