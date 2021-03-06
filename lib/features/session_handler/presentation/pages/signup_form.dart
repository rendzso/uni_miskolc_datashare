import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_miskolc_datashare/core/widgets/custom_input_field.dart';
import 'package:uni_miskolc_datashare/features/session_handler/presentation/bloc/session_handler_bloc.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String email;
  String password;

  final myEmailChangeController = TextEditingController();
  final myPasswordChangeController = TextEditingController();

  @override
  void initState() {
    myEmailChangeController.addListener(() {
      email = myEmailChangeController.text;
    });
    myPasswordChangeController.addListener(() {
      password = myPasswordChangeController.text;
    });
    super.initState();
  }

  @override
  void dispose() {
    myEmailChangeController.dispose();
    myPasswordChangeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.grey[400],
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 270,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign up Page',
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ],
                ),
              ),
              CustomInputField(
                textHint: 'Email address',
                myController: myEmailChangeController,
                isPassword: false,
                rowText: 'Email:',
                onlyText: false,
              ),
              CustomInputField(
                textHint: 'Password',
                myController: myPasswordChangeController,
                isPassword: true,
                rowText: 'Password:',
                onlyText: false,
              ),
              RaisedButton(
                child: Text('Sign Up!'),
                onPressed: () {
                  BlocProvider.of<SessionHandlerBloc>(context)
                      .add(SignUp(email: email, password: password));
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: RaisedButton(
                    child: Text('Back to login'),
                    onPressed: () {
                      BlocProvider.of<SessionHandlerBloc>(context)
                          .add(OpenLogInPage());
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
