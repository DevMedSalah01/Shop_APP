import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';
import '../providers/auth.dart';
import '../helpers/custom_route.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: Text('WELCOME'),
          automaticallyImplyLeading: false, // no back button
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shop_2),
          title: Text('Shop'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Orders'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
            // Navigator.of(context).pushReplacement(
            //   CustumRoute(
            //     builder: (ctx) => OrdersScreen(),
            //   ),
            // );
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Manage Products'),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(UserProductsScreen.routeName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');

            // Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
            Provider.of<Auth>(context, listen: false).logout();
          },
        ),
      ]),
    );
  }
}
