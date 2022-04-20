import 'dart:convert';

import 'package:flutter_template_clean_architecture/domain/entities/employee.dart';

class EmployeeModel extends Employee {
  EmployeeModel({
    required String name,
    required String email,
    required DateTime hireDate,
    required String code,
  }) : super(
          name: name,
          email: email,
          hireDate: hireDate,
          code: code,
        );

  EmployeeModel copyWith({
    String? code,
    String? name,
    String? email,
    DateTime? hireDate,
  }) {
    return EmployeeModel(
      code: code ?? this.code,
      name: name ?? this.name,
      email: email ?? this.email,
      hireDate: hireDate ?? this.hireDate,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'code': code});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'hireDate': hireDate.millisecondsSinceEpoch});

    return result;
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      code: map['code'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      hireDate: DateTime.fromMillisecondsSinceEpoch(map['hireDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeModel.fromJson(String source) =>
      EmployeeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EmployeeModel(code: $code, name: $name, email: $email, hireDate: $hireDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmployeeModel &&
        other.code == code &&
        other.name == name &&
        other.email == email &&
        other.hireDate == hireDate;
  }

  @override
  int get hashCode {
    return code.hashCode ^ name.hashCode ^ email.hashCode ^ hireDate.hashCode;
  }
}
