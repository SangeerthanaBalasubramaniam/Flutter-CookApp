import 'package:flutter/material.dart';

class GroceryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: GroceryList());
  }
}

class ListVariable {
  final String label;
  bool isCompleted;
  ListVariable(this.label, this.isCompleted);
}

class GroceryList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GroceryListState();
}

class GroceryListState extends State<GroceryList> {
  final List<ListVariable> grocerylist = <ListVariable>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          elevation: 8.0,
          title: Text(
            'Grocery List',
            style: TextStyle(fontSize: 30.0),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff1b1b1b),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom:
              Radius.elliptical(MediaQuery.of(context).size.width, 120.0),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xfffeb800),
        elevation: 8.0,
        onPressed: () => _boxPrompt(context),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: grocerylist.length > 0
            ? ListView.builder(
          itemCount: grocerylist.length,
          itemBuilder: _buildRow,
        )
            : Center(
          child: Text(
            '# Winning',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff1b1b1b)),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(context, index) => Row(
    children: [
      SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  grocerylist[index].label,
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  iconSize: 25.0,
                  onPressed: () {
                    setState(() {
                      grocerylist.removeAt(index);
                    });
                  },
                ),
              ),
              Divider(
                color: Color(0xff1b1b1b),
              ),],),),),],);

  _boxPrompt(BuildContext context) {
    String _itemLabel = '';
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: TextField(
                onChanged: (val) => _itemLabel = val,
                decoration: InputDecoration(hintText: 'Add item to list')),
            actions: <Widget>[
              FlatButton(
                child: new Text('CANCEL'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: new Text('ADD'),
                onPressed: () {
                  setState(
                          () => grocerylist.add(ListVariable(_itemLabel, false)));
                  Navigator.of(context).pop();
                },)
            ],);
        });
  }}
