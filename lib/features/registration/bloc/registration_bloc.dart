import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<LoginNavigateEvent>(loginNavigateEvent);
  }

  FutureOr<void> loginNavigateEvent(LoginNavigateEvent event, Emitter<RegistrationState> emit) {
    print('going to login page');
    emit(NavigateToLoginPageActionState() as RegistrationState);
  }
}
