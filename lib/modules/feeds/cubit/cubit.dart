import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'states.dart';
import 'package:fanzhashem/models/posts_model.dart';

class FeedsCubit extends Cubit<FeedsStates> {
  FeedsCubit() : super(Initial());

  static FeedsCubit get(context) => BlocProvider.of(context);

  List<Post>? posts;

  final String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2Zhbnp2YXIuaW5vbS10ZWNocy5jb20vYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE3NDcwNjY0MDYsImV4cCI6MTc0OTY1ODQwNiwibmJmIjoxNzQ3MDY2NDA2LCJqdGkiOiJxbDNQRmpoaHFNQ1FlU3dJIiwic3ViIjoiMyIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.U6qo3NnIwK1kLC2FmqjY--NbQOok7jcRB62dX_VH5NU';

  Future<void> getFeedsData(title) async {
    emit(IsLoading());
    try {
      final url = Uri.parse('https://fanzvar.inom-techs.com/api/reels');
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2Zhbnp2YXIuaW5vbS10ZWNocy5jb20vYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE3NDcwNjY0MDYsImV4cCI6MTc0OTY1ODQwNiwibmJmIjoxNzQ3MDY2NDA2LCJqdGkiOiJxbDNQRmpoaHFNQ1FlU3dJIiwic3ViIjoiMyIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.U6qo3NnIwK1kLC2FmqjY--NbQOok7jcRB62dX_VH5NU',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final postsmodel = FeedsModel.fromJson(data);
        posts = postsmodel.posts;
        emit(DataLoaded());
      } else {
        emit(FanBookError("فشل تحميل البيانات: رمز الحالة ${response.statusCode}"));
      }
    } catch (e) {
      emit(FanBookError("حدث خطأ: $e"));
    }
  }
}
