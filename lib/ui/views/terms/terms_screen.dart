import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tjw_ue/ui/views/terms/terms_controller.dart';



import '../../../common_widget/common_button.dart';
import '../../../core/res/colors.dart';
import '../gst/gst_screen.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {

  final TermsController controller = Get.put(TermsController());


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        children: [
          Container(
            height: size.height * 0.7,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/splash_background.png'),
                // Replace with your image path
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
              children: [
                SizedBox(height: 50),
                Center(
                  child: Text(
                    "TERMS & CONDITIONS",
                    style: TextStyle(fontSize: 20, color: AppColor.white,fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  controller.termsContent,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Text(
            "By creating passcode you agree with our \n Terms & Conditions and Privacy Policy",
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CommonButton(text: "I Agree", onPressed: (){
              Get.to(() => GstScreen());
            }),
          ),
          SizedBox(height: 20,)

        ],
      ),
    );
  }
}
