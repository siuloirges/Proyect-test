import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:proyect_test/src/modules/posts/model/post_model.dart';
import 'package:proyect_test/src/utils/providers/http_provider.dart';

class PostsProvider extends ChangeNotifier {

  final String _url = "https://jsonplaceholder.typicode.com/";
   List<Post> _postsList = [];  

  List<Post> get getPostsList => _postsList;  

  PostsProvider(){
    getPosts();
  }

  dynamic getPosts() async {
    String _extencion = 'posts/';
    dynamic data = await HttpProvider().getMethod(_url+_extencion);

    final post = postFromJson(jsonEncode(data));
    _postsList = post;
    notifyListeners();
    // return data;
   }
   
 }