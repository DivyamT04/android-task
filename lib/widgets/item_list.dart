import 'package:android_task/models/itemlist_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  void initState() {
    super.initState();
    Provider.of<ItemListChangeNotifier>(context, listen: false).listofitems;
  }
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('hh:mm  yyyy-MM-d').format(now);
    return Consumer<ItemListChangeNotifier>(
      builder: (_, itemlistCNInstance,__)=> ListView.builder(
          itemCount: itemlistCNInstance.listofitems.length,
          itemBuilder: (BuildContext context, int index)
      {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Card(
            color: Colors.blue[100],
            elevation: 10,
            borderOnForeground: true,
            child: Container(
              height: 70.0,
              child: ListTile(
                title: Text(
                  itemlistCNInstance.listofitems[index].name,
                  style: TextStyle(
                      fontSize: 25.0
                  ),
                ),
                subtitle: Text(
                  formattedDate,
                  style: TextStyle(fontSize: 14.0),
                ),
                trailing: Text(
                  "Rs"+" "+itemlistCNInstance.listofitems[index].price,
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            ),
          ),
        );

  }
      ),
    );
  }
}
