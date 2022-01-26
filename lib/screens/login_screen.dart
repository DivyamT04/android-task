import 'package:android_task/widgets/add_item_app.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _txtEmail;
  late String _txtPassword;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildEmail(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email address',border: OutlineInputBorder(),fillColor: Colors.grey[350], filled: true),
      validator: (value){
        if (value!.isEmpty){
          return "Email Required !";
        }
        return null;
      },
      onSaved: (value){
        _txtEmail = value.toString();
      },
    );
  }

  Widget _buildPassword(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password',border: OutlineInputBorder(),fillColor: Colors.grey[350], filled: true),
      validator: (value) {
        if (value!.isEmpty) {
          return "Password Required !";
        }
        return null;
      },
      onSaved: (value) {
        _txtPassword = value.toString();
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 200),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: _buildEmail(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: _buildPassword(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 200.0,
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed:(){
                          if(!_formkey.currentState!.validate()){
                            return;
                          }
                          _formkey.currentState!.save();
                          if(_txtEmail == "test@admin.com"){
                            if(_txtPassword == "12345678"){
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context)=> AddItemApp() )
                              );
                            }
                            else{
                              _txtPassword = '';
                            }
                          }
                          else{
                            _txtEmail = '';
                          }
                        },
                        child: Text('Sign In', textScaleFactor: 1.2,),
                      ),
                    ),
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
