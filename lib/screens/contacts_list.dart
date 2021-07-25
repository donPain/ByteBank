import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      body: ListView(children: <Widget>[]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[900],
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ContactForm(),
                ),
              )
              .then((newContact) => debugPrint(newContact.toString()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text(
            contact.name,
            style: TextStyle(fontSize: 24),
          ),
          subtitle: Text(
            contact.accountNumber.toString(),
            style: TextStyle(fontSize: 16),
          )),
    );
  }
}
