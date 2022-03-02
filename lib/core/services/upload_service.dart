import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
// ignore: import_of_legacy_library_into_null_safe
import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/material.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:narr/shared/screens/third_party_services/ocr/ocr_result.dart';
import 'package:path/path.dart';

class UploadService {
  //upload image
  Future uploadPhoto({
    required String uploadurl,
    required String selectedfile,
    required Function(int, int) onSendProgress,
    required BuildContext context,
  }) async {
    FormData formdata = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        selectedfile,
        filename: basename(selectedfile),
      ),
    });
    try {
      Response response = await dio.post(
        uploadurl.toString(),
        data: formdata,
        onSendProgress: onSendProgress,
        options: Options(headers: {
          'Accept': 'text/plain',
          'x-token': '${currentUser.token}'
        }),
      );

      if (response.statusCode == 200) {
        print('response ${response.toString()}');
        narrService.routerService.popReplaceRoute(
          context,
          OcrResult(
            response: response,
            selectedFile: '',
            imagePicked: '',
            headers: {},
          ),
        );
        narrService.dialogInfoService
            .showToast('${basename(selectedfile)} file converted successfully');
      } else {
        print("Error Converting to text");
      }
    } catch (err) {
      print(err);
      narrService.dialogInfoService.showToast('Error while converting to text');
    }
  }

  //
  File pickedFile = File('');
  List<int> bytes = [];
  dynamic recieved = 0;
  int total = 0;

  //document convertion
  Future documentConvertion(
      {String filePath = '',
      String fileName = '',
      String url = '',
      required BuildContext context}) async {
    try {
      Map<String, String> headers = {"x-token": "${currentUser.token}"};
      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(headers);
      request.files.add(
        await http.MultipartFile.fromPath('file', filePath),
      );
      var res = await request.send();
      //works at once
      total = res.contentLength!;
      print('start size before write $recieved');
      if (res.contentLength == 0) {
        return res.contentLength;
      }

      String getDir = await ExtStorage.getExternalStorageDirectory();
      String folderToSaveConver = 'Narr/Converted';
      String fileToSave = fileName;
      Directory fullFolderDirToSave = Directory('$getDir/$folderToSaveConver');

      if (await fullFolderDirToSave.exists()) {
        res.stream.listen(
          (value) async {
            bytes.addAll(value);
            recieved += value.length;
          },
        ).onDone(() async {
          final fileToWrite = File(
            '${fullFolderDirToSave.path}/${fileToSave.split('.')[0]}.pdf',
          );
          await fileToWrite.writeAsBytes(bytes);
          print('start size after write  $recieved');
          print('total size $total');
          pickedFile = fileToWrite;
          if (recieved == total) {
            print('ok');
            // bytes.clear();
            recieved = 0;
          } else if (recieved < total) {
            print('less bytes');
          } else {
            print('too much');
          }
        });

        print('file path => ${pickedFile.path}');
        print(
            'status code ::==> ${res.statusCode} and reason phrase ::==> ${res.reasonPhrase}');
      } else {
        await fullFolderDirToSave.create(recursive: true);
      }
    } catch (e) {
      print(e);
    }
  }

  //research Upload
  Future researchUpload(
      {required String url, required Map<String, dynamic> requestBody}) async {
    FormData data = FormData.fromMap(requestBody);
    try {
      Response response = await Dio().post(
        url.toString(),
        data: data,
        onSendProgress: (int sent, int total) {
          print('$sent / $total');
        },
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
          headers: {'Accept': 'text/plain', 'x-token': '${currentUser.token}'},
        ),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.toString());
        print(data);
        return data;
      } else {
        var data = jsonDecode(response.toString());
        narrService.dialogInfoService.showToast('${data['message']}');
        print(data);
        return data;
      }
    } catch (err) {
      print('research upload error >> $err');
      narrService.dialogInfoService.showToast(err.toString());
    }
  }
}
