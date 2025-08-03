import 'dart:convert';
import 'package:equatable/equatable.dart';

import '../home/home_model.dart';
import '../search_attribute/search_attribute_model.dart';

class CarDetailsModel extends Equatable {
  final FeaturedCars? car;
  final List<Galleries>? galleries;
  final List<Features>? features;
  final List<FeaturedCars>? relatedListings;
  final Dealer? dealer;
  final List<Reviews>? reviews;
  final int totalDealerRating;
  final double averageRating;
  final List<Cities>? cities;
  final List<String>? bookedDates;
  final int minBookingDate;

  const CarDetailsModel({
    this.car,
    this.galleries,
    this.relatedListings,
    this.features,
    this.dealer,
    this.reviews,
    required this.totalDealerRating,
    required this.averageRating,
    this.cities,
    this.bookedDates,
    required this.minBookingDate,
  });

  CarDetailsModel copyWith({
    FeaturedCars? car,
    List<Galleries>? galleries,
    List<Features>? features,
    List<FeaturedCars>? relatedListings,
    Dealer? dealer,
    List<Reviews>? reviews,
    int? totalDealerRating,
    double? averageRating,
    List<Cities>? cities,
    List<String>? bookedDates,
    int? minBookingDate,
  }) {
    return CarDetailsModel(
      car: car ?? this.car,
      galleries: galleries ?? this.galleries,
      features: features ?? this.features,
      relatedListings: relatedListings ?? this.relatedListings,
      dealer: dealer ?? this.dealer,
      reviews: reviews ?? this.reviews,
      totalDealerRating: totalDealerRating ?? this.totalDealerRating,
      averageRating: averageRating ?? this.averageRating,
      cities: cities ?? this.cities,
      bookedDates: bookedDates ?? this.bookedDates,
      minBookingDate: minBookingDate ?? this.minBookingDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'car': car?.toMap(),
      'galleries': galleries?.map((x) => x.toMap()).toList(),
      'car_features': features?.map((x) => x.toMap()).toList(),
      'related_listings': relatedListings?.map((x) => x.toMap()).toList(),
      'dealer': dealer?.toMap(),
      'reviews': reviews?.map((x) => x.toMap()).toList(),
      'total_dealer_rating': totalDealerRating,
      'average_rating': averageRating,
      'cities': cities?.map((x) => x.toMap()).toList(),
      'bookedDates': bookedDates,
      'min_booking_date': minBookingDate,
    };
  }

  factory CarDetailsModel.fromMap(Map<String, dynamic> map) {
    return CarDetailsModel(
      car:
          map['car'] != null
              ? FeaturedCars.fromMap(map['car'] as Map<String, dynamic>)
              : null,
      galleries:
          map['galleries'] != null
              ? List<Galleries>.from(
                (map['galleries'] as List<dynamic>).map<Galleries?>(
                  (x) => Galleries.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,

      features:
          map['car_features'] != null
              ? List<Features>.from(
                (map['car_features'] as List<dynamic>).map<Features?>(
                  (x) => Features.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,

      relatedListings:
          map['related_listings'] != null
              ? List<FeaturedCars>.from(
                (map['related_listings'] as List<dynamic>).map<FeaturedCars?>(
                  (x) => FeaturedCars.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
      dealer:
          map['dealer'] != null
              ? Dealer.fromMap(map['dealer'] as Map<String, dynamic>)
              : null,
      reviews:
          map['reviews'] != null
              ? List<Reviews>.from(
                (map['reviews'] as List<dynamic>).map<Reviews?>(
                  (x) => Reviews.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
      totalDealerRating: map['total_dealer_rating'] ?? 0,
      averageRating:
          map['average_rating'] != null
              ? double.parse(map['average_rating'].toString())
              : 0.0,
      cities:
          map['cities'] != null
              ? List<Cities>.from(
                (map['cities'] as List<dynamic>).map<Cities?>(
                  (x) => Cities.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
      bookedDates:
          map['bookedDates'] != null
              ? List<String>.from(map['bookedDates'] as List<dynamic>)
              : null,
      minBookingDate: map['min_booking_date'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarDetailsModel.fromJson(String source) =>
      CarDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      car!,
      galleries!,
      features!,
      relatedListings!,
      dealer!,
      reviews!,
      totalDealerRating,
      averageRating,
      cities!,
      bookedDates!,
      minBookingDate,
    ];
  }
}

class Galleries extends Equatable {
  final int id;
  final int carId;
  final String image;
  final String createdAt;
  final String updatedAt;

  const Galleries({
    required this.id,
    required this.carId,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  Galleries copyWith({
    int? id,
    int? carId,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) {
    return Galleries(
      id: id ?? this.id,
      carId: carId ?? this.carId,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'car_id': carId,
      'image': image,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory Galleries.fromMap(Map<String, dynamic> map) {
    return Galleries(
      id: map['id'] ?? 0,
      carId: map['car_id'] ?? 0,
      image: map['image'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Galleries.fromJson(String source) =>
      Galleries.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [id, carId, image, createdAt, updatedAt];
  }
}

class Dealer extends Equatable {
  final int id;
  final String name;
  final String username;
  final String designation;
  final String image;
  final String bannerImage;
  final String status;
  final String isBanned;
  final int isDealer;
  final String address;
  final String email;
  final String phone;
  final String createdAt;
  final int totalCar;

  const Dealer({
    required this.id,
    required this.name,
    required this.username,
    required this.designation,
    required this.image,
    required this.bannerImage,
    required this.status,
    required this.isBanned,
    required this.isDealer,
    required this.address,
    required this.email,
    required this.phone,
    required this.createdAt,
    required this.totalCar,
  });

  Dealer copyWith({
    int? id,
    String? name,
    String? username,
    String? designation,
    String? image,
    String? bannerImage,
    String? status,
    String? isBanned,
    int? isDealer,
    String? address,
    String? email,
    String? phone,
    String? createdAt,
    int? totalCar,
  }) {
    return Dealer(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      designation: designation ?? this.designation,
      image: image ?? this.image,
      bannerImage: bannerImage ?? this.bannerImage,
      status: status ?? this.status,
      isBanned: isBanned ?? this.isBanned,
      isDealer: isDealer ?? this.isDealer,
      address: address ?? this.address,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
      totalCar: totalCar ?? this.totalCar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'designation': designation,
      'image': image,
      'banner_image': bannerImage,
      'status': status,
      'is_banned': isBanned,
      'is_dealer': isDealer,
      'address': address,
      'email': email,
      'phone': phone,
      'created_at': createdAt,
      'total_car': totalCar,
    };
  }

  factory Dealer.fromMap(Map<String, dynamic> map) {
    return Dealer(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      designation: map['designation'] ?? '',
      image: map['image'] ?? '',
      bannerImage: map['banner_image'] ?? '',
      status: map['status'] ?? '',
      isBanned: map['is_banned'] ?? '',
      isDealer: map['is_dealer'] ?? 0,
      address: map['address'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      createdAt: map['created_at'] ?? '',
      totalCar: map['total_car'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dealer.fromJson(String source) =>
      Dealer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      username,
      designation,
      image,
      bannerImage,
      status,
      isBanned,
      isDealer,
      address,
      email,
      phone,
      createdAt,
      totalCar,
    ];
  }
}

class Reviews extends Equatable {
  final int id;
  final int userId;
  final int agentId;
  final int carId;
  final int rating;
  final String comment;
  final String status;
  final String createdAt;
  final String updatedAt;
  final String ratedBy;
  final String bookingId;
  final User? user;

  const Reviews({
    required this.id,
    required this.userId,
    required this.agentId,
    required this.carId,
    required this.rating,
    required this.comment,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.ratedBy,
    required this.bookingId,
    this.user,
  });

  Reviews copyWith({
    int? id,
    int? userId,
    int? agentId,
    int? carId,
    int? rating,
    String? comment,
    String? status,
    String? createdAt,
    String? updatedAt,
    String? ratedBy,
    String? bookingId,
    User? user,
  }) {
    return Reviews(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      agentId: agentId ?? this.agentId,
      carId: carId ?? this.carId,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      ratedBy: ratedBy ?? this.ratedBy,
      bookingId: bookingId ?? this.bookingId,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'agent_id': agentId,
      'car_id': carId,
      'rating': rating,
      'comment': comment,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'rated_by': ratedBy,
      'booking_id': bookingId,
      'user': user?.toMap(),
    };
  }

  factory Reviews.fromMap(Map<String, dynamic> map) {
    return Reviews(
      id: map['id'] ?? 0,
      userId: map['user_id'] ?? 0,
      agentId: map['agent_id'] ?? 0,
      carId: map['car_id'] ?? 0,
      rating: map['rating'] ?? 0,
      comment: map['comment'] ?? '',
      status: map['status'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      ratedBy: map['rated_by'] ?? '',
      bookingId: map['booking_id'] ?? '',
      user:
          map['user'] != null
              ? User.fromMap(map['user'] as Map<String, dynamic>)
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reviews.fromJson(String source) =>
      Reviews.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      userId,
      agentId,
      carId,
      rating,
      comment,
      status,
      createdAt,
      updatedAt,
      ratedBy,
      bookingId,
      user!,
    ];
  }
}

class User extends Equatable {
  final int id;
  final String image;
  final String email;
  final String name;
  final String designation;
  final int totalCar;

  const User({
    required this.id,
    required this.image,
    required this.email,
    required this.name,
    required this.designation,
    required this.totalCar,
  });

  User copyWith({
    int? id,
    String? image,
    String? email,
    String? name,
    String? designation,
    int? totalCar,
  }) {
    return User(
      id: id ?? this.id,
      image: image ?? this.image,
      email: email ?? this.email,
      name: name ?? this.name,
      designation: designation ?? this.designation,
      totalCar: totalCar ?? this.totalCar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'email': email,
      'name': name,
      'designation': designation,
      'total_car': totalCar,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? 0,
      image: map['image'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      designation: map['designation'] ?? '',
      totalCar: map['total_car'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [id, image, email, name, designation, totalCar];
  }
}

class Cities extends Equatable {
  final int id;
  final String createdAt;
  final String updatedAt;
  final int countryId;
  final String name;
  final int totalCar;

  const Cities({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.countryId,
    required this.name,
    required this.totalCar,
  });

  Cities copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    int? countryId,
    String? name,
    int? totalCar,
  }) {
    return Cities(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      countryId: countryId ?? this.countryId,
      name: name ?? this.name,
      totalCar: totalCar ?? this.totalCar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'country_id': countryId,
      'name': name,
      'total_car': totalCar,
    };
  }

  factory Cities.fromMap(Map<String, dynamic> map) {
    return Cities(
      id: map['id'] ?? 0,
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      countryId: map['country_id'] ?? 0,
      name: map['name'] ?? '',
      totalCar: map['total_car'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cities.fromJson(String source) =>
      Cities.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [id, createdAt, updatedAt, countryId, name, totalCar];
  }
}
