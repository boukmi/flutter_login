import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/authentication/authentication.dart';

import 'package:flutter_login/page1.dart';
import 'package:flutter_login/home/home.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return BlocBuilder<AuthenticationEvent, AuthenticationState>(
      bloc: authenticationBloc,
      builder: (BuildContext context, AuthenticationState state) {
        return Drawer(
          child: Column(
            children: <Widget>[
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(top: 8.0),
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.group),
                        title: Text("Page 1"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Page1()),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.group),
                        title: Text("Home"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => HomePage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: Text('Logout'),
                        onTap: () {
                          authenticationBloc.dispatch(LoggedOut());
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
