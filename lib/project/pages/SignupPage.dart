import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:theosis/project/my_flutter_icons.dart';
import 'package:theosis/project/pages/HomePage.dart';
import 'package:theosis/project/theme/colors.dart';
import 'package:theosis/project/theme/styles.dart';

class SignupOrLoginPage extends StatelessWidget {
  const SignupOrLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double W = MediaQuery.of(context).size.width;
    double H = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ProjectColors.darkblueColor,
      body: Stack(children: [
        Container(width: W, height: H, child: Image.asset('assets/img/bluebg.png')),
        SafeArea(
          child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SignupTitle(),
                  EmailField(),
                  PasswordField(),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    SignupStayConnectedCheckbox(),
                    SignupPasswordForgottenButton(),
                  ]),
                  SignupSigninButton(),
                  SignupOrContinue(),
                  SignupSigninWithGoogleButton(),
                  SignupSigninWithAppleButton(),
                  SignupAlreadyHaveAnAccountButton()
                ],
              )),
        ),
      ]),
    );
  }
}

class SignupAlreadyHaveAnAccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [Container(
          padding: EdgeInsets.only(right: 10),
          child: Text("Already have an account?",style:
          TextStyle(color: Colors.white),),
        ), InkWell(onTap: () {}, child: Text("Sign in",style: TextStyle(
          color: ProjectColors.creamYellow,fontWeight: FontWeight.bold
        ),))],
      ),
    );
  }
}

class SignupSigninWithAppleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      child: OutlinedButton.icon(
        icon: Icon(MyFlutterApp.apple),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.all(16), // You can adjust the padding value as needed
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.white; // Foreground color when button is pressed
            }
            return Colors.white; // Normal state foreground color
          }),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: ProjectColors.creamYellow, width: 2),
          ),
        ),
        onPressed: () {},
        label: Text("Sign in with Apple", style: ProjectStyles.buttonTextStyle),
      ),
    );
  }
}

class SignupSigninWithGoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        child: OutlinedButton.icon(
          icon: Icon(MyFlutterApp.google),
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.all(16), // You can adjust the padding value as needed
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
            foregroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.white; // Foreground color when button is pressed
              }
              return Colors.white; // Normal state foreground color
            }),
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: ProjectColors.creamYellow, width: 2),
            ),
          ),
          onPressed: () {},
          label: Text("Sign in with Google", style: ProjectStyles.buttonTextStyle),
        ));
  }
}

class SignupStayConnectedCheckbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Checkbox(
          value: false,
          onChanged: (val) {},
          checkColor: Colors.white,
        ),
        Text(
          "Eingeloggt bleiben",
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}

class SignupSigninButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        width: double.infinity, // Makes the button expand to fill the horizontal space
        child: OutlinedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.all(16), // You can adjust the padding value as needed
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
            foregroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.white; // Foreground color when button is pressed
              }
              return Colors.white; // Normal state foreground color
            }),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return ProjectColors.salmonColorAlt; // Different color when the button is pressed
              }
              return ProjectColors.salmonColor; // Normal state color, replace 'HEXCODE' with your hex color code
            }),
          ),
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) =>  HomePage()));

          },
          child: Text(
            "Sign Up",
            style: ProjectStyles.buttonTextStyle,
          ),
        ));
  }
}

class SignupOrContinue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double W = MediaQuery.of(context).size.width;
    double barW = W * 0.15;
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 20,top: 20),
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              color: Colors.white,
              width: barW,
              height: 1,
            ),
            Container(
              width: 10,
              height: 1,
            ),
            Text(
              "or continue with",
              style: TextStyle(color: ProjectColors.creamYellow),
            ),
            Container(
              width: 10,
              height: 1,
            ),
            Container(
              color: Colors.white,
              width: barW,
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class SignupPasswordForgottenButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        "Passwort vergessen",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class SignupTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final whiteTitle = TextStyle(height: 1.1, fontFamily: "RobotoBold", color: Colors.white, fontSize: 39);
    final yellowTitle = TextStyle(height: 1, fontFamily: "BriemItalic", color: Colors.white, fontSize: 40);
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Logge dich",
            style: whiteTitle,
          ),
          Text(
            "Jetzt ein",
            style: yellowTitle,
          )
        ],
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Text(
            "E-mail",
            style: ProjectStyles.textfieldLabelTextStyle,
          ),
        ),
        TextField(
          keyboardType: TextInputType.emailAddress, // Ensures appropriate keyboard for email input
          decoration: InputDecoration(
            labelText: 'xampla@yourdomain.com',
            // Label text
            labelStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            filled: true,
            fillColor: Colors.black.withOpacity(0.4),

            hintText: 'xampla@yourdomain.com',
            // Placeholder text
            prefixIcon: Icon(
              Icons.mail,
              color: Colors.white,
            ),
            border: OutlineInputBorder(
              // Applies a border that surrounds the TextField
              borderRadius: BorderRadius.circular(20), // Rounded corners with a radius of 30
              borderSide: BorderSide(
                color: Colors.grey, // Color of the border
                width: 1, // Width of the border
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), // Keeps the same rounded corners when the field is not focused
              borderSide: BorderSide(
                color: Colors.grey.shade700, // Color changes could be adjusted as per UI requirements
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), // More pronounced rounding when the field is focused
              borderSide: BorderSide(
                color: Colors.blue, // Typically a brighter color when the field is active/focused
                width: 2,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Text(
            "Passwort",
            style: ProjectStyles.textfieldLabelTextStyle,
          ),
        ),
        TextField(
          keyboardType: TextInputType.emailAddress, // Ensures appropriate keyboard for email input
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            suffixIcon: Icon(
              Icons.remove_red_eye
,                  color:Colors.white.withOpacity(0.5)
            ),
            filled: true,
            fillColor: Colors.black.withOpacity(0.4),

            labelText: 'Type in our password',
            labelStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            // Label text
            hintText: 'xampla@yourdomain.com',
            // Placeholder text
            border: OutlineInputBorder(
              // Applies a border that surrounds the TextField
              borderRadius: BorderRadius.circular(20), // Rounded corners with a radius of 30
              borderSide: BorderSide(
                color: Colors.grey, // Color of the border
                width: 1, // Width of the border
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), // Keeps the same rounded corners when the field is not focused
              borderSide: BorderSide(
                color: Colors.grey.shade700, // Color changes could be adjusted as per UI requirements
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), // More pronounced rounding when the field is focused
              borderSide: BorderSide(
                color: Colors.blue, // Typically a brighter color when the field is active/focused
                width: 2,
              ),
            ),
          ),
        )
      ],
    );
  }
}
