import 'package:compare_app/error.dart';
import 'package:compare_app/models/user.dart';
import 'package:compare_app/viewmodel/user_model.dart';
import 'package:compare_app/widgets/alert_dialog.dart';
import 'package:compare_app/widgets/fadeanimation.dart';
import 'package:compare_app/widgets/social_login_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FormType { Register, Login }

class EmailAndPasswordLogin extends StatefulWidget {
  @override
  _EmailAndPasswordLoginState createState() => _EmailAndPasswordLoginState();
}

class _EmailAndPasswordLoginState extends State<EmailAndPasswordLogin> {
  String? _email, _sifre;
  String? _buttonText, _linkText;
  var _formType = FormType.Login;
  final _formKey = GlobalKey<FormState>();

  void _formSubmit() async {
    _formKey.currentState!.save();
    final _userModel = Provider.of<UserModel>(context, listen: false);
    if (_formType == FormType.Login) {
      try {
        Users? _girisYapanUser =
            await _userModel.signInWithEmailAndPassword(_email!, _sifre!);
      } on FirebaseAuthException catch (e) {
        PlatformSensAlertDialog(
                title: "Oturum açarken hata oluştu",
                content: Errors.show(e.code),
                mainButtonText: "Tamam")
            .show(context);
      }
    } else {
      try {
        print(_email);
        print(_sifre);
        Users? _olusturulanUser =
            await _userModel.createUserWithEmailAndPassword(_email!, _sifre!);
      } on FirebaseAuthException catch (e) {
        debugPrint(e.code.toString());
        PlatformSensAlertDialog(
                title: "Kullanıcı oluştururken hata oluştu",
                content: Errors.show(e.code),
                mainButtonText: "Tamam")
            .show(context);
      }
    }
  }

  void _change() {
    setState(() {
      _formType =
          _formType == FormType.Login ? FormType.Register : FormType.Login;
    });
  }

  @override
  Widget build(BuildContext context) {
    _buttonText = _formType == FormType.Login ? "giriş" : "kayıt";
    _linkText =
        _formType == FormType.Login ? "Hesabınız var mı? Giriş Yap" : "deneme";

    final _userModel = Provider.of<UserModel>(context);

    if (_userModel.user != null) {
      Future.delayed(const Duration(milliseconds: 10), () {
        Navigator.of(context).popUntil(ModalRoute.withName("/"));
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("şifrenizi girin"),
        ),
        body: _userModel.state == ViewState.Idle
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        FadeAnimation(
                          delay: 1,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              errorText: _userModel.emailErrorMessage != null
                                  ? _userModel.emailErrorMessage
                                  : null,
                              prefixIcon: const Icon(
                                Icons.mail,
                              ),
                              hintText: "Email",
                              labelText: "Email",
                              border: const OutlineInputBorder(),
                            ),
                            onSaved: (String? email) {
                              _email = email;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        FadeAnimation(
                          delay: 1.6,
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              errorText: _userModel.passwordErrorMessage != null
                                  ? _userModel.passwordErrorMessage
                                  : null,
                              prefixIcon: const Icon(
                                Icons.mail,
                              ),
                              hintText: "şifrenizi girin",
                              labelText: "şifrenizi girin",
                              border: const OutlineInputBorder(),
                            ),
                            onSaved: (String? pass) {
                              _sifre = pass;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        FadeAnimation(
                          delay: 2,
                          child: SocialLoginButton(
                            buttonText: _buttonText!,
                            onPressed: () => _formSubmit(),
                            buttonColor: Theme.of(context).primaryColor,
                            radius: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        FadeAnimation(
                          delay: 2.5,
                          child: TextButton(
                            onPressed: () => _change(),
                            child: Text(_linkText!),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
