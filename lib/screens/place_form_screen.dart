import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purple_places/providers/great_places.dart';
import 'package:purple_places/widgets/image_input.dart';
import 'package:purple_places/widgets/location_input.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({Key? key}) : super(key: key);

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleController = TextEditingController();
  File _storedImage = File('');

  void _selectImage(File pickedImage) {
    _storedImage = pickedImage;
  }

  void _submit() {
    final title = _titleController.text;
    if (title.isEmpty || _storedImage.path == '') {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false).addPlace(
      title,
      _storedImage,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Novo Lugar'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: 'Nome do Lugar',
                        ),
                      ),
                      SizedBox(height: 10),
                      ImageInput(onSelectImage: this._selectImage),
                      SizedBox(height: 10),
                      LocationInput(),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              label: Text('Salvar'),
              icon: Icon(Icons.check),
              onPressed: _submit,
            ),
          ],
        ));
  }
}
