import 'package:flutter/material.dart';
import 'package:frontend/presentation/screens/profile.dart';
import 'package:frontend/presentation/screens/signin.dart';
import 'package:frontend/presentation/screens/signup.dart';
import 'package:frontend/presentation/screens/trip.dart';
import 'package:frontend/presentation/screens/attraction_detail.dart';
import 'package:frontend/presentation/screens/home.dart';
import 'package:frontend/presentation/screens/hotel.dart';
import 'package:frontend/presentation/screens/hotel_detail.dart';
import 'package:frontend/presentation/screens/location.dart';
import 'package:frontend/presentation/screens/restaurant.dart';
import 'package:frontend/presentation/screens/restaurant_detail.dart';
import 'package:frontend/presentation/screens/welcome.dart';

class AppRouter {
  MaterialPageRoute? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Welcome());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/signIn':
        return MaterialPageRoute(builder: (_) => SignIn());
      case '/signUp':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/profile':
        return MaterialPageRoute(builder: (_) => Profile());
      case '/attractionDetail':
        return MaterialPageRoute(builder: (_) => AttractionDetail());
      case '/hotel':
        return MaterialPageRoute(builder: (_) => Hotel());
      case '/hotelDetail':
        return MaterialPageRoute(builder: (_) => HotelDetail());
      case '/location':
        return MaterialPageRoute(builder: (_) => Location());
      case '/restaurant':
        return MaterialPageRoute(builder: (_) => Restaurant());
      case '/trip':
        return MaterialPageRoute(builder: (_) => Trip());
      case '/restaurantDetail':
        return MaterialPageRoute(builder: (_) => RestaurantDetail());
      default:
        return null;
    }
  }
}
