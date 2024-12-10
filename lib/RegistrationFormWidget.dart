import 'package:app/PostWidget.dart';
import 'package:flutter/material.dart';

class RegistrationFormWidget extends StatefulWidget {
  const RegistrationFormWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RegistrationFormState();
  }
}

enum Gender { male, female}

class _RegistrationFormState extends State<RegistrationFormWidget> {
  final _formKey = GlobalKey<FormState>();

  String? selectedValue;
  Gender? _gender = Gender.male;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final anchorNameController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Student", child: Text("Student")),
      const DropdownMenuItem(value: "Teacher", child: Text("Teacher")),
      const DropdownMenuItem(value: "Institute", child: Text("Institute")),
      const DropdownMenuItem(value: "Admin", child: Text("Admin")),
    ];
    return menuItems;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    controller: firstNameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: 'First Name',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                            color: Color(0xff737373),
                            fontWeight: FontWeight.w400,
                            fontSize: 12)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    },
                  )),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: TextFormField(
                    controller: lastNameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: 'Last Name',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                            color: Color(0xff737373),
                            fontWeight: FontWeight.w400,
                            fontSize: 12)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Last name is required";
                      }
                      return null;
                    },
                  )),
                ],
              ),
            ),// first and last name
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: anchorNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: 'Anchor',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                        color: Color(0xff737373),
                        fontWeight: FontWeight.w400,
                        fontSize: 12)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Anchor is required";
                  }
                  return null;
                },
              ),
            ), // Anchor
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: anchorNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                        color: Color(0xff737373),
                        fontWeight: FontWeight.w400,
                        fontSize: 12)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Description is required";
                  }
                  return null;
                },
              ),
            ), // Description
            Padding(padding: const EdgeInsets.all(16),
            child: TextFormField(
              controller: dobController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Date of birth",
                labelStyle: TextStyle(
                    color: Color(0xff737373),
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
                ),
              onTap: () async {
                DateTime? date = DateTime(1900);
                FocusScope.of(context).requestFocus(FocusNode());

                date = await showDatePicker(
                    context: context,
                    initialDate:DateTime.now(),
                    firstDate:DateTime(1900),
                    lastDate: DateTime(2100));
                dobController.text = "${date!.day}-${date.month}-${date.year}";
              },
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "Date of birth is required";
                }
                return null;
              },
            )
            ), //  Date of birth
            const Padding(padding: EdgeInsets.only(left: 16, right: 16),
              child: Text('Gender',
                style: TextStyle(
                    color: Color(0xff737373),
                    fontSize: 12,
                  ),),
            ), //Gender
            Row(
              children: [
                Expanded(child:
                  ListTile(
                    title: const Text('Female', style: TextStyle(
                      color: Color(0xff404040),
                      fontSize: 16,
                    ),),
                    leading: Radio<Gender>(
                      value: Gender.female,
                      groupValue: _gender,
                      onChanged: (Gender? value) {
                        setState(() {
                          _gender = value!;
                          genderController.text = value.name;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(child:
                  ListTile(
                    title: const Text('Male', style: TextStyle(
                      color: Color(0xff404040),
                      fontSize: 16,
                    ),),
                    leading: Radio<Gender>(
                      value: Gender.male,
                      groupValue: _gender,
                      onChanged: (Gender? value) {
                        setState(() {
                          _gender = value!;
                          genderController.text = value.name;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),// Radio
            Padding(padding: const EdgeInsets.all(16),
            child: DropdownButtonFormField(
                items: dropdownItems,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Select Type',
                    labelStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff737373)
                    ),
                  // filled: true,
                  // fillColor: Colors.blue
                  // enabledBorder: OutlineInputBorder(borderRadius: )
                ),
                value: selectedValue,
                focusColor: Colors.transparent,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                validator: (value) {
                    if(value == null || value.isEmpty) {
                      return "Type is required";
                    }
                    return null;
                },
              ),
            ), // Select
            Padding(padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email Id',
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: Color(0xff737373),
                    fontWeight: FontWeight.w400,
                  )
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Email id is required";
                  }
                  return null;
                },
              ),
            ),// Email id
            Padding(padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: cityController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'City',
                    labelStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff737373),
                      fontWeight: FontWeight.w400,
                    )
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "City is required";
                  }
                  return null;
                },
              ),
            ), // City
            Padding(padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: stateController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'State',
                    labelStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff737373),
                      fontWeight: FontWeight.w400,
                    )
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "State is required";
                  }
                  return null;
                },
              ),
            ), // State
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                children: [
                  Expanded(child:
                    ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xECE8E8FF),
                          foregroundColor: const Color(0xff1D1B20)
                      ),
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState!.validate()) {
                          // Process data.
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PostWidget()),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  )
                ],
              )
            ),
          ],
        ));
  }
}
