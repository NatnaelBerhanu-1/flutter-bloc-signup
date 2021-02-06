import 'package:equatable/equatable.dart';

class AuthState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class IdleState extends AuthState{

}

class BusyState extends AuthState{

}

class SuccessState extends AuthState{

}

class FailedState extends AuthState{

}