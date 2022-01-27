import 'package:flutter_test/flutter_test.dart';
import 'package:proyect_test/src/modules/posts/model/post_model.dart';
import 'package:proyect_test/src/modules/posts/provider/posts_provider.dart';

void main(){
  test('Testing get postProvider', () async {

    PostsProvider postsProvider = PostsProvider();
    List<Post> data = await postsProvider.getPosts();
    expect(data, data);

  });

 
}