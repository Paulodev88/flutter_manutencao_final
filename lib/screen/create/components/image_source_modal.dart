import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModal extends StatelessWidget {
  ImageSourceModal(this.onImageSelected);
  final Function(File) onImageSelected;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid)
      return BottomSheet(
        onClosing: () {},
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: getFromCamera,
              child: const Text("Câmera"),
            ),
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: getFromGallery,
              child: const Text("Galeria"),
            )
          ],
        ),
      );
    else
      return CupertinoActionSheet(
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "Cancelar",
            style: TextStyle(color: Colors.red),
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: getFromCamera,
            child: const Text("Câmera"),
          ),
          CupertinoActionSheetAction(
            onPressed: getFromGallery,
            child: const Text("Galeria"),
          )
        ],
      );
  }

  Future<void> getFromCamera() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);

    if (pickedFile == null) return;
    final image = File(pickedFile.path);
    imageSelected(image);
  }

  Future<void> getFromGallery() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    final image = File(pickedFile.path);
    imageSelected(image);
  }

  Future<void> imageSelected(File image) async {
    final croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: "Editar Imagem",
          toolbarColor: Colors.blue[700],
          toolbarWidgetColor: Colors.white),
      iosUiSettings: IOSUiSettings(
          title: "Editar Imagem",
          cancelButtonTitle: "Cancelar",
          doneButtonTitle: "Concluir"),
    );
    if (croppedFile != null) onImageSelected(croppedFile);
  }
}
