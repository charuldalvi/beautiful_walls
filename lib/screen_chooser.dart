import 'package:flutter/material.dart';

class Modal {
  mainBottomSheet(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (context){
        return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _createTile(context, 'Homescreen', Icons.home, _sethomescreen()),
              _createTile(context, 'Lockscreen', Icons.lock, _setlockscreen()),
              _createTile(context, 'Both', Icons.phone_android, _setboth())
            ],
          );
      }
    );
  }

   ListTile _createTile(
      BuildContext context, String name, IconData icon, Function action) {
    return ListTile(
        leading: Icon(icon),
        title: Text(name),
        onTap: () {
          Navigator.pop(context);
          action();
        });
  }

  _sethomescreen() {
    print('action 1');
  }

  _setlockscreen() {
    print('action 2');
  }

  _setboth() {
    print('action 3');
  }
}