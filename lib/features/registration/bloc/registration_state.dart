part of 'registration_bloc.dart';

@immutable
abstract class RegistrationState {}

abstract class RegistrationActionState {}

class RegistrationInitial extends RegistrationState {}

class NavigateToLoginPageActionState extends RegistrationActionState {}

