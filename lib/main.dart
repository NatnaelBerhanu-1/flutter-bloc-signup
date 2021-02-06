import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_with_james/bloc/signup_bloc.dart';
import 'package:flutter_bloc_with_james/bloc/signup_event.dart';
import 'package:flutter_bloc_with_james/bloc/signup_repository.dart';
import 'package:flutter_bloc_with_james/bloc/signup_state.dart';
import 'package:flutter_bloc_with_james/user.dart';

void main() {
  final signUpRepo = SignUpRepository();

  runApp(BlocProvider(
    create: (context) => SignUpBloc(signUpRepository: signUpRepo),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoc',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  String name, email, password = "";

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: name,
                    validator: (value){
                      if(value==""){
                        return "Field Required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'name',
                    ),
                    onChanged: (newVal){
                      setState(() {
                        name = newVal;
                      });
                    },
                  ),
                  TextFormField(
                    initialValue: email,
                    validator: (value){
                      if(value==""){
                        return "Field Required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'email'
                    ),
                    onChanged: (newVal){
                      setState(() {
                        email = newVal;
                      });
                    },
                  ),
                  TextFormField(
                    initialValue: password,
                    validator: (value){
                      if(value==""){
                        return "Field Required";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'password',
                    ),
                    onChanged: (newVal){
                      setState(() {
                        password = newVal;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20
                  ),
                  BlocConsumer<SignUpBloc, AuthState>(
                    listener: (context, state){
                      if(state is SuccessState){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ()));
                      }
                    },
                    builder: (context, state){
                      if(state is BusyState){
                        return CircularProgressIndicator();
                      }
                      return FlatButton(
                        color: Colors.green,
                        minWidth: double.infinity,
                        onPressed: (){
                          if(_formKey.currentState.validate()){
                            BlocProvider.of<SignUpBloc>(context)..add(
                                SignUp(user: User(
                                    name: name,
                                    password: password,
                                    email: email
                                ))
                            );
                          }
                        },
                        child: Text('Signup'),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}