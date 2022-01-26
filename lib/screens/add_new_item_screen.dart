import 'package:android_task/models/item_model.dart';
import 'package:android_task/models/itemlist_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewItem extends StatefulWidget {
  const AddNewItem({Key? key}) : super(key: key);

  @override
  _AddNewItemState createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  late String _txtName;
  late String _txtPrice;
  late ItemModel _newItem;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildItemName(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Item name',border: OutlineInputBorder(),fillColor: Colors.grey[300], filled: true),
      validator: (value){
        if (value!.isEmpty){
          return "Name Required !";
        }
        return null;
      },
      onSaved: (value){
        _txtName = value.toString();
      },
    );
  }

  Widget _buildItemPrice(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Item price',border: OutlineInputBorder(),fillColor: Colors.grey[300], filled: true),
        style: TextStyle(color: Colors.black),
        validator: (value) {
          if (value!.isEmpty) {
            return "Name Required !";
          }
          return null;
        },
      onSaved: (value) {
        _txtPrice = value.toString();
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Item'),
        centerTitle: true,
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: _buildItemName(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: _buildItemPrice(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 200.0,
                    height: 50.0,
                    child: ElevatedButton(
                        onPressed:(){
                          if(!_formkey.currentState!.validate()){
                            return;
                          }
                          _formkey.currentState!.save();
                          _newItem = ItemModel(
                            //id: int.parse(_txtId),
                            name: _txtName,
                            price: _txtPrice
                          );
                          Provider.of<ItemListChangeNotifier>(
                            context,
                            listen: false,
                          ).addNewItemToList(_newItem);
                          Navigator.pop(context);
                        },
                      child: Text('SUBMIT', textScaleFactor: 1.2,),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
