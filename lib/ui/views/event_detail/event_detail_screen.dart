import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import '../../../common_widget/common_button.dart';
import '../../../core/res/colors.dart';
import '../visitor_detail/visitor_detail_screen.dart';
import 'event_detail_controller.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({super.key});

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  final EventDetailController controller = Get.put(EventDetailController());

  @override
  void initState() {
    controller.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true, // Carousel can go under app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/back_arrow.png', height: 30, width: 30),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SizedBox.expand(
        // Ensures Stack fills the screen
        child: Stack(
          children: [
            // Background carousel
            CarouselSlider(
              items:
                  controller.bannerImages.map((url) {
                    return Container(
                      width: double.infinity,
                      color: Colors.black12,
                      child: CachedNetworkImage(
                        imageUrl: url,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        placeholder:
                            (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                        errorWidget:
                            (context, url, error) => Image.asset(
                              'assets/updateBanner.png',
                              fit: BoxFit.cover,
                            ),
                      ),
                    );
                  }).toList(),
              options: CarouselOptions(
                height: size.height * 0.4,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  controller.currentImageIndex.value = index;
                },
              ),
            ),

            Positioned(
              top: size.height * 0.4 - 40,
              left: 0,
              right: 0,
              child: Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.bannerImages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width:
                          controller.currentImageIndex.value == index ? 10 : 8,
                      height:
                          controller.currentImageIndex.value == index ? 10 : 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            controller.currentImageIndex.value == index
                                ? AppColor.primary
                                : Color(0xffeae8e1),
                      ),
                    ),
                  ),
                );
              }),
            ),

            // Foreground rounded container
            Positioned(
              top: size.height * 0.4 - 20,
              // Slight overlap
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34),
                    topRight: Radius.circular(34),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 10,
                      right: 20,
                      bottom: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "Gems and Jewelry India International Fair",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Lottie.asset(
                              'assets/live_pulse.json',
                              width: 20,
                              height: 20,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: 6),
                            Text(
                              "19th  - 22nd  Dec, 2025",
                              style: TextStyle(
                                color: AppColor.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '₹500 ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 34,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: "till 30th Nov",
                                style: TextStyle(
                                  color: AppColor.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "₹ 1,000 - 1st to 12th Dec. 2025",
                          style: TextStyle(
                            color: AppColor.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "₹ 1,500 - 12th to 18th Dec. 2025",
                          style: TextStyle(
                            color: AppColor.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 16),
                        CommonButton(
                          text: "Register Now",
                          onPressed: () {
                            Get.to(() => VisitorDetailScreen());
                          },
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Discover Brilliance at the 2025 Jewel Expo!",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Step into a world of elegance and craftsmanship at the Jewel Expo 2025, where the finest jewelry designers, brands, and artisans from around the globe gather under one roof. Explore a curated showcase of timeless pieces, cutting-edge trends, and one-of-a-kind creations that redefine luxury.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            height: 1.6, // for better line height
                          ),
                        ),
                        // SizedBox(height: 8),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: const [
                        //     Text(
                        //       'Event Highlights',
                        //       style: TextStyle(
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: 18,
                        //       ),
                        //     ),
                        //     SizedBox(height: 6),
                        //     Text('• 200+ Exhibitors representing 15+ countries',style: TextStyle(fontSize: 15,color: Colors.black87,),),
                        //     SizedBox(height: 4),
                        //     Text('• Trend showcases and style presentations',style: TextStyle(fontSize: 15,color: Colors.black87,),),
                        //     SizedBox(height: 4),
                        //     Text('• Live craftsmanship demonstrations',style: TextStyle(fontSize: 15,color: Colors.black87,),),
                        //     SizedBox(height: 4),
                        //     Text('• Meet & greet sessions with top designers',style: TextStyle(fontSize: 15,color: Colors.black87,),),
                        //     SizedBox(height: 4),
                        //     Text('• Exclusive previews of 2025 collections',style: TextStyle(fontSize: 15,color: Colors.black87,),),
                        //   ],
                        // ),
                        SizedBox(height: 20),
                        // CommonButton(
                        //   text: "Register Now",
                        //   onPressed: () {
                        //     Get.to(() => VisitorDetailScreen());
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
