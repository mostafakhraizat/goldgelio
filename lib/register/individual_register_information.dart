import 'package:flutter/material.dart';

import '../constants/assets_paths.dart';

class RegPersonInformation extends StatefulWidget {
  const RegPersonInformation({Key? key}) : super(key: key);

  @override
  _RegPersonInformationState createState() => _RegPersonInformationState();
}

class _RegPersonInformationState extends State<RegPersonInformation> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: null,
      body: Container(
        padding: const EdgeInsets.all(12),
        height: size.height,
        width: size.width,
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 120,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      AssetPath.logo,
                      width: 130,
                      height: 130,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                Row(
                  children: const [
                    Text(
                      'Individual, ',
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
                    cursorColor: const Color(0xffeaa900),
                    decoration: const InputDecoration(
                      hintText: 'Full Name',
                      hintStyle: TextStyle(
                          color: Colors.grey, fontStyle: FontStyle.italic),
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
                    cursorColor: const Color(0xffeaa900),
                    decoration: const InputDecoration(
                      hintText: 'Email address or Mobile number',
                      hintStyle: TextStyle(
                          color: Colors.grey, fontStyle: FontStyle.italic),
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
                    cursorColor: const Color(0xffeaa900),
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          color: Colors.grey, fontStyle: FontStyle.italic),
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
                    cursorColor: const Color(0xffeaa900),
                    decoration: const InputDecoration(
                      hintText: 'Position',
                      hintStyle: TextStyle(
                          color: Colors.grey, fontStyle: FontStyle.italic),
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
                              color: const Color(0xffeaa900).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(2),
                              border:
                                  Border.all(color: const Color(0xffeaa900))),
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
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffeaa900),
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(color: const Color(0xffeaa900))),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                          child: Center(
                              child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
