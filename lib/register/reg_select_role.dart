import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:goldgelio/config/routing.dart';
import 'package:goldgelio/constants/assets_paths.dart';
import 'package:goldgelio/register/individual_register_information.dart';
import 'package:goldgelio/register/reg_talent_info.dart';

import 'corporate_register_information.dart';

class RegSelectRole extends StatefulWidget {
  const RegSelectRole({Key? key}) : super(key: key);

  @override
  _RegSelectRoleState createState() => _RegSelectRoleState();
}

class _RegSelectRoleState extends State<RegSelectRole> {
  ValueNotifier<bool> talent = ValueNotifier(false);
  ValueNotifier<bool> employer = ValueNotifier(false);
  ValueNotifier<bool> ind = ValueNotifier(false);
  ValueNotifier<bool> cor = ValueNotifier(false);

  // ExpandableController controller = ExpandableController();

  @override
  Widget build(BuildContext context) {
    ExpandableController controller = ExpandableController();
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        'Welcome!',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                            fontFamily: 'Quicksand'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "You're in the right place",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Quicksand',
                            color: Colors.black),
                      ),
                      Text(
                        " Join Us",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xffeaa900),
                            fontFamily: 'Quicksand'),
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
                        "Join as",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            fontFamily: 'Quicksand',
                            color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 46,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xffeaa900))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ValueListenableBuilder(
                          builder:
                              (BuildContext context, bool value, Widget? child) {
                            return Checkbox(
                              value: value,
                              onChanged: (value) {
                                talent.value = value!;
                                employer.value = false;
                                ind.value = false;
                                cor.value = false;
                              },
                              activeColor: const Color(0xffeaa900),
                              splashRadius: 12,
                            );
                          },
                          valueListenable: talent,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: (){
                            talent.value = !talent.value;
                            employer.value = false;
                            ind.value = false;
                            cor.value = false;
                          },

                            child: const Text('Talent'))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xffeaa900))),
                    child: ExpandableNotifier(
                        controller: controller,
                        child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Column(children: <Widget>[
                              ScrollOnExpand(
                                  scrollOnExpand: false,
                                  scrollOnCollapse: false,
                                  child: ExpandablePanel(
                                      theme: const ExpandableThemeData(
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          tapBodyToCollapse: false,
                                          tapBodyToExpand: true,
                                          iconRotationAngle: 0,
                                          tapHeaderToExpand: true),
                                      header: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ValueListenableBuilder(
                                            builder: (BuildContext context,
                                                bool value, Widget? child) {
                                              return Checkbox(
                                                value: value,
                                                onChanged: (value) {
                                                  employer.value = value!;
                                                  talent.value = false;
                                                  ind.value=false;
                                                  cor.value=false;
                                                },
                                                activeColor:
                                                    const Color(0xffeaa900),
                                                splashRadius: 12,
                                              );
                                            },
                                            valueListenable: employer,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          InkWell(onTap: (){
                                            employer.value = !employer.value;
                                            talent.value = false;
                                            ind.value=false;
                                            cor.value=false;
                                          },child: const Text('Employer'))
                                        ],
                                      ),
                                      collapsed: Container(
                                        height: 0,
                                      ),
                                      expanded: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              ValueListenableBuilder(
                                                builder: (BuildContext context,
                                                    bool value, Widget? child) {
                                                  return Checkbox(
                                                    value: value,
                                                    onChanged: (value) {
                                                      ind.value = value!;
                                                      talent.value = false;
                                                      cor.value = false;
                                                      if(!employer.value){
                                                        employer.value=true;
                                                      }
                                                    },
                                                    activeColor:
                                                        const Color(0xffeaa900),
                                                    splashRadius: 12,
                                                  );
                                                },
                                                valueListenable: ind,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              InkWell(onTap: (){
                                                ind.value = !ind.value;
                                                talent.value = false;
                                                cor.value = false;
                                                if(!employer.value){
                                                  employer.value=true;
                                                }
                                              },child: const Text('Individual'))
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              ValueListenableBuilder(
                                                builder: (BuildContext context,
                                                    bool value, Widget? child) {
                                                  return Checkbox(
                                                    value: value,
                                                    onChanged: (value) {
                                                      cor.value = value!;
                                                      talent.value = false;
                                                      ind.value = false;
                                                      if(!employer.value){
                                                        employer.value=true;
                                                      }
                                                    },
                                                    activeColor:
                                                        const Color(0xffeaa900),
                                                    splashRadius: 12,
                                                  );
                                                },
                                                valueListenable: cor,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              InkWell(onTap: (){
                                                cor.value = !cor.value;
                                                talent.value = false;
                                                ind.value = false;
                                                if(!employer.value){
                                                  employer.value=true;
                                                }
                                              },child: const Text('Corporate'))
                                            ],
                                          )
                                        ],
                                      ),
                                      builder: (_, collapsed, expanded) {
                                        return Expandable(
                                          collapsed: collapsed,
                                          expanded: expanded,
                                          theme: const ExpandableThemeData(
                                              crossFadePoint: 0),
                                        );
                                      }))
                            ]))),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){
                            if(talent.value){
                              Navigator.of(context).push(Routing().createRoute(const RegTalentInformation()));
                            }else if(employer.value){
                              if(ind.value){
                                Navigator.of(context).push(Routing().createRoute(const RegPersonInformation()));
                              }else if(cor.value){
                                Navigator.of(context).push(Routing().createRoute(const RegCorInformation()));
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select employer role')));
                              }
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select a role')));
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffeaa900),
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(color: const Color(0xffeaa900))),
                            child: const Padding(
                              padding:  EdgeInsets.fromLTRB(20, 8, 20, 8),
                              child:  Center(child: Text('Next',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Already a member? '),
                      Text(' Log In',style: TextStyle(color: Color(0xffeaa900)),),
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
}
