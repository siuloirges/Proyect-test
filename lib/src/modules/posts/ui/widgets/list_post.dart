import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_test/src/modules/posts/provider/posts_provider.dart';
import 'package:proyect_test/src/modules/posts/model/post_model.dart';
import 'package:proyect_test/src/utils/components/ui/styles/styles.dart';

class PostsList extends StatefulWidget {
  const PostsList({Key key}) : super(key: key);

  @override
  State<PostsList> createState() => PostsListState();
}

class PostsListState extends State<PostsList> {

  PostsProvider postsProvider;

  @override
  Widget build(BuildContext context) {
     postsProvider = Provider.of<PostsProvider>(context);
   
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: postsProvider.getPostsList.isEmpty ? loading() : viewPost(),
      ),
    );
  }

  Widget viewPost(){
   List<Widget> widgets = [];

   double delay = 20; 
   for (var element in postsProvider.getPostsList) { 
     widgets.add(post(element,delay));
     delay+= 20;
   }

   return SingleChildScrollView(child: Column(children: widgets,));

  }

  Widget loading(){
    return const CircularProgressIndicator(color: Colors.white,backgroundColor: primaryColor,strokeWidth: 1,);
  }

 Widget post( Post element,delay){
   return FadeInLeft(
     from: delay,
     child: GestureDetector(
       onTap: (){
        Navigator.pushNamed(context, 'post_detal',arguments: element); 
       },
       child: Padding(
           padding: const EdgeInsets.symmetric(vertical: 8),
           child: Container(
             decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(16),

          ),
             child: Padding(
               padding: const EdgeInsets.all(5.0),
               child: ListTile(
                 leading: const CircleAvatar(
                   backgroundImage: NetworkImage('https://picsum.photos/400/400'),
                 ),
                 title: Text(element.title),
                 trailing: const Icon(Icons.assignment),
               ),
             ),
           ),
         ),
     ),
   );
 }
}