import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_miskolc_datashare/features/main_activity/data/models/user_data_model.dart';
import 'package:uni_miskolc_datashare/features/main_activity/presentation/widgets/drawer_menu.dart';
import 'package:uni_miskolc_datashare/features/session_handler/presentation/bloc/session_handler_bloc.dart';

class DataManagement extends StatefulWidget {
  @override
  _DataManagementState createState() => _DataManagementState();
}

class _DataManagementState extends State<DataManagement> {
  final databaseReference = Firestore.instance;
  FirebaseUser user;
  @override
  void initState() {
    user = BlocProvider.of<SessionHandlerBloc>(context).state.props[0];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      drawer: DrawerMenu(),
      body: Column(
        children: <Widget>[
          Text('Data Management Page'),
          RaisedButton(
              child: Text('Save data'),
              onPressed: () {
                UserDataModel userData = UserDataModel(
                  fistName: 'renato',
                  lastName: 'bodnar',
                  dateOfBirth: '2000.00.00',
                  personalID: '122323AA',
                );
                databaseReference.collection('userData').document(user.uid).setData(userData.toJson());
              }),
          RaisedButton(
              child: Text('Get data'),
              onPressed: () async {
                final answer = await databaseReference.collection('userData').document(user.uid).get();
                final UserDataModel userDataModel = UserDataModel.fromJson(answer.data);
                print(userDataModel.fistName);
                print(userDataModel.lastName);
                print(userDataModel.dateOfBirth);
                print(userDataModel.personalID);
              }),
        ],
      ),
    );
  }
}
