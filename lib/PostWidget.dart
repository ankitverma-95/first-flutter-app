import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'ClassBottomSheet.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PostWidget();
  }

}


class _PostWidget extends State<PostWidget> {

  final ImagePicker _picker = ImagePicker();
  XFile? file;
  File? _video;
  VideoPlayerController? _videoPlayerController;


  Future<void> _onGallerySelect() async {
    file = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      
    });
  }

  Future<void> _onCameraSelect() async {
    file = await _picker.pickImage(source: ImageSource.camera);
    setState(() {

    });
  }

  Future<void> _onVideoSelect() async {

    XFile? pickedFile = await _picker.pickVideo(source: ImageSource.camera);
    _video = File(pickedFile!.path);
    _videoPlayerController = VideoPlayerController.file(_video!)..initialize().then((_) {
      setState(() { });
      _videoPlayerController!.play();
    });
  }

  Future<void> _onFileSelect() async {
   FilePickerResult? result = await FilePicker.platform.pickFiles();
    if(result != null) {
      PlatformFile s = result.files.first;
      file = result.files.first.xFile;
      setState(() {

      });
    } else {
       print('No file selected');
    }
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Post'),
        ),
        body: Column(
          children: [
            const PostHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        TextFormField(
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'What do you want to talk about?',
                              hintStyle: TextStyle(
                                color: Color(0xffd4d4d4),
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              )),
                        ),

                        file == null ? Container():
                        Image.file(File(file!.path)),

                        if(_video != null)
                          _videoPlayerController!.value.isInitialized
                              ? AspectRatio(
                            aspectRatio: _videoPlayerController!.value.aspectRatio,
                            child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  VideoPlayer(_videoPlayerController!),
                                  // ClosedCaption(text: _videoPlayerController!.value.caption.text),
                                  // _ControlsOverlay(controller: _controller),
                                  // VideoProgressIndicator(_videoPlayerController!, allowScrubbing: true),
                                  FloatingActionButton(
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: Colors.white,
                                    // focusColor: Colors.transparent,
                                    elevation: 0,
                                    onPressed: () {
                                      setState(() {
                                        _videoPlayerController!.value.isPlaying
                                            ? _videoPlayerController!.pause()
                                            : _videoPlayerController!.play();
                                      });
                                    },
                                    child: Icon(
                                      _videoPlayerController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                    ),
                                  ),
                                ],
                            )

                          )
                              : Container(),


                      ],
                    )
                ),
              )
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.public,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        'Public',
                        style: TextStyle(
                            color: Color(0xff404040),
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      IconButton(
                          onPressed: () {

                              showModalBottomSheet<void>(
                                context: context,
                                isScrollControlled: true,
                                useSafeArea: true,
                                builder: (context) => const ClassBottomSheet(),
                              );

                          },
                          icon: const Icon(Icons.keyboard_arrow_down_rounded))
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: _onGallerySelect,
                                icon: const Icon(
                                  Icons.insert_photo,
                                )),
                            IconButton(
                                onPressed: _onCameraSelect,
                                icon: const Icon(
                                  Icons.photo_camera,
                                )
                            ),
                            IconButton(
                                onPressed: _onVideoSelect,
                                icon: const Icon(
                                  Icons.video_camera_back_rounded,
                                )
                            ),
                            IconButton(
                                onPressed: _onFileSelect,
                                icon: const Icon(
                                  Icons.attach_file,
                                )
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff475AFF),
                              foregroundColor: const Color(0xffffffff),
                            ),
                            child: const Text('Post')),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ));
    // )
    // );
  }
}

class User {
  String? name;
  String? desc;
  String? photoUrl;

  User({required this.name, required this.desc, required this.photoUrl});
}

class PostHeader extends StatefulWidget {
  const PostHeader({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PostHeaderState();
  }
}

class _PostHeaderState extends State<PostHeader> {
  User selectedUser = User(
      name: 'Rahul Singh',
      desc: 'Father of Panthons and Rajni',
      photoUrl: 'https://randomuser.me/api/portraits/thumb/men/72.jpg');

  List<PopupMenuEntry<User>> get items {
    List<PopupMenuEntry<User>> menuItems = [
      PopupMenuItem(
        value: User(
            name: "Rahul Singh",
            desc: "Primary Profile",
            photoUrl: "https://randomuser.me/api/portraits/med/men/48.jpg"),
        child: const Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://randomuser.me/api/portraits/med/men/48.jpg"),
              radius: 20,
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              children: [
                Text(
                  'Rahul Singh',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff262626),
                  ),
                ),
                Text('Primary Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                      color: Color(0xffa3a3a3),
                    ))
              ],
            )
          ],
        ),
      ),
      PopupMenuItem(
        value: User(
            name: "Parithos Singh",
            desc: "Student of 10B at DAV",
            photoUrl: "https://randomuser.me/api/portraits/med/women/69.jpg"),
        child: const Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/med/women/69.jpg'),
              radius: 20,
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              children: [
                Text(
                  'Parithos Singh',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff262626),
                  ),
                ),
                Text('Student of 10B at DAV',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                      color: Color(0xffa3a3a3),
                    ))
              ],
            )
          ],
        ),
      ),
      PopupMenuItem(
        value: User(
            name: "Rajni Singh",
            desc: "Student of 7B at MAAPS",
            photoUrl: "https://randomuser.me/api/portraits/med/women/86.jpg"),
        child: const Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://randomuser.me/api/portraits/med/women/86.jpg"),
              radius: 20,
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rajni Singh',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff262626),
                  ),
                ),
                Text('Student of 7B at MAAPS',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                      color: Color(0xffa3a3a3),
                    ))
              ],
            )
          ],
        ),
      ),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: NetworkImage("${selectedUser.photoUrl}"))),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${selectedUser.name}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xff262626),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "${selectedUser.desc}",
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xffa3a3a3),
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            PopupMenuButton(
              icon: const Icon(Icons.keyboard_arrow_down),
              itemBuilder: (BuildContext context) => items,
              onSelected: (User value) {
                setState(() {
                  selectedUser = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// https://randomuser.me/api/portraits/med/women/69.jpg
// https://randomuser.me/api/portraits/med/men/48.jpg
// https://randomuser.me/api/portraits/med/women/54.jpg
// https://randomuser.me/api/portraits/med/women/86.jpg
//
