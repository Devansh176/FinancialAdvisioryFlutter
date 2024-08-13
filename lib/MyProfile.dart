import 'dart:io';
import 'package:financial_advisory/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late TextEditingController usernameController;
  late TextEditingController firstname;
  late TextEditingController lastname;
  late TextEditingController phoneNo;
  late TextEditingController email;
  late TextEditingController location;
  late TextEditingController pan;
  late TextEditingController upi;
  File? _userImageFile;
  final saveKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    firstname = TextEditingController();
    lastname = TextEditingController();
    phoneNo = TextEditingController();
    email = TextEditingController();
    location = TextEditingController();
    pan = TextEditingController();
    upi = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    firstname.dispose();
    lastname.dispose();
    phoneNo.dispose();
    email.dispose();
    location.dispose();
    pan.dispose();
    upi.dispose();
    super.dispose();
  }

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _userImageFile = File(pickedImage.path);
      });
    }
  }

  void save() {
    if (saveKey.currentState!.validate()) {
      String username = usernameController.text.trim();
      String first = firstname.text.trim();
      String last = lastname.text.trim();
      String em = email.text.trim();
      String loc = location.text.trim();
      String Pan = pan.text.trim();
      String upI = upi.text.trim();

      if (username.isNotEmpty && first.isNotEmpty && last.isNotEmpty && em.isNotEmpty && loc.isNotEmpty && Pan.isNotEmpty && upI.isNotEmpty) {
        Navigator.pushReplacement(
          context, MaterialPageRoute(
          builder: (context) => const HomePage()
          )
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;

    final double fontSize = width * 0.05;
    final double padding = width * 0.06;

    TextStyle textStyle = Theme.of(context).textTheme.titleMedium!;
    Color inputTextColor = Colors.white;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(padding * 1.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: padding * 2),
              Text(
                "My Profile",
                style: textStyle.copyWith(fontSize: fontSize * 2.8, color: inputTextColor, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: padding * 1.2),
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: padding * 3.2,
                  backgroundColor: Colors.white,
                  backgroundImage: _userImageFile != null ? FileImage(_userImageFile!) : null,
                  child: _userImageFile == null ?  Icon(Icons.person, size: padding * 3.0, color: Colors.grey) : null,
                ),
              ),
              SizedBox(height: padding * 1.2,),
              _buildUsernameField('Username', usernameController, textStyle, inputTextColor),
              SizedBox(height: padding * 1.0,),
              Form(
                key: saveKey,
                child: Column(
                  children: <Widget>[
                    _buildInputField('First Name', firstname, textStyle, inputTextColor),
                    _buildInputField('Last Name', lastname, textStyle, inputTextColor),
                    _buildInputField('Phone no.', phoneNo, textStyle, inputTextColor),
                    _buildInputField('Email', email, textStyle, inputTextColor),
                    _buildInputField('Location', location, textStyle, inputTextColor),
                    _buildInputField('Pan no.', pan, textStyle, inputTextColor, isPassword: true),
                    _buildInputField('UPI Id', upi, textStyle, inputTextColor, isPassword: true),
                    SizedBox(height: padding * 1.0),
                    SizedBox(
                      height: padding * 1.9,
                      width: padding * 5.0,
                      child: ElevatedButton(
                        onPressed: () {
                          save();
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
                          side: WidgetStateProperty.all(const BorderSide(color: Colors.white)),
                        ),
                        child: Text('Save', style: TextStyle(color: Colors.tealAccent,fontSize: fontSize * 1.0,)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String labelText, TextEditingController controller, TextStyle textStyle, Color textColor,
      {bool isPassword = false}) {
    final screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;

    final double padding = width * 0.06;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding * 0.3,),
      child: TextFormField(
        style: textStyle.copyWith(color: textColor),
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: 'Enter $labelText',
          labelStyle: textStyle.copyWith(color: textColor.withOpacity(0.5,),),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(padding * 1.2),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$labelText is required';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildUsernameField(String labelText, TextEditingController controller, TextStyle textStyle, Color textColor,
      {bool isPassword = false}) {
    final screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;

    final double padding = width * 0.02;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding * 0.6,horizontal: padding * 5.5),
      child: TextFormField(
        style: textStyle.copyWith(color: textColor),
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: 'Enter $labelText',
          labelStyle: textStyle.copyWith(color: textColor.withOpacity(0.5,),),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(padding * 2.2),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$labelText is required';
          }
          return null;
        },
      ),
    );
  }
}

