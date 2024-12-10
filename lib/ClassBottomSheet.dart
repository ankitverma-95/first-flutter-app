import 'package:flutter/material.dart';

class ClassBottomSheet extends StatefulWidget {
  const ClassBottomSheet({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ClassBottomSheetState();
  }
}

enum Visible { public, restricted }

class ClassDetail {
  String? name;
  bool? checked;
  int? id;

  ClassDetail({required this.name, required this.checked, required this.id});
}

class _ClassBottomSheetState extends State<ClassBottomSheet> {
  String visibility = "public";

  Visible? _visible = Visible.public;

  List<ClassDetail> classList = [];
  List<ClassDetail> tmpClassList = [];
  List<ClassDetail> selectedClasses = [];

  @override
  void initState() {

    classList.add(ClassDetail(name: 'Nursery', checked: false, id: 1));
    classList.add(ClassDetail(name: 'LKG', checked: false, id: 2));
    classList.add(ClassDetail(name: 'UKG', checked: false, id: 3));
    classList.add(ClassDetail(name: '1-A', checked: false, id: 4));
    classList.add(ClassDetail(name: '1-B', checked: false, id: 5));
    classList.add(ClassDetail(name: '1-C', checked: false, id: 6));
    classList.add(ClassDetail(name: '2-A', checked: false, id: 7));
    classList.add(ClassDetail(name: '2-B', checked: false, id: 8));
    classList.add(ClassDetail(name: '2-C', checked: false, id: 9));
    classList.add(ClassDetail(name: '3-A', checked: false, id: 10));
    classList.add(ClassDetail(name: '3-B', checked: false, id: 11));
    classList.add(ClassDetail(name: '3-C', checked: false, id: 12));
    classList.add(ClassDetail(name: '4-A', checked: false, id: 13));
    classList.add(ClassDetail(name: '4-B', checked: false, id: 14));
    classList.add(ClassDetail(name: '4-C', checked: false, id: 15));
    classList.add(ClassDetail(name: '5-A', checked: false, id: 16));
    classList.add(ClassDetail(name: '5-B', checked: false, id: 17));
    classList.add(ClassDetail(name: '5-C', checked: false, id: 18));
    classList.add(ClassDetail(name: '6-A', checked: false, id: 19));
    classList.add(ClassDetail(name: '6-B', checked: false, id: 20));
    classList.add(ClassDetail(name: '6-C', checked: false, id: 21));
    classList.add(ClassDetail(name: '7-A', checked: false, id: 22));
    classList.add(ClassDetail(name: '7-B', checked: false, id: 23));
    classList.add(ClassDetail(name: '7-C', checked: false, id: 24));
    classList.add(ClassDetail(name: '8-A', checked: false, id: 25));
    classList.add(ClassDetail(name: '8-B', checked: false, id: 26));
    classList.add(ClassDetail(name: '8-C', checked: false, id: 27));
    classList.add(ClassDetail(name: '9-A', checked: false, id: 28));
    classList.add(ClassDetail(name: '9-B', checked: false, id: 29));
    classList.add(ClassDetail(name: '9-C', checked: false, id: 30));
    classList.add(ClassDetail(name: '10-A', checked: false, id: 31));
    classList.add(ClassDetail(name: '10-B', checked: false, id: 32));
    classList.add(ClassDetail(name: '10-C', checked: false, id: 33));
    classList.add(ClassDetail(name: '11-A', checked: false, id: 34));
    classList.add(ClassDetail(name: '11-B', checked: false, id: 35));
    classList.add(ClassDetail(name: '11-C', checked: false, id: 36));
    classList.add(ClassDetail(name: '12-A', checked: false, id: 37));
    classList.add(ClassDetail(name: '12-B', checked: false, id: 38));
    classList.add(ClassDetail(name: '12-C', checked: false, id: 39));

    tmpClassList = classList;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (visibility == 'public') {
      return DraggableScrollableSheet(
        expand: false,
        snap: true,
        initialChildSize: 0.28,
        builder: (_, controller) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  width: 30.0,
                  height: 3.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Choose Visiblity",
                              style: TextStyle(
                                  color: Color(0xff404040),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        ListTile(
                            leading: const Icon(Icons.public),
                            title: const Text(
                              'Public',
                              style: TextStyle(
                                color: Color(0xff404040),
                                fontSize: 16,
                              ),
                            ),
                            trailing: Radio<Visible>(
                              value: Visible.public,
                              groupValue: _visible,
                              onChanged: (Visible? value) {
                                setState(() {
                                  _visible = value!;
                                });
                              },
                            ),
                            onTap: () {
                              setState(() {
                                _visible = Visible.public;
                                visibility = "public";
                              });
                            }),
                        ListTile(
                          leading: const Icon(Icons.lock),
                          onTap: () {
                            setState(() {
                              _visible = Visible.restricted;
                              visibility = "restricted";
                            });
                          },
                          title: const Text('Restricted',
                              style: TextStyle(
                                color: Color(0xff404040),
                                fontSize: 16,
                              )),
                          trailing: Radio<Visible>(
                            value: Visible.restricted,
                            groupValue: _visible,
                            onChanged: (Visible? value) {
                              setState(() {
                                _visible = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    )),
              ],
            );
        },
      );
    } else {
      return DraggableScrollableSheet(
        expand: false,
        snap: true,
        initialChildSize: 0.5,
        minChildSize: 0.25,
        builder: (_, controller) {
          return SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  width: 30.0,
                  height: 3.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
                     child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Select Class', style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff262626),
                                fontWeight: FontWeight.w400,
                              )),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: const Color(0xff6750A4),
                                    foregroundColor: const Color(0xffffffff),
                                    // maximumSize: const Size(80, 30)
                                  ),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Done")
                              )
                            ],
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            hintText: "Search",
                            hintStyle: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff3c3c43),
                            ),
                            prefixIcon: const Icon(Icons.search),
                          ),
                          onChanged: (value) {
                            setState(() {
                              if(value.isNotEmpty) {
                                classList = classList.where((classDetail) {
                                  return classDetail.name!.toLowerCase().contains(value);
                                }).toList();
                              } else {
                                classList = tmpClassList;
                              }
                            });
                          }
                        ),

                        // Selected class list
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: selectedClasses.isNotEmpty ?
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Selected Class', style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffa3a3a3)
                                  ),)
                                ],
                              ) : null
                        ),
                        ListView(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          children: selectedClasses.map((selectedClassDetail) {
                            return CheckboxListTile(
                                value: true,
                                title: Text('${selectedClassDetail.name}'),
                                controlAffinity: ListTileControlAffinity.leading,
                                onChanged: (value) {
                                  setState(() {
                                    selectedClasses.removeWhere((selectedClass) {
                                      return selectedClass.id == selectedClassDetail.id;
                                    });
                                    classList.add(selectedClassDetail);
                                    for(int i = 0; i < classList.length; i++) {
                                      for (int j = 0; j < classList.length-i-1; j++) {
                                        if(classList[j].id! > classList[j+1].id!) {
                                          ClassDetail temp = classList[j];
                                          classList[j] = classList[j+1];
                                          classList[j+1] = temp;
                                        }
                                      }
                                    }
                                  });
                                }
                            );
                          }).toList(),
                        ),

                        // unselected class list
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: const Row(
                            children: [
                              Text('Unselected Class', style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffa3a3a3)
                              ),)
                            ],
                          ),
                        ),
                        ListView(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          children: classList.map((classDetail) {
                            return  CheckboxListTile(
                              value: false,
                              controlAffinity: ListTileControlAffinity.leading,
                              // leading: const Icon(Icons.check_box_outline_blank),
                              title: Text('${classDetail.name}'),
                              onChanged: (value) {
                                setState(() {
                                  selectedClasses.add(classDetail);
                                  classList.removeWhere((classElement) {
                                    return classElement.id == classDetail.id;
                                  });
                                });
                              },
                            );
                          }).toList()
                        )
                      ],
                    )),
              ],
            ),
          );
        },
      );
    }
  }
}
