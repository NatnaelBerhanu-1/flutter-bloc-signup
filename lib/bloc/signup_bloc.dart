import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_with_james/bloc/signup_event.dart';
import 'package:flutter_bloc_with_james/bloc/signup_repository.dart';
import 'package:flutter_bloc_with_james/bloc/signup_state.dart';

class SignUpBloc extends Bloc<AuthEvent, AuthState>{
  final SignUpRepository signUpRepository;
  SignUpBloc({@required this.signUpRepository}):assert(signUpRepository!=null),super(IdleState());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async*{
    // TODO: implement mapEventToState
    yield BusyState();
    try{
      if(event is SignUp){
        var user = await signUpRepository.signup(event.user);
        yield SuccessState();
      }
    }catch(error){
      print(error);
    }
  }
}