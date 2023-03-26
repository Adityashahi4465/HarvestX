import 'package:cloud_firestore/cloud_firestore.dart';

class Expense {
  final Timestamp createdAt;
  final String name;
  final double cost;
  final String description;
  final String useremail;

//<editor-fold desc="Data Methods">
  const Expense({
    required this.createdAt,
    required this.name,
    required this.cost,
    required this.description,
    required this.useremail,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Expense &&
          runtimeType == other.runtimeType &&
          createdAt == other.createdAt &&
          name == other.name &&
          cost == other.cost &&
          description == other.description &&
          useremail == other.useremail);

  @override
  int get hashCode =>
      createdAt.hashCode ^
      name.hashCode ^
      cost.hashCode ^
      description.hashCode ^
      useremail.hashCode;

  @override
  String toString() {
    return 'Expense{ createdAt: $createdAt, name: $name, cost: $cost, description: $description, useremail: $useremail,}';
  }

  Expense copyWith({
    Timestamp? createdAt,
    String? name,
    double? cost,
    String? description,
    String? useremail,
  }) {
    return Expense(
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      cost: cost ?? this.cost,
      description: description ?? this.description,
      useremail: useremail ?? this.useremail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'createdAt': this.createdAt,
      'name': this.name,
      'cost': this.cost,
      'description': this.description,
      'useremail': this.useremail,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      createdAt: map['createdAt'] as Timestamp,
      name: map['name'] as String,
      cost: map['cost'] as double,
      description: map['description'] as String,
      useremail: map['useremail'] as String,
    );
  }

//</editor-fold>
}
