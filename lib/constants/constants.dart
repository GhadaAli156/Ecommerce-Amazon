import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

List<String> categories = [
  'Prime',
  'Electronics',
  'Business',
  'Home',
  'miniTV',
  'Mobiles',
  'Fashion',
  'Deals',
  'Travel',
  'Beauty',
  'Furniture',
  'Pharmacy',
  'Movies',
  'Books',
  'Appliances',
  'More'
];

List<String> carouselPicture = [
  '1.png',
  '2.png',
  '3.png',
  '4.png',
  '5.png',
  '6.png',
  '7.png',
  '8.png',
  '9.png',
];

List<String> todaysDeals = [
  'todaysDeal0.png',
  'todaysDeal1.png',
  'todaysDeal2.png',
  'todaysDeal3.png'
];

List<String> headphoneDeals = [
  'boat.png',
  'bose.png',
  'onePlus.png',
  'sony.png'
];

List<String> clothingDeal = [
  'home.jpg',
  'gift.jpg',
  'beauty.jpg',
  'electronics.jpg'
];
List<String> yourOrders = [
  'Appliances.png',
  'Beauty.png',
  'Books.png',
  'Electronics.png',
  'Mobiles.png'
];
List<String> byAgain = [
  'Prime.png',
  'Home.png',
  'Movies.png',
  'miniTV.png',
  'Pharmacy.png',
];