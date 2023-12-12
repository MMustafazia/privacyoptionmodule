import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:privacyoption/privacygallery/home.dart';
import 'package:privacyoption/screen/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  static const String PASSWORD = "null";
  String _storedValue = "";
  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();
  TextEditingController controller5 = new TextEditingController();

  TextEditingController controller6 = new TextEditingController();
  TextEditingController controller7 = new TextEditingController();
  TextEditingController controller8 = new TextEditingController();
  TextEditingController controller9 = new TextEditingController();
  TextEditingController controller10 = new TextEditingController();

  void checkpassword() async {
    print("pressed");
    print(controller1.text);
    print(controller2.text);
    print(controller3.text);
    print(controller4.text);
    print(controller5.text);
    String value1 = controller1.text +
        controller2.text +
        controller3.text +
        controller4.text +
        controller5.text;
    String value2 = controller6.text +
        controller7.text +
        controller8.text +
        controller9.text +
        controller10.text;
    print("${value1}");
    print("${value2}");

    if (value1.toString() == value2.toString()) {
      print("Password Set Successfuly");
      var pref = await SharedPreferences.getInstance();
      pref.setString("KEYPASS", value2);
      _storedValue = pref.getString("KEYPASS") ?? "null ";
      print("key value : ");
      print("${_storedValue}");

      pref.setBool(SplashScreenState.LOGINKEY, true);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password Changed Successfully'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2), // Adjust the duration as needed
        ),
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      print("password not matched");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Passoword does not match'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2), // Adjust the duration as needed
        ),
      );
      setState(() {
        controller1.clear();
        controller2.clear();
        controller3.clear();
        controller4.clear();
        controller5.clear();
        controller6.clear();
        controller7.clear();
        controller8.clear();
        controller9.clear();
        controller10.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Change Password",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w300, color: Colors.purple),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Text(
                "Enter New Password",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w300,
                    color: Colors.purple),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Form(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 68,
                width: 64,
                child: TextFormField(
                  controller: controller1,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.purple)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              ),
              Container(
                height: 68,
                width: 64,
                child: TextFormField(
                  controller: controller2,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.purple)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              ),
              Container(
                height: 68,
                width: 64,
                child: TextFormField(
                  controller: controller3,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.purple)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              ),
              Container(
                height: 68,
                width: 64,
                child: TextFormField(
                  controller: controller4,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.purple)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              ),
              Container(
                height: 68,
                width: 64,
                child: TextFormField(
                  controller: controller5,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.purple)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    FocusScope.of(context).nextFocus();
                  },
                ),
              ),
            ],
          )),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Confirm New Password",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w300,
                    color: Colors.purple),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Form(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 68,
                width: 64,
                child: TextFormField(
                  controller: controller6,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.purple)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              ),
              Container(
                height: 68,
                width: 64,
                child: TextFormField(
                  controller: controller7,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.purple)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              ),
              Container(
                height: 68,
                width: 64,
                child: TextFormField(
                  controller: controller8,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.purple)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              ),
              Container(
                height: 68,
                width: 64,
                child: TextFormField(
                  controller: controller9,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.purple)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              ),
              Container(
                height: 68,
                width: 64,
                child: TextFormField(
                  controller: controller10,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.purple)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {},
                ),
              ),
            ],
          )),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () async {
                checkpassword();
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }
}
