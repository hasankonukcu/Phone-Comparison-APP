import 'package:compare_app/screens/home_page.dart';

import 'package:compare_app/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myBackgrounColor = Theme.of(context).primaryColor;
    var myButtonColor = Theme.of(context).colorScheme.secondary;

    final _userModel = Provider.of<UserModel>(context, listen: true);

    if (_userModel.state == ViewState.Idle) {
      return HomePage();
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            backgroundColor: myBackgrounColor,
            valueColor: AlwaysStoppedAnimation<Color>(myButtonColor),
          ),
        ),
      );
    }
  }
}
