import 'package:flutter/material.dart';
import 'package:proyect_test/src/modules/posts/model/post_model.dart';
import 'package:proyect_test/src/utils/components/ui/styles/styles.dart';

class PostDetal extends StatelessWidget {
  PostDetal({Key key}) : super(key: key);

  Post element;

  @override
  Widget build(BuildContext context) {
  element = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Detail post"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: detailPost(),
      ),
    );
  }

  Widget detailPost(){
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
             Padding(
             padding: const EdgeInsets.symmetric(vertical: 30),
             child: Container(
               decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(25),

            ),
               child: Padding(
                 padding: const EdgeInsets.all(5.0),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(vertical: 15),
                   child: ListTile(
                     leading: const CircleAvatar(
                       backgroundImage: NetworkImage('https://picsum.photos/400/400'),
                     ),
                     title: Text(element.title +" - ID: ${element.id} from user : ${element.userId.toString()}"),
                     subtitle: Text(element.body),
                   ),
                 ),
               ),
             ),
           ),
            // Text(element.title),
            // Text(element.body),
            // Text(element.id.toString()),
            // Text(element.userId.toString()),
          ],
        ),
      );
  }
}