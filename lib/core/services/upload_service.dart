import 'package:dio/dio.dart';
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
        // contentType: MediaType.parse('text/plain'),
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
        narrService.routerService.popUntil(
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
}
