import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theosis/project/pages/SignupPage.dart';
import 'package:theosis/project/theme/colors.dart';
import 'package:theosis/project/theme/styles.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.darkblueColor,
      body: SafeArea(top: false,
        child: Container(
          decoration: BoxDecoration(color: ProjectColors.darkblueColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/img/welcome.png'),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    WelcomePageTitle(),
                    WelcomePageSubTitle(),
                  ])),
              Expanded(
                child: Container(), // Acts as a flexible spacer
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [WelcomePageNewMemberButton(), WelcomePageAlreadyMemberButton()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomePageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final whiteTitle = TextStyle(
        height: 1.1,

        fontFamily: "RobotoBold", color: Colors.white, fontSize: 39);
    final yellowTitle = TextStyle(
        height: 1,
        fontFamily: "BriemItalic", color:ProjectColors.creamYellow, fontSize: 40);
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Trete Christus",
            style: whiteTitle,
          ),
          Wrap(alignment: WrapAlignment.end, children: [
            Container(
              padding: EdgeInsets.only(top: 3),
              child: Text(
                "und ",
                style: whiteTitle,
              ),
            ),
            Container(
              child: Text(
                "allen",
                style: yellowTitle,
              ),
            ),
          ]),
          Text(
            "Heiligen bei",
            style: yellowTitle,
          )
        ],
      ),
    );
  }
}

class WelcomePageSubTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: Colors.white, fontSize: 18);
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Text(
            "Entdecke wǒchentlich neue Christliche Hörbücher, Filme, über 30.000 Kichenväter Werke uvm.",
            style: textStyle,
          ),
    );

  }
}

class WelcomePageNewMemberButton extends StatelessWidget {
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
            Navigator.push(context,MaterialPageRoute(builder: (context) =>  SignupOrLoginPage()));
          },
          child: Text("Jetzt entdecken",style:ProjectStyles.buttonTextStyle,),
        ));
  }
}

class WelcomePageAlreadyMemberButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
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
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: ProjectColors.salmonColor, width: 2),
          ),
        ),
        onPressed: () {},
        child: Text("Ich bin bereits Mitglied",style: ProjectStyles.buttonTextStyle),
      ),
    );
  }
}
