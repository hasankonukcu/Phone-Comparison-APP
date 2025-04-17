import 'package:compare_app/error.dart';
import 'package:compare_app/models/user.dart';
import 'package:compare_app/screens/sign_in/email_login.dart';
import 'package:compare_app/viewmodel/user_model.dart';
import 'package:compare_app/widgets/alert_dialog.dart';
import 'package:compare_app/widgets/fadeanimation.dart';
import 'package:compare_app/widgets/social_login_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

PlatformException? myError;

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? _email, _sifre;
  String? _buttonText, _linkText;
  var _formType = FormType.Login;
  final _formKey = GlobalKey<FormState>();
  void _loginWithGoogle(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);

    Users? _user = await _userModel.signInWithGoogle();
  }

  void _misafirGirisi(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);

    Users? _user = await _userModel.signInAnonymous();
  }

  void _loginWithFacebook(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    try {
      Users? _user = await _userModel.signInWithFacebook();
    } on PlatformException catch (e) {
      myError = e;
      print(e);
    }
  }

  void _emailAndPasswordLogin(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => EmailAndPasswordLogin(),
      ),
    );
  }

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
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (myError != null) {
        PlatformSensAlertDialog(
          title: "Oturum açarken hata",
          content: Errors.show(myError!.code),
          mainButtonText: "Tamam",
        ).show(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _buttonText = _formType == FormType.Login ? "Giriş" : "Kayıt ol";
    _linkText = _formType == FormType.Login
        ? "Hesabınız yok mu? Kayıt ol"
        : "Hesabınız var mı? Giriş Yap";

    final _userModel = Provider.of<UserModel>(context);
    if (_userModel.user != null) {
      Future.delayed(const Duration(milliseconds: 10), () {
        Navigator.of(context).popUntil(ModalRoute.withName("/"));
      });
    }
    final Size size = MediaQuery.of(context).size;
    Provider.of<UserModel>(context);
    double width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              ClipPath(
                clipper: DrawClip1(),
                child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    const Color(0xff46ddbf).withOpacity(0.5),
                    const Color(0xff3088e2).withOpacity(0.5)
                  ], begin: Alignment.topLeft, end: Alignment.bottomLeft)),
                ),
              ),
              ClipPath(
                clipper: DrawClip(),
                child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff46ddbf), Color(0xff3088e2)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft)),
                ),
              ),
              Container(
                height: size.height,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40, top: 100),
                      child: Text(
                        "Hoş Geldin",
                        style: GoogleFonts.raleway(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 180, left: 16, right: 16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            FadeAnimation(
                              delay: 1,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  errorText:
                                      _userModel.emailErrorMessage != null
                                          ? _userModel.emailErrorMessage
                                          : null,
                                  prefixIcon: const Icon(
                                    Icons.mail,
                                  ),
                                  hintText: "Email adresinizi girin",
                                  labelText: "Email adresinizi girin",
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
                                  errorText:
                                      _userModel.passwordErrorMessage != null
                                          ? _userModel.passwordErrorMessage
                                          : null,
                                  prefixIcon: const Icon(
                                    Icons.mail,
                                  ),
                                  hintText: "Şifrenizi girin",
                                  labelText: "Şifrenizi girin",
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
                            Padding(
                              padding: EdgeInsets.only(
                                  left: size.width / 3,
                                  right: size.width / 3,
                                  top: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FadeAnimation(
                                    delay: 1,
                                    child: Material(
                                        elevation: 10,
                                        borderRadius: BorderRadius.circular(20),
                                        child: GestureDetector(
                                          onTap: () =>
                                              _loginWithGoogle(context),
                                          child: Image.asset(
                                              "images/google-logo.png",
                                              height: 40,
                                              width: 40),
                                        )),
                                  ),
                                  FadeAnimation(
                                    delay: 1,
                                    child: Material(
                                        elevation: 10,
                                        borderRadius: BorderRadius.circular(20),
                                        child: GestureDetector(
                                          onTap: () =>
                                              _loginWithFacebook(context),
                                          child: Image.asset(
                                              "images/facebook.png",
                                              height: 40,
                                              width: 40),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget input(String hint, bool pass) {
  return Container(
    child: TextFormField(
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.raleway(color: Colors.grey),
          contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300, width: 2.0)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 70, 219, 189), width: 1.0))),
    ),
  );
}

class DrawClip1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.addOval(
        Rect.fromCircle(center: Offset(size.width, 50.0), radius: 150));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class DrawClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.addOval(
        Rect.fromCircle(center: Offset(size.width * 0.3, 50.0), radius: 200));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
/*
class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  void _loginWithGoogle(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);

    Users? _user = await _userModel.signInWithGoogle();
  }

  void _misafirGirisi(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);

    Users? _user = await _userModel.signInAnonymous();
  }

  void _loginWithFacebook(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    try {
      Users? _user = await _userModel.signInWithFacebook();
    } on PlatformException catch (e) {
      myError = e;
      print(e);
    }
  }

  void _emailAndPasswordLogin(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog:"" true,
        builder: (context) => EmailAndPasswordLogin(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (myError != null) {
        PlatformSensAlertDialog(
          title: "Oturum açarken hata",
          content: Errors.show(myError!.code),
          mainButtonText: "Tamam",
        ).show(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<UserModel>(context);
    double width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        ClipPath(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.4),
                    Theme.of(context).accentColor.withOpacity(0.4),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          clipper: ShapeClipper([
            Offset(width / 5, _height - 500),
            Offset(width / 1.5, _height - 30),
            Offset(width / 5 * 4, _height + 20),
            Offset(width, _height - 18)
          ]),
        ),
        ClipPath(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 51, 6, 173).withOpacity(0.4),
                    const Color.fromARGB(255, 223, 232, 245).withOpacity(0.4),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          clipper: ShapeClipper([
            Offset(width / 5, _height - 490),
            Offset(width / 1.5, _height - 30),
            Offset(width / 5 * 4, _height + 30),
            Offset(width, _height)
          ]),
        ),
        ClipPath(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 105, 59, 165),
                    Color.fromARGB(255, 238, 240, 243),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          clipper: ShapeClipper([
            Offset(width / 10, _height - 490),
            Offset(width / 1.5, _height - 80),
            Offset(width / 5 * 4, _height + 20),
            Offset(width, _height - 18)
          ]),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: FadeAnimation(
                  delay: 0.1,
                  child: Text(
                    "Giriş",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              FadeAnimation(
                delay: 1.4,
                child: SocialLoginButton(
                  buttonColor: Colors.white,
                  buttonText: "Gmail",
                  textColor: Colors.black,
                  buttonIcon: Image.asset("images/google-logo.png"),
                  onPressed: () => _loginWithGoogle(context),
                ),
              ),
              FadeAnimation(
                delay: 1.8,
                child: SocialLoginButton(
                  buttonColor: const Color(0xFF334D92),
                  buttonIcon: Image.asset("images/facebook-logo.png"),
                  buttonText: "Facebook",
                  onPressed: () => _loginWithFacebook(context),
                ),
              ),
              FadeAnimation(
                delay: 2.5,
                child: SocialLoginButton(
                  buttonColor: const Color(0xFF334D92),
                  buttonText: "Email ve Şifre",
                  buttonIcon: const Icon(
                    Icons.email,
                    size: 32,
                    color: Colors.white,
                  ),
                  onPressed: () => _emailAndPasswordLogin(context),
                ),
              ),
              /*SocialLoginButton(
              buttonColor: Color(0xFF334D92),
              buttonText: "Misafir Girişi",
              onPressed: () => _misafirGirisi(context),
            ),*/
            ],
          ),
        ),
      ],
    ));
  }
}
class DrawClip1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.addOval(
        Rect.fromCircle(center: Offset(size.width, 50.0), radius: 150));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

*/