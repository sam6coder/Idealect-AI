import 'package:food_allergens/model/user_details_model.dart';
import 'package:food_allergens/resources/cloudfirestore_methods.dart';
import 'package:food_allergens/utils/constants.dart';
import 'package:food_allergens/widgets/ad_banner_widget.dart';
import 'package:food_allergens/widgets/categories_horizontal_list_view_bar.dart';
import 'package:food_allergens/widgets/loading_widget.dart';
import 'package:food_allergens/widgets/products_showcase_list_view.dart';
import 'package:food_allergens/widgets/search_bar_widget.dart';
import 'package:food_allergens/widgets/simple_product_widget.dart';
import 'package:food_allergens/widgets/user_details_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  double offset = 0;
  List<Widget>? discount70;
  List<Widget>? discount60;
  List<Widget>? discount50;
  List<Widget>? discount0;
  List<String> images1 =[
  "https://e7.pngegg.com/pngimages/610/334/png-clipart-indian-cuisine-computer-icons-food-spice-ingredient-others-food-monochrome-thumbnail.png",
  "https://cdn-icons-png.flaticon.com/512/2674/2674465.png",
  "https://cdn-icons-png.flaticon.com/512/2094/2094538.png",
    "https://www.clipartmax.com/png/small/114-1145616_celebration-chicken-food-icon-png.png",
    "https://cdn-icons-png.flaticon.com/512/2553/2553651.png"
  ];
  final List<Widget> listImages1=[
    const Image(
      image: AssetImage('images/foodgrains/download.jpg'),
    ),
    const Image(
      image: AssetImage('images/foodgrains/foodgrain-1.png'),
    ),
    const  Image(
      image: AssetImage('images/foodgrains/front_image.jpg'),
    ),
    const  Image(
      image: AssetImage('images/bakery/croissant.jpg'),
    ),
    const  Image(
      image: AssetImage('images/foodgrains/oil.jpg'),
    ),
    const  Image(
      image: AssetImage('images/foodgrains/oily.jpg'),
    ),
    const  Image(
      image: AssetImage('images/packed/bana.jpg'),
    ),
  ];

  final List<Widget> listImages2=[
    const Image(
      image: AssetImage('images/bakery/amul.jpg'),
    ),
    const Image(
      image: AssetImage('images/foodgrains/foodgrain-1.png'),
    ),
    const  Image(
      image: AssetImage('images/beverages/bn.jpeg'),
    ),
    const  Image(
      image: AssetImage('images/foodgrains/grs.webp'),
    ),
    const  Image(
      image: AssetImage('images/beverages/ayu.jpg'),
    ),
    const  Image(
      image: AssetImage('images/packed/bars.jpg'),
    ),
    const  Image(
      image: AssetImage('images/packed/celeeb.webp'),
    ),
  ];

  final List<Widget> listImages3=[
    const Image(
      image: AssetImage('images/bakery/moz.jpg'),
    ),
    const Image(
      image: AssetImage('images/bakery/cup.png'),
    ),
    const  Image(
      image: AssetImage('images/beverages/smooth.jpg'),
    ),
    const  Image(
      image: AssetImage('images/foodgrains/grs.webp'),
    ),
    const  Image(
      image: AssetImage('images/non-veg/chick.jpg'),
    ),
    const  Image(
      image: AssetImage('images/non-veg/lol.jpg'),
    ),
    const  Image(
      image: AssetImage('images/foodgrains/tata.jpg'),
    ),
  ];


  final List<Widget> listImages4=[
    const Image(
      image: AssetImage('images/packed/celeeb.webp'),
    ),
    const Image(
      image: AssetImage('images/beverages/smooth.jpg'),
    ),
    const  Image(
      image: AssetImage('images/foodgrains/front_image.jpg'),
    ),
    const  Image(
      image: AssetImage('images/beverages/wag.jpg'),
    ),
    const  Image(
      image: AssetImage('images/non-veg/venk.jpg'),
    ),
    const  Image(
      image: AssetImage('images/non-veg/yummy.jpg'),
    ),
    const  Image(
      image: AssetImage('images/foodgrains/tata.jpg'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    getData();
    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }



  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void getData() async {
    List<Widget> temp70 =
        await CloudFirestoreClass().getProductsFromDiscount(70);
    List<Widget> temp60 =
        await CloudFirestoreClass().getProductsFromDiscount(60);
    List<Widget> temp50 =
        await CloudFirestoreClass().getProductsFromDiscount(50);
    List<Widget> temp0 = await CloudFirestoreClass().getProductsFromDiscount(0);
    print("everything is done");
    setState(() {
      discount70 = temp70;
      discount60 = temp60;
      discount50 = temp50;
      discount0 = temp0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: true,
        hasBackButton: false,
      ),
      body: discount70 != null &&
              discount60 != null &&
              discount50 != null &&
              discount0 != null
          ? Stack(
              children: [
                SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    children: [
                      SizedBox(
                        height: kAppBarHeight / 2,
                      ),
                      CategoriesHorizontalListViewBar(),
                      AdBannerWidget(),
                      ProductsShowcaseListView(
                          title: "Upto 70% Off", children: listImages1),
                      ProductsShowcaseListView(
                          title: "Upto 60% Off", children: listImages2),
                      ProductsShowcaseListView(
                          title: "Upto 50% Off", children: listImages3),
                      ProductsShowcaseListView(
                          title: "Explore", children: listImages4),
                    ],
                  ),
                ),
                UserDetailsBar(
                  offset: offset,
                ),
              ],
            )
          : const LoadingWidget(),
    );
  }
}
