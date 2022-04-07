import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({required this.onSelectImage, Key? key}) : super(key: key);
  final Function(File) onSelectImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage = File('');

  _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    XFile imageFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    ) as XFile;

    setState(() {
      _storedImage = File(imageFile.path);
    });
    widget.onSelectImage(_storedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: _storedImage.path != ''
              ? Image.file(
                  _storedImage,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Text('Nenhuma imagem selecionada', textAlign: TextAlign.center,),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            icon: Icon(Icons.camera),
            label: Text('Tirar foto'),
            onPressed: _takePicture,
          ),
        ),
      ],
    );
  }
}
