import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_telkomsel_bcg/src/utils/navigation_service/navigation_service.dart';
import 'package:test_telkomsel_bcg/src/utils/router/router_service.dart';
import 'package:test_telkomsel_bcg/src/utils/service_locator/setup_locator.dart';

class LaunchPage extends StatefulWidget {
  LaunchPage({Key? key}) : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  final NavigationService? _navigationService = locator<NavigationService>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      _navigationService!.push(NavigationName.music);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Music\nPlayer',
            style: GoogleFonts.roboto(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
