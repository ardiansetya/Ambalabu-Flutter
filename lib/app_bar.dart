import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Dashboard'),
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: (String result) {
            if (result == 'Call Center') {
              // Aksi Call Center
            } else if (result == 'SMS Center') {
              // Aksi SMS Center
            } else if (result == 'Maps') {
              // Aksi Lokasi
            } else if (result == 'Update User') {
              Navigator.pushNamed(context, '/update-user');
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Call Center',
              child: Text('Call Center'),
            ),
            const PopupMenuItem<String>(
              value: 'SMS Center',
              child: Text('SMS Center'),
            ),
            const PopupMenuItem<String>(
              value: 'Maps',
              child: Text('Lokasi/Maps'),
            ),
            const PopupMenuItem<String>(
              value: 'Update User',
              child: Text('Update User & Password'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
