import 'package:flutter/material.dart';
import 'package:flutter_login/app_drawer.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_login/authentication/authentication.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('logout'),
            onPressed: () {
              authenticationBloc.dispatch(LoggedOut());
            },
          ),
        ),
      ),
    );
  }
}
