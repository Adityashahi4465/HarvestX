// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class MGrocery {
  final String name;
  final String url;
  final String description;
  final double price;
  MGrocery({
    required this.name,
    required this.url,
    required this.description,
    required this.price,
  });

  MGrocery copyWith({
    String? name,
    String? url,
    String? description,
    double? price,
  }) {
    return MGrocery(
      name: name ?? this.name,
      url: url ?? this.url,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
      'description': description,
      'price': price,
    };
  }

  factory MGrocery.fromJson(Map<String, dynamic> json) {
    return MGrocery(
      name: json['productname'] as String,
      description: json['prodescription'] as String,
      url: json['proimages'][0] as String,
      price: (json['price'] as num).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'MGrocery(name: $name, url: $url, description: $description, price: $price)';
  }

  @override
  bool operator ==(covariant MGrocery other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.url == url &&
        other.description == description &&
        other.price == price;
  }

  @override
  int get hashCode {
    return name.hashCode ^ url.hashCode ^ description.hashCode ^ price.hashCode;
  }
}

class MGroceries {
  final String title;
  final String color;
  final String url;

  MGroceries({
    required this.title,
    required this.color,
    required this.url,
  });

  MGroceries copyWith({
    String? title,
    String? color,
    String? url,
  }) {
    return MGroceries(
      title: title ?? this.title,
      color: color ?? this.color,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'color': color,
      'url': url,
    };
  }

  factory MGroceries.fromJson(Map<String, dynamic> data) {
    return MGroceries(
      title: data['productname'],
      url: data['proimages'][0],
      color: data['bgcolor'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'MGroceries(title: $title, color: $color, url: $url)';
}
