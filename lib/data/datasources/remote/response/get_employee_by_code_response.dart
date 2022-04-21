import 'dart:convert';

import 'package:flutter_template_clean_architecture/data/models/employee_model.dart';

class GetEmployeeByCodeResponse {
  EmployeeModel data;
  GetEmployeeByCodeResponse({
    required this.data,
  });

  GetEmployeeByCodeResponse copyWith({
    EmployeeModel? data,
  }) {
    return GetEmployeeByCodeResponse(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'data': data.toMap()});

    return result;
  }

  factory GetEmployeeByCodeResponse.fromMap(Map<String, dynamic> map) {
    return GetEmployeeByCodeResponse(
      data: EmployeeModel.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetEmployeeByCodeResponse.fromJson(String source) =>
      GetEmployeeByCodeResponse.fromMap(json.decode(source));

  @override
  String toString() => 'GetEmployeeByCodeResponse(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetEmployeeByCodeResponse && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}
