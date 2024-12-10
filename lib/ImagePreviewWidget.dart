import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePreviewWidget extends StatefulWidget {
  const ImagePreviewWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ImagePreviewState();
  }
}

class _ImagePreviewState extends State<ImagePreviewWidget> {
  XFile? image;
  ImagePicker picker = ImagePicker();

  Future<void> _onPressed () async {
    print('pressed >>>');
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: _onPressed,
      child: Container(
          child: image == null ?
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: const Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.insert_photo_outlined,
                  color: Color(0xffF67D73),
                  size: 26,
                ),
                Text('Add Profile',
                  softWrap: true,
                  style: TextStyle(
                      color: Color(0xffF67D73),
                      fontWeight: FontWeight.w400,
                      fontSize: 12
                  ),),
                Text('Picture',
                  softWrap: true,
                  style: TextStyle(
                      color: Color(0xffF67D73),
                      fontWeight: FontWeight.w400,
                      fontSize: 12
                  ),),
              ],
            ),
          ) :
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: const Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                image: FileImage(File(image!.path)),
                fit: BoxFit.cover,
              )
            ),
          )
      ),
    );
  }

}

