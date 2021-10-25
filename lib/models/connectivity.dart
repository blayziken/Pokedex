import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class CheckInternetConnection {
  var internetStatus = "Unknown";
  var contentMessage = "Unknown";

  checkConnection(BuildContext context) async {
    var result = await Connectivity().checkConnectivity();
    switch (result) {
      case ConnectivityResult.wifi:
        internetStatus = "Connected to the Internet";
        contentMessage = "Connected to the Internet";
        // showCustomDialog(internetStatus, contentMessage, context);
        break;
      case ConnectivityResult.mobile:
        internetStatus = "Connected to the Internet";
        contentMessage = "Connected to the Internet";
        // showCustomDialog(internetStatus, contentMessage, context);
        break;
      case ConnectivityResult.none:
        internetStatus = "No Internet Connection!. ";
        contentMessage = "Please check your internet connection";
        showCustomDialog(internetStatus, contentMessage, context);
        break;
      case ConnectivityResult.ethernet:
        break;
    }
  }

  showCustomDialog(String title, String content, BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Close",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              )
            ],
            actionsPadding: EdgeInsets.all(10),
          );
        });
  }
}
