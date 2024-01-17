import 'package:flutter/material.dart';

class PrivacySettingsScreen extends StatefulWidget {
  @override
  _PrivacySettingsScreenState createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends State<PrivacySettingsScreen> {
  bool _accountPrivacy = true;
  bool _paidAdOption = false;
  bool _videosAndPics = true;
  bool _friends = true;
  bool _notifications = true;
  bool _comments = true;
  bool _likes = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Account Privacy'),
            trailing: Switch(
              value: _accountPrivacy,
              onChanged: (value) => setState(() => _accountPrivacy = value),
            ),
          ),
          ListTile(
            title: Text('Paid Ad Option'),
            trailing: Switch(
              value: _paidAdOption,
              onChanged: (value) => setState(() => _paidAdOption = value),
            ),
          ),
          ListTile(
            title: Text('Videos & Pics'),
            trailing: Switch(
              value: _videosAndPics,
              onChanged: (value) => setState(() => _videosAndPics = value),
            ),
          ),
          ListTile(
            title: Text('Friends'),
            trailing: Switch(
              value: _friends,
              onChanged: (value) => setState(() => _friends = value),
            ),
          ),
          ListTile(
            title: Text('Notifications'),
            trailing: Switch(
              value: _notifications,
              onChanged: (value) => setState(() => _notifications = value),
            ),
          ),
          ListTile(
            title: Text('Comments'),
            trailing: Switch(
              value: _comments,
              onChanged: (value) => setState(() => _comments = value),
            ),
          ),
          ListTile(
            title: Text('Likes'),
            trailing: Switch(
              value: _likes,
              onChanged: (value) => setState(() => _likes = value),
            ),
          ),
        ],
      ),
    );
  }
}
