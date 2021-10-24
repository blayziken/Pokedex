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
        showCustomDialog(internetStatus, contentMessage, context);
        break;
      case ConnectivityResult.mobile:
        internetStatus = "Connected to the Internet";
        contentMessage = "Connected to the Internet";
        print('Mobileeeeeeeeeeeeeeeeee');
        showCustomDialog(internetStatus, contentMessage, context);
        break;
      case ConnectivityResult.none:
        internetStatus = "You are disconnected to the Internet. ";
        contentMessage = "Please check your internet connection";
        print('No Internetttttt');
        showCustomDialog(internetStatus, contentMessage, context);
        break;
      case ConnectivityResult.ethernet:
        // TODO: Handle this case.
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
                  child: Text("Close"))
            ],
          );
        });
  }

// checkConnection2(BuildContext context) async {
//   listener = DataConnectionChecker().onStatusChange.listen((status) {
//     switch (status) {
//       case DataConnectionStatus.connected:
//         internetStatus = "Connected to the Internet";
//         contentMessage = "Connected to the Internet";
//         _showDialog(internetStatus, contentMessage, context);
//         break;
//       case DataConnectionStatus.disconnected:
//         internetStatus = "You are disconnected to the Internet. ";
//         contentMessage = "Please check your internet connection";
//         _showDialog(internetStatus, contentMessage, context);
//         break;
//     }
//   });
//
//   return await DataConnectionChecker().connectionStatus;
// }
}
