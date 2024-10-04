import 'package:flutter/material.dart';
import 'package:gorevue/utils/constants.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.accent,
            ),
            child: Text(
              'Revue',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('About Us'),
            onTap: () {
              // TODO: Implement navigation to About Us page
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Blogs'),
            onTap: () {
              // TODO: Implement navigation to Blogs page
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Help'),
            onTap: () {
              // TODO: Implement navigation to Help page
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
