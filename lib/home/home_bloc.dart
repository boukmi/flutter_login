import 'package:flutter_login/home/home.dart';

import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomePageActive();

  @override
  Stream<HomeState> mapEventToState(
    HomeState currentState,
    HomeEvent event,
  ) async* {
    switch (event) {
      case HomeEvent.homePageActive:
        yield HomePageActive();
        break;
      case HomeEvent.page1Active:
        yield Page1Active();
        break;
    }
  }
}
