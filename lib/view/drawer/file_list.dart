import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/file_list.dart';
import '../../service/db_service.dart';
import '../component/app_style.dart';
//import 'package:pull_to_refresh/pull_to_refresh.dart';

class FileList extends StatefulWidget {
  const FileList({Key? key}) : super(key: key);

  @override
  State<FileList> createState() => _FileListState();
}

class _FileListState extends State<FileList> {
  // RefreshController _refreshController =
  //     RefreshController(initialRefresh: false);

  // void _onRefresh() async {
  //   // monitor network fetch
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   // if failed,use refreshFailed()
  //   _refreshController.refreshCompleted();
  // }

  // void _onLoading() async {
  //   // monitor network fetch
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   // if failed,use loadFailed(),if no data return,use LoadNodata()
  //   selectImages();
  //   openImagePicker();
  //   openImagePicker0();
  //   openImagePicker2();
  //   openImagePicker3();
  //   if (mounted) setState(() {

  //   });
  //   _refreshController.loadComplete();
  // }

  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }

  File? _image;

  final _picker = ImagePicker();

  Future<void> openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  File? image0;

  final picker0 = ImagePicker();

  Future<void> openImagePicker0() async {
    final XFile? pickedImage =
        await picker0.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image0 = File(pickedImage.path);
      });
    }
  }

  File? image1;

  final picker1 = ImagePicker();

  Future<void> openImagePicker1() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image1 = File(pickedImage.path);
      });
    }
  }

  File? image2;

  final picker2 = ImagePicker();
  Future<void> openImagePicker2() async {
    final XFile? pickedImage2 =
        await picker2.pickImage(source: ImageSource.gallery);
    if (pickedImage2 != null) {
      setState(() {
        image2 = File(pickedImage2.path);
      });
    }
  }

  File? image3;

  final picker3 = ImagePicker();
  Future<void> openImagePicker3() async {
    final XFile? pickedImage3 =
        await picker3.pickImage(source: ImageSource.gallery);
    if (pickedImage3 != null) {
      setState(() {
        image3 = File(pickedImage3.path);
      });
    }
  }

  updata() {
    // selectImages();
    //        openImagePicker();
    //        openImagePicker0();
    //      openImagePicker2();
    //        openImagePicker3();
    getFileListData();
  }

  bool IsEdit = false;
  getFileListData() async {
    var data = await DBService().getFileList();
    setState(() {
      fileList = data;
    });
  }

  List<Datum> fileList = [];

  @override
  void initState() {
    getFileListData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 250,
      backgroundColor: secondaryColor,
      color: Colors.white,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        await Future.delayed(Duration(milliseconds: 2000));
        setState(() {});
        updata();
        print('HEllo');
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
                //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)=>HomeScreen()));
              }),
          title: Text(
            "File List",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    IsEdit = !IsEdit;
                  });
                },
                child: Icon(Icons.edit)),
            SizedBox(
              width: 20,
            )
          ],
          backgroundColor: primaryColor,
          elevation: 0,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: ListView.builder(
                  itemCount: fileList.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      color: secondaryColor,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fileList[index].id.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            fileList[index].memberId.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            fileList[index].certificate.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            fileList[index].createdBy.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            fileList[index].createdAt.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  }))
              //ListView(
              // children: [

              // Image_Picker(
              //     tital: 'Upload Nid Font Side Image :',
              //     galerryImage: _image,
              //     placeholderImage:
              //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTODJ46pluLiSz4g3OTHmBKhghafxiUpaHgRT4bIDREn2DztO7epvr8gyToPaNVrGf4r_4&usqp=CAU",
              //     openImagePickers: openImagePicker),

              // SizedBox(
              //   height: 10,
              // ),
              // Image_Picker(
              //     tital: 'Upload Nid Back Side Image :',
              //     galerryImage: image0,
              //     placeholderImage:
              //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnXgPqTiRpa3JVLydKHA66KlTuBOY_jCbpbOZDdH5Lfg&s",
              //     openImagePickers: openImagePicker0),

              // SizedBox(
              //   height: 10,
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Image_Picker(
              //     tital: 'Upload SSC Certificate :',
              //     galerryImage: image1,
              //     placeholderImage:
              //         "https://media.istockphoto.com/vectors/certificate-template-retro-design-background-vector-id626426672",
              //     openImagePickers: openImagePicker1),
              // SizedBox(
              //   height: 10,
              // ),
              // Image_Picker(
              //     tital: 'Upload  HSC Certificate :',
              //     galerryImage: image2,
              //     placeholderImage:
              //         "https://media.istockphoto.com/vectors/certificate-template-retro-design-background-vector-id626426672",
              //     openImagePickers: openImagePicker2),
              // SizedBox(
              //   height: 10,
              // ),
              // Image_Picker(
              //     tital: 'Upload BSC Certificate :',
              //     galerryImage: image3,
              //     placeholderImage:
              //         "https://media.istockphoto.com/vectors/certificate-template-retro-design-background-vector-id626426672",
              //     openImagePickers: openImagePicker3)
              // ],
              //),
              ),
        ),
      ),
    );
  }

  Image_Picker(
      {tital, var galerryImage, placeholderImage, Function? openImagePickers}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tital,
          //style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Stack(
            children: [
              Card(
                // elevation: 50,
                // shadowColor: Colors.black.withOpacity(.5),
                child: Container(
                  width: 330,
                  height: 130,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor),

                    //  shape: BoxShape.circle,

                    // image: DecorationImage(
                    //     fit: BoxFit.cover,
                    //     image:
                    //     //  NetworkImage(
                    //     //   "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png",
                    //     // )
                  ),
                  child: galerryImage != null
                      ? Center(
                          child: Container(
                              decoration: BoxDecoration(),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(00),
                                  child: Image.file(
                                    galerryImage,
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                  ))))
                      : Center(
                          child: Container(
                          decoration: BoxDecoration(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(00),
                            child: Image.network(
                              placeholderImage,
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                          ),
                        )
                          // const Text('Please select an image')

                          ),
                ),
              ),
              IsEdit == true
                  ? Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: secondaryColor),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                openImagePickers!();
                                print(openImagePicker);
                              });
                              // setState(() {
                              //   onTap!;
                              // });
                              // print(_openImagePicker());
                            },
                            child: Center(
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          )))
                  : Container()
            ],
          ),
        ),
      ],
    );
  }
}
