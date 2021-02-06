import '../user.dart';
import 'package:http/http.dart' as http;

class  SignUpRepository{
  Future<User> signup(User user) async{
    var response = await http.post('http://zonethio.com/api/register', body: {
      "name": user.name,
      "email": user.email,
      "password": user.password,
      "password_confirmation": user.password
    });

    print(response.body);
  }
}