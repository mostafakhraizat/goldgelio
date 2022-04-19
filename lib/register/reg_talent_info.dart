import 'package:flutter/material.dart';
import 'package:goldgelio/config/routing.dart';
import 'package:goldgelio/models/talent_User.dart';
import 'package:goldgelio/register/select_talents.dart';
import 'package:password_strength/password_strength.dart';

import '../constants/assets_paths.dart';

class RegTalentInformation extends StatefulWidget {
  const RegTalentInformation({Key? key}) : super(key: key);

  @override
  _RegTalentInformationState createState() => _RegTalentInformationState();
}

class _RegTalentInformationState extends State<RegTalentInformation> {
  TextEditingController fullname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController Gender = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    fullname.dispose();
    email.dispose();
    phone.dispose();
    Gender.dispose();
    password.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: null,
          body: Container(
              padding: const EdgeInsets.all(12),
              height: size.height,
              width: size.width,
              child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        const SizedBox(
                          height: 0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetPath.logo,
                              width: 130,
                              height: 130,
                            )
                          ]
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: const [
                            Text(
                              'Talent, ',
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  color: Color(0xffeaa900),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              'Personal Information',
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 6, right: 6),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xffeaa900))),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Full name is required';
                              }
                              return null;
                            },
                            controller: fullname,
                            cursorColor: const Color(0xffeaa900),
                            decoration: const InputDecoration(
                              hintText: 'Full Name',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 6, right: 6),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xffeaa900))),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              return null;
                            },
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: const Color(0xffeaa900),
                            decoration: const InputDecoration(
                              hintText: 'Email address',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 6, right: 6),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xffeaa900))),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Mobile is required';
                              }
                              return null;
                            },
                            controller: phone,
                            cursorColor: const Color(0xffeaa900),
                            decoration: const InputDecoration(
                              hintText: 'Mobile number',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 6, right: 6),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xffeaa900))),
                          child: TextFormField(
                            validator: (value) {
                              double strength = estimatePasswordStrength(value!);
                              if (value.isEmpty) {
                                return 'Password is required';
                              } else if (value.length < 8) {
                                return 'Required 1 special char, 1 capital char, 1 number, min 8 chars';
                              }else if (strength < 0.3) {
                                return 'Required 1 special char, 1 capital char, 1 number, min 8 chars';
                              } else if (strength < 0.7) {
                                return 'Required 1 special char, 1 capital char, 1 number, min 8 chars';
                              } else {
                                return null;
                              }
                            },
                            controller: password,
                            cursorColor: const Color(0xffeaa900),
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 6, right: 6),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xffeaa900))),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Gender is required';
                              }
                              return null;
                            },
                            controller: Gender,
                            cursorColor: const Color(0xffeaa900),
                            decoration: const InputDecoration(
                              hintText: 'Gender',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 24, right: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xffeaa900)
                                          .withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xffeaa900))),
                                  child: const Padding(
                                    padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                                    child: Center(
                                        child: Text(
                                      'Back',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    TalentUser user = TalentUser(
                                        fullName: fullname.text,
                                        email: email.text,
                                        phone: phone.text,
                                        password: password.text,
                                        talents: []);
                                    Navigator.of(context).push(Routing()
                                        .createRoute(SelectTalents(user: user)));
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xffeaa900),
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xffeaa900))),
                                  child: const Padding(
                                    padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                                    child: Center(
                                        child: Text(
                                      'Select Talents',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Already a member? '),
                              Text(
                                ' Log In',
                                style: TextStyle(color: Color(0xffeaa900)),
                              ),
                            ])
                      ]))))),
    );
  }
}
