import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:befit/standards.dart';

class ImageProcessing extends StatefulWidget {
  @override
  _ImageProcessingState createState() => _ImageProcessingState();
}

class _ImageProcessingState extends State<ImageProcessing> {
  bool _loading = true;
  late File _image;
  late List _output;
  final picker = ImagePicker(); //allows us to pick image from gallery or camera

  @override
  void initState() {
    //initS is the first function that is executed by default when this class is called
    super.initState();
  }

  @override
  void dispose() {
    //dis function disposes and clears our memory
    super.dispose();
    Tflite.close();
  }

  classifyImage(File image) async {
    try {
      //this function runs the model on the image
      var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults:
            3, //the amount of categories our neural network can predict (here no. of Body Types)
        threshold: 0.3,
        imageMean: 0.0,
        imageStd: 127.5,
      );
      setState(() {
        _output = output!;
        _loading = false;
      });
    } catch (e) {
      String e = 'please select take another photo';
      print(e);
    }
  }

  loadModel() async {
    //this function loads our model
    try {
      await Tflite.loadModel(
        model: 'assets/model_unquant.tflite',
        labels: 'assets/labels.txt',
      );
    } on PlatformException {
      print("Failed to load the model");
    }
  }

// permission to camera
  pickImage() async {
    //this function to grab the image from camera
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;

    await loadModel();

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  // permission to video

  pickGalleryImage() async {
    //this function to grab the image from gallery
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    // init classificationn model
    // loading
    // display result
    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Standards.colors["whiteColor"],
        centerTitle: true,
        title: Text(
          'Body Type Classification',
          style: TextStyle(
            color: Standards.colors["blackColor"],
            fontWeight: FontWeight.w500,
            fontSize: 23,
          ),
        ),
      ),
      body: Container(
        color: Standards.colors["primaryColorDark"],
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 22),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Standards.colors["whiteColor"],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(
                  child: _loading == true
                      ? null //show nothing if no picture selected
                      : Container(
                          child: Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width * 0.5,
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.file(
                                    _image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Divider(
                                  height: 18,
                                  thickness: 5,
                                  color: Standards.colors["primaryColorLight"]),

                              // ignore: unnecessary_null_comparison
                              _output != null && _output.length > 0
                                  ? Text(
                                      'Body Type is: ${_output[0]['label']}',
                                      style: TextStyle(
                                        color: Standards.colors['blackColor'],
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  : Container(), // TODO, add UI to show error message
                            ],
                          ),
                        ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Divider(
                        height: 18,
                        thickness: 5,
                        color: Standards.colors["primaryColorLight"]),
                  ],
                ),
              ),
              Container(
                child: Text(
                  'Note: Please stand 1 meter away and arms at you side  and ensure that when you are taking a picture of your body (from head to toe) is perfectly seen in the frame',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Divider(
                        height: 18,
                        thickness: 5,
                        color: Standards.colors["primaryColorLight"]),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: pickImage,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 150,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 252, 116, 190),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Take A Photo',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: pickGalleryImage,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 150,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 252, 116, 190),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Pick From Gallery',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
