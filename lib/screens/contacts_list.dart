import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      body: ListView(
       children: <Widget> [ 
         Card(
           child: ListTile(
             title: Text('Eduardo',
             style: TextStyle(
               fontSize:24               
               ),
             ),  
             subtitle: Text('1000.00',
              style: TextStyle(
                fontSize:16               
                ),
              )
            ),
           )
          ]
        ),
      
    floatingActionButton: FloatingActionButton(
       onPressed: () {},
       child: Icon( 
         Icons.add,
        ),
      ),
    );
  }
}