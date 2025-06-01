import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String url = 'https://fanzvar.inom-techs.com/api/auth/login';

  Future<void> fetchData() async {
    try {
      // البيانات المطلوبة
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': 'mohamedahsmed@gmail.com',
          'password': 'password123',
        }),
      );

      // إذا كان الطلب ناجحًا
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print('البيانات المسترجعة: $data');
      } else {
        print('فشل في جلب البيانات: ${response.statusCode}');
      }

    } catch (e) {
      print('خطأ: $e');
    }
  }
}
