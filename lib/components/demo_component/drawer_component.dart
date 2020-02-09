
import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {

  final dynamic logout;

  DrawerComponent({ @required this.logout });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _buildDrawHeader(),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.blue,),
            title: Text('Logout'),
            onTap: () {
              logout();
            },
          ),
          /* ListView.separated(
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.message),
                title: Text('message'),
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 1,
              color: Colors.black38,
            )
          ) */
        ],
      )
    );
  }

  Widget _buildDrawHeader() {
    return DrawerHeader(
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              width: 80.0,
              height: 80.0,
              padding: EdgeInsets.all(10.0),
              child: FlutterLogo(),
              decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: Colors.blue),
                borderRadius: BorderRadius.circular(50.0)
              ),
            ),
            Expanded(
              child: Container(
                height: 80.0,
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '123',
                      style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.blueGrey
                    )),
                  ],
                ),
              )
              
            )
          ],
        )
      )
    );
  }

}