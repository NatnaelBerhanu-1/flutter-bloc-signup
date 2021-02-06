import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_with_james/user.dart';

class AuthEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SignUp extends AuthEvent{
  final User user;
  SignUp({@required this.user}):assert(user!=null);

  @override
  // TODO: implement props
  List<Object> get props => [user];
}