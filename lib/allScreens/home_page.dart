import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ichat_app/allConstants/color_constants.dart';
import 'package:ichat_app/allModels/popup_choices.dart';
import 'package:ichat_app/allScreens/login_page.dart';
import 'package:ichat_app/allScreens/settings_page.dart';
import 'package:ichat_app/allScreens/chat_screen.dart'; // Import chat screen
import 'package:provider/provider.dart';
import 'package:ichat_app/allproviders/auth_provider.dart';

import '../main.dart'; // Assuming main.dart initializes the app and provides theme data.

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final ScrollController listScrollController = ScrollController();

  int _limit = 20;
  int _limitIncrement = 20;
  String _textSearch = "";
  bool isLoading = false;
  bool isWhite = true; // Theme switch state

  late String currentUserId;
  late AuthProvider authProvider;

  List<PopupChoices> choices = <PopupChoices>[
    PopupChoices(title: 'Settings', icon: Icons.settings),
    PopupChoices(title: 'Sign out', icon: Icons.exit_to_app),
  ];

  Future<void> handleSignOut() async {
    await authProvider.handleSignOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void scrollListener() {
    if (listScrollController.offset >=
        listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  void onItemMenuPress(PopupChoices choice) {
    if (choice.title == "Sign out") {
      handleSignOut();
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SettingsPage()));
    }
  }

  Widget buildPopupMenu() {
    return PopupMenuButton<PopupChoices>(
      icon: Icon(
        Icons.more_vert,
        color: Colors.grey,
      ),
      onSelected: onItemMenuPress,
      itemBuilder: (BuildContext context) {
        return choices.map((PopupChoices choice) {
          return PopupMenuItem<PopupChoices>(
            value: choice,
            child: Row(
              children: <Widget>[
                Icon(
                  choice.icon,
                  color: ColorConstants.primaryColor,
                ),
                SizedBox(width: 10),
                Text(
                  choice.title,
                  style: TextStyle(color: ColorConstants.primaryColor),
                ),
              ],
            ),
          );
        }).toList();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    authProvider = context.read<AuthProvider>();

    if (authProvider.getUserFirebaseId()?.isNotEmpty == true) {
      currentUserId = authProvider.getUserFirebaseId()!;
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()),
            (Route<dynamic> route) => false,
      );
    }
    listScrollController.addListener(scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isWhite ? Colors.white : Colors.black87, // Background color based on theme
      appBar: AppBar(
        backgroundColor: isWhite ? Colors.white : Colors.black87, // App bar color based on theme
        leading: IconButton(
          icon: Icon(
            isWhite ? Icons.brightness_4 : Icons.brightness_7, // Icons for light/dark theme toggle
            color: isWhite ? Colors.black87 : Colors.white,
          ),
          onPressed: () {
            setState(() {
              isWhite = !isWhite; // Toggle theme state
            });
          },
        ),
        actions: <Widget>[
          buildPopupMenu(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
              child: Text("Open Settings"),
              style: ElevatedButton.styleFrom(
                backgroundColor: isWhite ? Colors.black87 : Colors.white, // Updated backgroundColor
                foregroundColor: isWhite ? Colors.white : Colors.black87,   // Updated foregroundColor
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
              child: Text("Open Chatbot"),
              style: ElevatedButton.styleFrom(
                backgroundColor: isWhite ? Colors.black87 : Colors.white, // Updated backgroundColor
                foregroundColor: isWhite ? Colors.white : Colors.black87,   // Updated foregroundColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}
