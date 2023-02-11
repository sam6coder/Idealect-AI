import 'package:food_allergens/model/product_model.dart';
import 'package:food_allergens/screens/account_screen.dart';
import 'package:food_allergens/screens/cart_screen.dart';
import 'package:food_allergens/screens/home_screen.dart';
import 'package:food_allergens/screens/more_screen.dart';
import 'package:food_allergens/widgets/simple_product_widget.dart';
import 'package:flutter/material.dart';

const double kAppBarHeight = 80;

const String groceasyLogoUrl =
    "https://github.com/sam6coder/Idealect-AI/blob/master/images/logo.png";

const List<String> categoriesList = [
  "Foodgrain, Oils and Masala",
  "Bakery and Dairy",
  "Beverages",
  "Non-Veg",
  "Packed Food"
];

const List<Widget> screens = [
  HomeScreen(),
  AccountScreen(),
  CartScreen(),
  MoreScreen(),
];

const List<String> categoryLogos = [
  "https://e7.pngegg.com/pngimages/610/334/png-clipart-indian-cuisine-computer-icons-food-spice-ingredient-others-food-monochrome-thumbnail.png",
  "https://cdn-icons-png.flaticon.com/512/2674/2674465.png",
  "https://cdn-icons-png.flaticon.com/512/2094/2094538.png",
  "https://www.clipartmax.com/png/small/114-1145616_celebration-chicken-food-icon-png.png",
  "https://cdn-icons-png.flaticon.com/512/2553/2553651.png"
];

const List<String> largeAds = [
  "https://thumbs.dreamstime.com/b/grocery-food-store-shopping-basket-promotional-sale-banner-vector-illustration-198422214.jpg",
  "https://4.bp.blogspot.com/-XQS1UAYxhWM/Vsw7cjVzu-I/AAAAAAAAAA8/LZPVtDBfNsQ/s1600/banner2.jpg",
  "https://img.lovepik.com/free-template/20211027/lovepik-blue-halo-milk-sales-template-image_8912542_list.jpg",
  "https://static.vecteezy.com/system/resources/previews/001/072/259/non_2x/summer-sale-banner-with-fruit-vector.jpg",
  "https://thumbs.dreamstime.com/b/tortilla-chips-banner-ads-corn-flakes-splashing-cheese-sauce-d-illustration-tortilla-chips-banner-ads-159510964.jpg"
];

const List<String> smallAds = [
  "https://m.media-amazon.com/images/I/11iTpTDy6TL._SS70_.png",
  "https://m.media-amazon.com/images/I/11dGLeeNRcL._SS70_.png",
  "https://m.media-amazon.com/images/I/11kOjZtNhnL._SS70_.png",
];

const List<String> adItemNames = ["Recharge", "Rewards", "Pay Bills"];

//Dont even attemp to scroll to the end of this manually lmao
const String groceasyLogo =
    "https://github.com/sam6coder/Idealect-AI/blob/master/images/logo.png";

List<Widget> testChildren = [
  SimpleProductWidget(
    productModel: ProductModel(
        url: "https://m.media-amazon.com/images/I/71DhvrRKXPL._SL1200_.jpg",
        productName: "Parle Hide n Seek",
        cost: 25,
        discount: 0,
        uid: "eioejfbkn",
        sellerName: "Unique Cookies Shop",
        sellerUid: "983498ihjb",
        rating: 4,
        noOfRating: 3),
  ),
  SimpleProductWidget(
    productModel: ProductModel(
        url: "https://m.media-amazon.com/images/I/71DhvrRKXPL._SL1200_.jpg",
        productName: "Parle Hide n Seek",
        cost: 25,
        discount: 0,
        uid: "eioejfbkn",
        sellerName: "Unique Cookies Shop",
        sellerUid: "983498ihjb",
        rating: 4,
        noOfRating: 3),
  ),
  SimpleProductWidget(
    productModel: ProductModel(
        url: "https://m.media-amazon.com/images/I/71DhvrRKXPL._SL1200_.jpg",
        productName: "Parle Hide n Seek",
        cost: 25,
        discount: 0,
        uid: "eioejfbkn",
        sellerName: "Unique Cookies Shop",
        sellerUid: "983498ihjb",
        rating: 4,
        noOfRating: 3),
  ),
  SimpleProductWidget(
    productModel: ProductModel(
        url: "https://m.media-amazon.com/images/I/71DhvrRKXPL._SL1200_.jpg",
        productName: "Parle Hide n Seek",
        cost: 25,
        discount: 0,
        uid: "eioejfbkn",
        sellerName: "Unique Cookies Shop",
        sellerUid: "983498ihjb",
        rating: 4,
        noOfRating: 3),
  ),
  SimpleProductWidget(
    productModel: ProductModel(
        url: "https://m.media-amazon.com/images/I/71DhvrRKXPL._SL1200_.jpg",
        productName: "Parle Hide n Seek",
        cost: 25,
        discount: 0,
        uid: "eioejfbkn",
        sellerName: "Unique Cookies Shop",
        sellerUid: "983498ihjb",
        rating: 4,
        noOfRating: 3),
  )
];

List<String> keysOfRating = [
  "Very poor",
  "Poor",
  "Average",
  "Good",
  "Excellent"
];
