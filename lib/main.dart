import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  MySnackbar(message, context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message),backgroundColor: Colors.red,duration: Duration(seconds: 3),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('App bar'),
          leading: IconButton(
              onPressed: () {
                MySnackbar('this is a snackbar message', context);
              },
              icon: Icon(Icons.menu))),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('welcome home '),
                  backgroundColor: Colors.amber,
                  duration: Duration(seconds: 1),

                ));
                //Scaffold.of(context).sh
              },
              child: Icon(Icons.home)),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Send money'),
                        content:
                        Text('Are you sure that you want to send money?'),
                        actions: [],
                      );
                    });
              },
              icon: Icon(Icons.add)),


         IconButton(onPressed: (){
           showDialog(context: context, builder: (context){
             return AlertDialog(title: Text('profile'),
             content: Text('do you wanna exit '),
             backgroundColor: Colors.grey.shade300,
               actions: [
                 TextButton(onPressed: (){
                   Navigator.of(context).pop();
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Delte success')));}
                   , child: Text("Yes"),),
                 TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("No"))
               ],
             );
           });


         }, icon: Icon(Icons.co_present_rounded)),
        ],
      ),
    );
  }
}
