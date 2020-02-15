import 'package:bloc/bloc.dart';
import 'package:it_hub/Pages/homepage.dart';
import 'package:it_hub/Pages/ndtvnews.dart';
import 'package:it_hub/Pages/quizz.dart';
import 'package:it_hub/book.dart';

import '../ml.dart';


enum NavigationEvents {
  HomePageClickedEvent,
  MyNewsClickedEvent,
  MyQuizClickedEvent,
  MyBookClickedEvent,
  MyMlClickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.MyNewsClickedEvent:
        yield Ndtv();
        break;
      case NavigationEvents.MyQuizClickedEvent:
        yield QuizPage();
        break;
      case NavigationEvents.MyBookClickedEvent:
        yield Book();
        break;
      case NavigationEvents.MyMlClickedEvent:
        yield FirebaseMLKitExample();
        break;
    }
  }
}
