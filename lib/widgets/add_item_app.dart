import 'package:android_task/screens/add_new_item_screen.dart';
import 'package:android_task/widgets/item_list.dart';
import 'package:flutter/material.dart';

class AddItemApp extends StatefulWidget {
  const AddItemApp({Key? key}) : super(key: key);

  @override
  _AddItemAppState createState() => _AddItemAppState();
}

class _AddItemAppState extends State<AddItemApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(preferredSize: Size.fromHeight(25.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            title: Text("My List", style: TextStyle(fontSize: 20, fontFamily: 'Comfortaa', fontWeight: FontWeight.bold),),
            centerTitle: true,
          ),
        ),
        body: ItemList(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.cyan[800],
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context)=> AddNewItem()),
            );

          },
          child: Icon(Icons.add),
        ),
        );
  }
}
