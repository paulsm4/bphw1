import 'package:flutter/material.dart';
import '/services/boxpik_service.dart';
import '/screens/login_page.dart';
import '/globals.dart';

class SummaryPage extends StatelessWidget {
  // TEST
  //SummaryPage ({Key? key}) : super(key: key) {
  //  userInfo = jsonDecode('{"id":"5","username":"wheel","email":"wheel@boxpik.com","photo":"tux.png","interest_captain":"1","interest_sponsor":"1","interest_owner":"1","facebook_id":null,"google_id":null,"linkedin_id":null,"pooltags":"Football, Basketball, Baseball, NBA, NCAA","prizetags":"Free, Food, Pizza, Burgers","teamtags":"Michigan, Detroit, Lions, Wolverines, Spartans","device_name":"Android SDK built for x86","device_udid":"430db1d8ff674fa3","lat":"0.0","lng":"0.0","user_type":"SuperAdmin","is_captain":"1","is_sponsor":"1","is_super_admin":"1","status":"A","update_status":"Y","login_type":"email","rating":null,"total_build_count":"10","created_date":"2017-12-08 04:31:33","contacts_size":0}');
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BoxPik User Summary"),
      ),
      body: ListView(children: [
        BoxPikService().getAvatar(userInfo!['photo']),
        _addEntry("Username", userInfo!['username']),
        _addEntry("EMail", userInfo!['email']),
        _addEntry("Interested in Captain?", _toYesNo(userInfo!['interest_captain'])),
        _addEntry("Interested in Sponsor?", _toYesNo(userInfo!['interest_sponsor'])),
        _addEntry("Is Captain?", _toYesNo(userInfo!['is_captain'])),
        _addEntry("Is Sponsor?", _toYesNo(userInfo!['is_sponsor'])),
        _addEntry("UserType", userInfo!['user_type']),
        _addEntry("Created Date", userInfo!['created_date']),
        Center(child: ElevatedButton(
          child: const Text("Logoff"),
          onPressed: () => Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => LoginPage())),
        ),)
      ],)
    );
  }

  Widget _addEntry(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 25),
          child: 
            Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ),
        Container(
          padding: const EdgeInsets.only(right: 25),
          child:
            Text(value, style: const TextStyle(fontSize: 12))
        ),
      ]
    );
  }

  String _toYesNo(String value) {
    return (value == '1') ? 'Yes' : 'No';
  }
}
