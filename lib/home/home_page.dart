import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_login/home/home.dart';
import 'package:flutter_login/authentication/authentication.dart';
import 'package:flutter_login/app_drawer.dart';
import 'package:flutter_login/page1.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: _homeBloc,
        child: BlocBuilder(
          bloc: _homeBloc,
          builder: (context, state) {
            if (state is HomePageActive) {
              return _HomePage();
            }
            if (state is Page1Active) {
              return Page1();
            }
          },
        ));
  }

  @override
  void dispose() {
    _homeBloc.dispose();
    super.dispose();
  }
}

class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
