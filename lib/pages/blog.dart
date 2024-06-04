import 'package:adult_family_home/controller/adalena_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/web_navigation_controller.dart';
import '../helpers/constants.dart';
import '../helpers/enums.dart';
import '../helpers/widget_helper.dart';
import '../widgets/footer_widget.dart';

class BlogWidgets extends StatefulWidget {
  const BlogWidgets({super.key});

  @override
  State<BlogWidgets> createState() => _BlogWidgetsState();
}

class _BlogWidgetsState extends State<BlogWidgets> {
  final WebNavigationController webNavigationController = Get.put(WebNavigationController());
  final AdalenaController _adalenaController = Get.put(AdalenaController());

  @override
  void initState() {
    Future.delayed(Duration.zero, _init);
    super.initState();
  }

  _init () async {

  }

  fetchNews() async {
    await _adalenaController.getNewsApi().then((value) {
      if((value is bool) == false ){
        WidgetHelper.snackbar("Error", "Unable to fetch news");
      } else {
        WidgetHelper.snackbar("Success", "News Fed!");
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return  CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: const SizedBox(),
          pinned: false,
          floating: false,
          primary: true,
          expandedHeight: 600,
          flexibleSpace: FlexibleSpaceBar(
              background:  Stack(
                  children: [
                    Container(
                        decoration: BoxDecoration(),
                        height: 600,
                        width: double.infinity,
                        child: Image.asset("assets/images/house_background.jpeg",fit: BoxFit.cover,)
                    ),
                    Container(
                      height: 600,
                      width: double.infinity,
                      color: Color(Constants.primaryBlue()).withOpacity(0.5),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 30),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Image.asset(
                                  "assets/images/Blue House bottom text.png",
                                  height: 100,
                                  width: 220,
                                ),),
                              const Expanded(flex: 2,child: SizedBox(),),
                              Expanded(flex: 6,child: width > 920 ? dashboardTiles() : const SizedBox()),
                            ],
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 30),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "ADALENA FAMILY HOME ",
                          style: TextStyle(
                              fontSize: 45,
                              // fontWeight: FontWeight.w600,
                              color: Color(Constants.primaryWhite())
                          ),
                        ),
                      ),
                    )
                  ]
              )
          ),
          actions: [const SizedBox()],
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 1500,
            width: double.infinity,
            color: Color(Constants.primaryBlue()),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SizedBox(

                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              fetchNews();
                            },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Color(Constants.primaryBlue()),
                              child: Icon(Icons.restart_alt_outlined,color: Color(Constants.primaryWhite()),),
                            ),
                          ),
                        )
                      ],
                    ),
                    Obx(
                    ()=> _adalenaController.newsValidationResponse.isEmpty
                        ? const SizedBox(
                      height: 50,
                      width: 205,
                      child: Center(child: Text("Fetch News")),
                    )
                        :  SizedBox(
                        height: 1400,
                        child: ListView.builder(
                          reverse: true,
                          itemCount: _adalenaController.newsValidationResponse.value.length,
                            itemBuilder: (context, index) {
                             var news = _adalenaController.newsValidationResponse.value;
                             var image = news[index].urlToImage;
                             var description = news[index].description;
                             var title = news[index].title;
                             var url = news[index].url;
                             var publishedDate = news[index].publishedAt!.split(":").first;
                             var content = news[index].content;
                             var author = news[index].author!.contains(",") ? news[index].author!.split(",").first : news[index].author!;


                            return Card(
                              elevation: 5.0,
                              color: Color(Constants.primaryWhite()),
                              child: Container(
                                height: 500,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Image.network(
                                          image ?? "assets/images/background_4.png",
                                            fit: BoxFit.cover,
                                            height: 300,
                                            width: double.infinity,
                                          errorBuilder: (context, url, error) =>
                                          const Icon(Icons.error),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          children: [
                                             Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  author ?? "",
                                                  style: const TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  publishedDate  ,
                                                  style: const TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 12,),
                                            Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Text(
                                                title ?? "",
                                               style: TextStyle(
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(Constants.primaryGreen()),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Text(
                                                description ?? "",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 27,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(Constants.primaryBlue()),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Text(
                                                content  ?? "",
                                                maxLines: 5,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(Constants.primaryBlue()),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
            child: ClipRRect(child: FooterWidget())
        ),
      ],
    );
  }

  Widget dashboardTiles (){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        WidgetHelper.tileElement("Home", (){
          webNavigationController.adalenaPageType.value = AdalenaPageType.home;
        }),
        WidgetHelper.tileElement("Amenities", (){
          webNavigationController.adalenaPageType.value = AdalenaPageType.amenities;
        }),
        WidgetHelper.tileElement("Blog", (){
          webNavigationController.adalenaPageType.value = AdalenaPageType.blog;
        }),
        WidgetHelper.tileElement("Contact Us", (){
          webNavigationController.adalenaPageType.value = AdalenaPageType.contactUs;
        }),
        WidgetHelper.tileElement("About Us", (){
          webNavigationController.adalenaPageType.value = AdalenaPageType.aboutUs;
        }),

      ],
    );
  }
}
