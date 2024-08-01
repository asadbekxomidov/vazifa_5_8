import 'package:dio/dio.dart';
import 'dart:io';

class UploadService {
  Future<void> uploadBookFile(String filePath) async {
    try {
      final dio = Dio();

      final file = File(filePath);
      final formData = FormData.fromMap(
        {
          "file": MultipartFile.fromBytes(
            file.readAsBytesSync(),
            filename: "book.pdf",
          ),
        },
      );

      final response = await dio.post(
        "https://api.escuelajs.co/api/v1/files/upload",
        data: formData,
        onSendProgress: (count, total) {
          print("${(count / total * 100).toStringAsFixed(0)}% uploaded");
        },
      );

      print(response.data);
    } on DioException catch (e) {
      print(e.response?.data);
    } catch (e) {
      print(e.toString());
    }
  }
}
