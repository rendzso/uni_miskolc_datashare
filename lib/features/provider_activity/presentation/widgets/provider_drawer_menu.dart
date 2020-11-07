import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_miskolc_datashare/features/main_activity/presentation/bloc/main_activity_bloc.dart';
import 'package:uni_miskolc_datashare/features/session_handler/presentation/bloc/session_handler_bloc.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ProviderDrawerMenu extends StatefulWidget {
  @override
  _ProviderDrawerMenuState createState() => _ProviderDrawerMenuState();
}

class _ProviderDrawerMenuState extends State<ProviderDrawerMenu> {
  FirebaseUser user;
  @override
  void initState() {
    user = BlocProvider.of<SessionHandlerBloc>(context).state.props[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[400],
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('assets/images/logo.png'),
            ),
            ListTile(
              title: Text('Main'),
              leading: Icon(Icons.contact_mail),
              onTap: () {
                Navigator.of(context).pop();
                BlocProvider.of<MainActivityBloc>(context)
                    .add(OpenWelcomePage());
              },
            ),
            ListTile(
              title: Text('User Options'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
                BlocProvider.of<MainActivityBloc>(context)
                    .add(OpenOptionsPage());
              },
            ),
            ListTile(
              title: Text('Manage Data'),
              leading: Icon(Icons.portrait),
              onTap: () {
                Navigator.of(context).pop();
                BlocProvider.of<MainActivityBloc>(context)
                    .add(OpenDataManagementPage(userUID: user.uid));
              },
            ),
            ListTile(
              title: Text('QR code scan'),
              leading: Icon(Icons.qr_code),
              onTap: () async {
                String cameraScanResult = await scanner.scan();
                print(cameraScanResult);
              },
            ),
            ListTile(
              title: Text('LogOut'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.of(context).pop();
                BlocProvider.of<SessionHandlerBloc>(context).add(LogOut());
              },
            ),
          ],
        ),
      ),
    );
  }
}
