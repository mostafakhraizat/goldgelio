import 'dart:convert';
import 'package:goldgelio/constants/api_paths.dart';
import 'package:goldgelio/constants/constants.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:flutter/material.dart';
import 'package:goldgelio/models/talent_User.dart';
import 'package:http/http.dart' as http;
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import '../constants/assets_paths.dart';

class SelectTalents extends StatefulWidget {
  const SelectTalents({Key? key, required this.user}) : super(key: key);
  final TalentUser user;

  @override
  _SelectTalentsState createState() => _SelectTalentsState();
}

class _SelectTalentsState extends State<SelectTalents> {


  bool loading = false;
  List<Object?> selected = [];
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _items = Constants.talents
        .map((animal) =>
            MultiSelectItem<String>(animal.toString(), animal.toString()))
        .toList();
    return SafeArea(
      child: Scaffold(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "What talents do you have?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Minimum of 3 talents should be selected?",
                        style: TextStyle(
                            color: Colors.black, fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                      children: <Widget>[
                        MultiSelectBottomSheetField(
                          selectedItemsTextStyle:
                              const TextStyle(color: Colors.white),
                          selectedColor: const Color(0xffeaa900).withOpacity(0.9),
                          backgroundColor: Colors.white,
                          initialChildSize: 0.4,
                          listType: MultiSelectListType.CHIP,
                          searchable: true,
                          buttonText: const Text("Your Talents"),
                          title: const Text("Talents"),
                          items: _items,
                          checkColor: Colors.white,
                          onConfirm: (List<Object?> values) {
                            setState(() {
                              selected = values;
                            });
                          },
                          chipDisplay: MultiSelectChipDisplay(
                            textStyle: const TextStyle(color: Colors.white),
                            chipColor: const Color(0xffeaa900).withOpacity(0.9),
                          ),
                        ),
                        selected.isEmpty
                            ? Container(
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  "None selected",
                                  style: TextStyle(color: Colors.black54),
                                ))
                            : Container(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
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
                        InkWell(
                          onTap: () {

                            if (selected.length > 3) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Maximum of 3 talents must be selected')));
                            } else if (selected.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Minimum if 1 talent must be selected')));
                            } else {
                              setState(() {
                                loading=true;
                              });
                              signup(widget.user, jsonEncode(selected))
                                  .then((a){
                                setState(() {
                                  loading=false;
                                });
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(a.body.toString())));
                              })
                                  .onError((error, stackTrace){
                                    setState(() {
                                      loading=false;
                                    });
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
                              });

                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffeaa900),
                                borderRadius: BorderRadius.circular(2),
                                border:
                                    Border.all(color: const Color(0xffeaa900))),
                            child:  Padding(
                              padding:const EdgeInsets.fromLTRB(20, 8, 20, 8),
                              child: Center(
                                  child: loading?JumpingText('...',style: const TextStyle(fontSize: 16),):const Text(
                                'Sign Up',
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget dynamicChips() {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: List<Widget>.generate(Constants.talents.length, (int index) {
        return Row(
          children: [
            Checkbox(value: false, onChanged: (a) {}),
            Text(
              Constants.talents[index].toString().trimLeft().trimRight(),
              style: const TextStyle(color: Color(0xff6e8bf4)),
            )
          ],
        );
      }),
    );
  }

  Future<http.Response> signup(TalentUser talentUser, selected) {
    return http.post(
      Uri.parse(ApiPath.talentReg),
      headers: <String, String>{
        'Content-Type': Constants.jsonAppUtf,
      },
      body: jsonEncode(<String, String>{
        "full_name": talentUser.fullName.toString(),
        "email": talentUser.email.toString(),
        "phone": talentUser.phone.toString(),
        "password": talentUser.password.toString(),
        "gender": talentUser.gender.toString(),
        "talents": selected
      }),
    );
  }
}
