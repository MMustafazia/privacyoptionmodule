import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:privacyoption/privacygallery/pgalleryhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PGalleryLockScreen extends StatefulWidget {
  const PGalleryLockScreen({super.key});

  @override
  State<PGalleryLockScreen> createState() => _PGalleryLockScreenState();
}

class _PGalleryLockScreenState extends State<PGalleryLockScreen> {
  TextEditingController controller1 = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrefs();
  }

  getPrefs() async {
    var pref = await SharedPreferences.getInstance();
    var email = pref.getString("email");
    var pass = pref.getString("password");
    print("email on gal lock = $email");
    print("password on gal lock = $pass");
  }

  checkLogin() async {
    var prefs = await SharedPreferences.getInstance();
    var passcheck = prefs.getString("password");
    var checkvalue = controller1.text.toString();
    print("controller = $checkvalue");

    if (passcheck.toString() == checkvalue.toString()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Entered Privacy Gallery'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3), // Adjust the duration as needed
        ),
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PGalleryHomeScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Entering Privacy Gallery Failed'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3), // Adjust the duration as needed
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 25,
            )),
        title: Text("Enter Password"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 68,
              width: double.infinity,
              child: TextFormField(
                controller: controller1,
                obscureText: true,
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 4),
                        borderRadius: BorderRadius.circular(12))),
                style: Theme.of(context).textTheme.headline6,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                // inputFormatters: [
                //   LengthLimitingTextInputFormatter(1),
                //   FilteringTextInputFormatter.digitsOnly
                // ],
                // onChanged: (value) {
                //   if (value.length == 1) {
                //     FocusScope.of(context).nextFocus();
                //   }
                // },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextButton(
                    onPressed: () {
                      checkLogin();
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          color: Colors.purple),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
