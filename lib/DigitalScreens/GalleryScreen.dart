import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_national_dawn/Common/Constants.dart';
import 'package:the_national_dawn/DigitalCommon/Constants.dart' as cnst;
import 'package:the_national_dawn/DigitalCommon/Services.dart';
import 'package:video_player/video_player.dart';

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  File _Image;
  List<Asset> images = List<Asset>();
  bool isLoading = false;

  String _error = 'No Error Dectected';

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');
    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file;
  }
  Save() async {
    List files = [];
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          //isLoading = true;
        });
        for (int i = 0; i < images.length; i++) {
          print(
              "heloooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo");
          String filename = "";
          String filePath = "";
          File compressedFile;
          File _imageEvent = await File(images[i].identifier);
          print("${_imageEvent.path}");
          log("IMage wvwnt===${_imageEvent.path}");
          print("222222222222222222222222222222222222222222");
          if (_imageEvent != null) {
            print(_imageEvent);
            print(FlutterNativeImage.getImageProperties(_imageEvent.path));
            ImageProperties properties = await FlutterNativeImage.getImageProperties(_imageEvent.path);
            compressedFile = await FlutterNativeImage.compressImage(
              _imageEvent.path,
              quality: 80,
              targetWidth: 600,
              targetHeight:
                  (properties.height * 600 / properties.width).round(),
            );
            print(_imageEvent.path);
            print("333333333333333333333333333333333333333333333333333");
            filename = _imageEvent.path.split('/').last;
            print("4444444444444444444444444444444444444444444444444444444444444");
            filePath = compressedFile.path;
            print(filePath);

            files.add((filePath != null && filePath != '')
                ? await MultipartFile.fromFile(filePath,
                    filename: filename.toString())
                : null);
            log("file=====${files}");
          }
        }
        SharedPreferences prefs = await SharedPreferences.getInstance();
        FormData body = FormData.fromMap({
          "memberid": prefs.getString(cnst.Session.MemberId),
          "images": files
          //"videos": _video
        });
        Services.PostForList4(api_name: 'card/addimages', body: body).then(
            (subCatResponseList) async {
          print("a0");
          setState(() {
            isLoading = false;
          });
          if (subCatResponseList.length > 0) {
            print("a1");

            Fluttertoast.showToast(
                msg: "Data Saved",
                backgroundColor: Colors.green,
                gravity: ToastGravity.TOP);
            Navigator.popAndPushNamed(context, '/Dashboard');
          } else {
            print("a2");
            Fluttertoast.showToast(
                msg: "Data Not Saved",
                backgroundColor: Colors.red,
                gravity: ToastGravity.TOP,
                toastLength: Toast.LENGTH_LONG);
            //show "data not found" in dialog
          }
        }, onError: (e) {
          setState(() {
            isLoading = false;
          });
          print("error on call -> ${e.message}");
          Fluttertoast.showToast(msg: "Something Went Wrong");
        });
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(msg: "No Internet Connection.");
    }
  }

  Widget buildGridView() {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: appPrimaryMaterialColor, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
        // boxShadow: [
        //   BoxShadow(
        //       color: cnst.appPrimaryMaterialColor.withOpacity(0.2),
        //       blurRadius: 2.0,
        //       spreadRadius: 2.0,
        //       offset: Offset(3.0, 5.0))
        // ]
      ),
      child: images.length == 0
          ? Center(
              child: Text(
                "Select Images",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(images.length, (index) {
                Asset asset = images[index];
                return AssetThumb(
                  asset: asset,
                  width: 300,
                  height: 300,
                );
              }),
            ),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

//for videoes
  File _video;
  File _cameraVideo;
  File bothVideo;
  ImagePicker picker = ImagePicker();

  VideoPlayerController _videoPlayerController;
  VideoPlayerController _cameraVideoPlayerController;

// This funcion will helps you to pick a Video File
  _pickVideo() async {
    PickedFile pickedFile = await picker.getVideo(source: ImageSource.gallery);

    _video = File(pickedFile.path);

    _videoPlayerController = VideoPlayerController.file(_video)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  // This funcion will helps you to pick a Video File from Camera
  _pickVideoFromCamera() async {
    PickedFile pickedFile = await picker.getVideo(source: ImageSource.camera);

    _video = File(pickedFile.path);

    _videoPlayerController = VideoPlayerController.file(_video)
      ..initialize().then((_) {
        setState(() {});
        // _cameraVideoPlayerController.play();
        _videoPlayerController.play();
      });
  }

  void _VideoPopup(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.camera_alt),
                    title: new Text('Camera'),
                    onTap: () async {
                      _pickVideoFromCamera();

                      Navigator.pop(context);
                    }),
                new ListTile(
                    leading: new Icon(Icons.photo),
                    title: new Text('Gallery'),
                    onTap: () async {
                      _pickVideo();
                      Navigator.pop(context);
                    }),
              ],
            ),
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Gallery")),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Save();
        },
        child: Container(
          height: 50,
          color: cnst.buttoncolor,
          child: Center(
              child: Text(
            "Upload Images/Video ",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          )),
        ),
      ),
      body: SingleChildScrollView(
        child: isLoading == true
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  strokeWidth: 3,
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  buildGridView(),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: RaisedButton(
                        onPressed:
                            // _settingModalBottomSheet();
                            loadAssets,
                        color: cnst.buttoncolor,
                        textColor: Colors.white,
                        shape: StadiumBorder(),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.save,
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text("Select Image",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (_video != null)
                    _videoPlayerController.value.initialized
                        ? AspectRatio(
                            aspectRatio:
                                _videoPlayerController.value.aspectRatio,
                            child: VideoPlayer(_videoPlayerController),
                          )
                        : Container(),
                  // else
                  //   Text(
                  //     "Click on Pick Video to select video",
                  //     style: TextStyle(fontSize: 18.0),
                  //   ),
                  // RaisedButton(
                  //   onPressed: () {
                  //     // _pickVideo();
                  //     _VideoPopup(context);
                  //   },
                  //   child: Text("Pick Video From Gallery"),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: RaisedButton(
                        onPressed: () {
                          _VideoPopup(context);
                        },
                        color: cnst.buttoncolor,
                        textColor: Colors.white,
                        shape: StadiumBorder(),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.video_call_rounded,
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text("Select Video",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // if (_cameraVideo != null)
                  //   _cameraVideoPlayerController.value.initialized
                  //       ? AspectRatio(
                  //           aspectRatio:
                  //               _cameraVideoPlayerController.value.aspectRatio,
                  //           child: VideoPlayer(_cameraVideoPlayerController),
                  //         )
                  //       : Container()
                  // else
                  //   Text(
                  //     "Click on Pick Video to select video",
                  //     style: TextStyle(fontSize: 18.0),
                  //   ),
                  // RaisedButton(
                  //   onPressed: () {
                  //     _pickVideoFromCamera();
                  //   },
                  //   child: Text("Pick Video From Camera"),
                  // ),
                ],
              ),
      ),
    );
  }
}
