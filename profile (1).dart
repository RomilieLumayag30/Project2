import 'package:flutter/material.dart';
import 'edit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = 'Romilie Lumayag';
  String _username = '@romi';
  String _phone = '093345958448';
  String _address = 'Purok 3 Poblacion ,Bonifacio, misamis Occidental';

  void _updateProfile(String name, String username, String phone, String address) {
    setState(() {
      _name = name;
      _username = username;
      _phone = phone;
      _address = address;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "My Profile",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Color(0xFFFFEBCC),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color(0xFFFFEBCC),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person, size: 60),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _name,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _username,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        _phone,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        _address,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(
                        name: _name,
                        username: _username,
                        phone: _phone,
                        address: _address,
                      ),
                    ),
                  );

                  if (result != null && result is Map<String, String>) {
                    _updateProfile(
                      result['name']!,
                      result['username']!,
                      result['phone']!,
                      result['address']!,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),
            SizedBox(height: 35),
            _buildProfileOption(context, 'Payment', Icons.payment, Icons.arrow_forward_ios),
            _buildProfileOption(context, 'My Orders', Icons.shopping_cart, Icons.arrow_forward_ios),
            _buildProfileOption(context, 'Favorites', Icons.favorite, Icons.arrow_forward_ios),
            _buildProfileOption(context, 'Logout', Icons.logout, Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, String title, IconData prefixIcon, IconData suffixIcon) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Icon(prefixIcon),
                SizedBox(width: 10),
                Text(title, style: TextStyle(fontSize: 18)),
              ],
            ),
            Icon(suffixIcon),
          ],
        ),
      ),
    );
  }
}