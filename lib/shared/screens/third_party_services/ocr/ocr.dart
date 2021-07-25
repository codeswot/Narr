import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:narr/shared/screens/third_party_services/ocr/uploadOcr.dart';
import 'package:narr/shared/widgets/cards/ocr_card.dart';

class OCRScreen extends StatefulWidget {
  @override
  _OCRScreenState createState() => _OCRScreenState();
}

class _OCRScreenState extends State<OCRScreen> {
  late File _pickedImage;
  String _pickedSImage = '';
  final picker = ImagePicker();
  bool isFileSelected = false;
  String imageFileName = '';
  String selectedImageFile = '';
  String imageExtension = '';
  Dio dio = Dio();

  Future _cameraImage() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 30);

    if (pickedFile != null) {
      _pickedImage = File(pickedFile.path);
      _pickedSImage = pickedFile.path;
      print('Picked String file: $_pickedSImage');
      setState(() {
        isFileSelected = true;
      });
//pass param to next screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return UploadOcr(
            imagePicked: _pickedSImage,
            pickedCameraImage: _pickedImage,
            selectedFile: _pickedSImage, onSendProgress: () {},
            // onSendProgress: onSendProgress(bytesSent, bytesTotal),
          );
        }),
      );
    }
  }

//
  Future<String> _galleryImage() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 30);
    if (pickedFile != null) {
      _pickedImage = File(pickedFile.path);
      _pickedSImage = pickedFile.path;
      print('Picked String file :: $_pickedSImage');
      setState(() {
        isFileSelected = true;
      });
//pass param to next screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return UploadOcr(
            imagePicked: _pickedSImage,
            pickedCameraImage: _pickedImage,
            selectedFile: _pickedSImage,
            onSendProgress: () {},
          );
        }),
      );
    }

    return imageExtension;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text(
          'OCR',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2.5),
                color: Colors.black.withOpacity(0.15),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Text(
                  'Select Picture Upload Method',
                  style: TextStyle(
                    color: Color(0xff00a368),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _cameraImage();
                    },
                    child: OcrCard(
                      icon: Icons.camera_alt,
                      cardTitle: 'Take Photo',
                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      _galleryImage();
                    },
                    child: OcrCard(
                      icon: Icons.photo,
                      cardTitle: 'Select from photos',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
