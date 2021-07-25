import 'package:bytebank/screens/contacts_list.dart';
import 'package:flutter/material.dart';
// Crio uma class para chamar a dashboard dentro do context primario com as configurações do tema.
class Dashboard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('bytebank_logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Material(
                      color: Theme.of(context).primaryColor,
                      child: InkWell(
                      onTap:(){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ContactsList(),
                            )
                          );
                    },
                    child:Container(
                    padding: EdgeInsets.all(8.0),
                    height: 80,
                    width: 120,
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.people,color: Colors.white),
                        Text('Contactcs',style: TextStyle(color: Colors.white))
                      ],
                    ),  
                   )   
                  )
                )
              
              )
            ],
          ),
      );

  }
  
}
