import 'package:flutter/material.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/screens/auth_screens/login.dart';
import 'package:narr/shared/themes/colors.dart';
import 'package:narr/shared/widgets/buttons/primary_raised_button.dart';
import 'package:narr/shared/widgets/cards/form_card.dart';
import 'package:narr/shared/widgets/forms/Text_field_container.dart';
import 'package:narr/shared/widgets/forms/auth_textfield.dart';
import 'package:narr/shared/widgets/forms/multi_input_textield.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  List institutionTypes = [];
  List institutionName = [];
  List institutionCategory = ['Federal', 'State', 'Private', 'Independent'];

  List _specialization = [];
  List _interest = [];

  String selectedInstitutionType = '';
  String selectedInstitutionCategory = '';
  String selectedInstitutionName = '';

  bool institutonTypeFlag = false;
  bool institutonNameFlag = false;
  bool _obscureText = true;
  late dynamic institutionObject;

  DateTime selectedDate = DateTime.now();
  bool isPicked = false;

  String dateValidator = '';

  @override
  void initState() {
    super.initState();
    narrService.institutionService.getInstitutionType().then((value) {
      setState(() {
        institutionTypes = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String dob = '${selectedDate.toLocal()}'.split(' ')[0];

    return Scaffold(
      backgroundColor: Color(0xff00a368),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 15),
            child: Column(
              children: <Widget>[
                Text(
                  'Hello! Researcher ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                FormCard(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 15),
                        Text(
                          'CREATE ACCOUNT',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Color(0xff00a368),
                          ),
                        ),
                        SizedBox(height: 15),
                        AuthTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'First Name is required';
                            }
                            return null;
                          },
                          hint: 'First Name',
                          prefixIcon: Icon(Icons.person),
                          controller: fName,
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        AuthTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Last Name is required';
                            }
                            return null;
                          },
                          hint: 'Last Name',
                          prefixIcon: Icon(Icons.person),
                          controller: lName,
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        AuthTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email is required';
                            } else if (!value.contains('@')) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                          hint: 'Email',
                          prefixIcon: Icon(Icons.email),
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            narrService.utilityService
                                .selectDate(context)
                                .then((value) {
                              setState(() {
                                selectedDate = value;
                                isPicked = true;
                              });
                            });
                          },
                          child: TextFieldContainer(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.grey[600],
                                    size: 20,
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    isPicked ? dob : 'Date of Birth',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        AuthTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Phone is required';
                            }
                            return null;
                          },
                          hint: 'Phone Number',
                          prefixIcon: Icon(Icons.phone),
                          keyboardType: TextInputType.phone,
                          controller: phone,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        AuthTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Address is required';
                            }
                            return null;
                          },
                          hint: 'Address',
                          prefixIcon: Icon(Icons.home),
                          controller: address,
                        ),
                        SizedBox(height: 15.0),
                        TextFieldContainer(
                          child: DropdownButtonFormField<dynamic>(
                            validator: (value) {
                              if (value == null) {
                                return 'Please select an institution type';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Icon(Icons.school),
                            ),
                            hint: Text(
                              'Institution Type',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            items: institutionTypes.map((item) {
                              return new DropdownMenuItem(
                                child: new Text(item),
                                value: item.toString(),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedInstitutionType = value;
                                institutonTypeFlag = true;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        institutonTypeFlag
                            ? TextFieldContainer(
                                child: DropdownButtonFormField<dynamic>(
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select an institution category';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    prefixIcon: Icon(Icons.school),
                                  ),
                                  hint: Text(
                                    'Institution Category',
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                  items: institutionCategory.map((item) {
                                    return new DropdownMenuItem(
                                      child: new Text(item),
                                      value: item.toString(),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedInstitutionCategory = value;
                                      narrService.institutionService
                                          .getInstitutionName(
                                              type: selectedInstitutionType,
                                              category:
                                                  selectedInstitutionCategory)
                                          .then((value) {
                                        setState(() {
                                          institutionName = value;
                                        });
                                      });
                                      institutonNameFlag = true;
                                    });
                                  },
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: 15.0,
                        ),
                        institutonNameFlag
                            ? TextFieldContainer(
                                child: DropdownButtonFormField<dynamic>(
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select an institution name';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    prefixIcon: Icon(Icons.school),
                                  ),
                                  hint: Text(
                                    'Institution Name',
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                  isExpanded: true,
                                  items: narrService.utilityService
                                      .getInstitutionNameDropdownItems(
                                    institutionName,
                                  ),
                                  onChanged: (value) {
                                    narrService.institutionService
                                        .getInstitutionObject(name: value)
                                        .then((value) {
                                      institutionObject = value;
                                    });
                                  },
                                ),
                              )
                            : Container(),
                        SizedBox(height: 15.0),
                        MultiInputTextField(
                          inputs: _specialization,
                          hintText: 'Area of Specialization',
                          icon: Icons.settings_suggest,
                        ),
                        SizedBox(height: 15.0),
                        MultiInputTextField(
                          inputs: _interest,
                          hintText: 'Area of Interest',
                          icon: Icons.bar_chart,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        AuthTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is required';
                            } else if (value.length < 6) {
                              return 'Password can\t be less than 6 characters';
                            }
                            return null;
                          },
                          hint: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(Icons.visibility),
                          ),
                          isObsecure: _obscureText,
                          controller: password,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        AuthTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Confirm Password is required';
                            } else if (cPassword.text != password.text) {
                              return 'Passwords not matched';
                            }
                            return null;
                          },
                          hint: 'Confirm Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          isObsecure: _obscureText,
                          controller: cPassword,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        PrimaryRaisedButton(
                          onTap: (startLoading, stopLoading, btnState) {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              startLoading();
                              narrService.authService
                                  .register(
                                      fName: fName.text,
                                      lName: lName.text,
                                      dob: dob,
                                      phone: phone.text,
                                      address: address.text,
                                      institution: institutionObject,
                                      email: email.text,
                                      password: cPassword.text,
                                      interest: narrService.utilityService
                                          .getTagItem(_interest),
                                      specialization: narrService.utilityService
                                          .getTagItem(_specialization),
                                      context: context)
                                  .then((value) {
                                stopLoading();
                              });
                            }
                          },
                          buttonTitle: 'Register',
                          buttonColor: NarrColors.royalGreen,
                        ),
                        SizedBox(height: 35),
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context)
                            //     .pushReplacementNamed(RegisterOrg.id);
                          },
                          child: Text(
                            'Register as an Organisation',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 35),
                        GestureDetector(
                          onTap: () {
                            narrService.routerService
                                .nextRoute(context, Login());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text('Already have an account?'),
                                  SizedBox(width: 5),
                                  Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Color(0xff00a368),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
