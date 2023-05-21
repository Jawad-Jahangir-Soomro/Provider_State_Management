import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier{

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  void login(String email, String password)async{
    setLoading(true);
    try{

      Response response = await post(Uri.parse('http://reqres.in/api/login'),
        body: {
          "email" : email,
          "password" : password
        }
      );

      if(response.statusCode == 200){
        setLoading(false);
        print("Successful");
      }else{
        setLoading(false);
        print("Failed");
      }

    }
    catch(e){
      print(e.toString());
      setLoading(false);
    }
  }

}