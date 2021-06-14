import 'package:bloc/bloc.dart';
import 'package:weatherblocapp/post.dart';

import 'data_services.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _dataServices = DataServices();

  PostsCubit() : super([]);

  void getPosts() async => emit(await _dataServices.getPosts());
}
