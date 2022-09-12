import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ifood/app_constants/dimensions.dart';
import 'package:ifood/app_constants/text_styles.dart';
import 'package:image_picker/image_picker.dart';

import '../../app_constants/reuseable_widgets/underlined_textfield.dart';
import '../../app_constants/route_helper.dart';
import '../controllers/user_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future pickImage() async {
      try {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        final imageTemporary = File(image.path);
        setState(() => this.image = imageTemporary);
      } on PlatformException catch (e) {
        print('Failed to pick image');
      }
    }

    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController phone = TextEditingController();

    // var user=Get.find<UserController>().user;
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.toNamed(RouteHelper.getFoodScreen());
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  )),
              SizedBox(
                width: 100,
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black, size: 40),
        ),
        body: Container(
          height: Dimensions.h,
          width: Dimensions.w,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/foodwall1.jpg'),
            fit: BoxFit.cover,
          )),
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            color: Colors.black.withOpacity(0.7),
            child: Column(
              children: [
                image != null
                    ? Image.file(image!)
                    : Container(
                        margin: EdgeInsets.only(top: 100),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Dimensions.color,
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {
                              pickImage();
                            },
                            child: CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 20,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                UnderlinedTextField(
                  controller: name,
                  text: 'Name',
                  icon: Icons.contact_page_rounded,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                UnderlinedTextField(
                  controller: email,
                  text: 'Email',
                  icon: Icons.message,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                UnderlinedTextField(
                  controller: phone,
                  text: 'Phone number',
                  icon: Icons.call,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ));
  }
}
