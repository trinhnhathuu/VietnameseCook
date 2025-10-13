import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;
  final String? nameVi;
  final int? sortOrder;
  final DateTime? createdAt;

  const CategoryModel({
    required this.id,
    required this.name,
    this.nameVi,
    this.sortOrder,
    this.createdAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      name: (json['name'] ?? json['name_en'] ?? '').toString(),
      nameVi: json['name_vi']?.toString(),
      sortOrder: json['sort_order'] as int?,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'].toString())
          : null,
    );
  }

  @override
  List<Object?> get props => [id, name, nameVi, sortOrder, createdAt];
}

class PaginatedResponse<T> {
  final int count;
  final String? next;
  final String? previous;
  final List<T> results;

  const PaginatedResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    final List<dynamic> raw = (json['results'] as List<dynamic>? ?? <dynamic>[]);
    return PaginatedResponse<T>(
      count: (json['count'] ?? 0) as int,
      next: json['next']?.toString(),
      previous: json['previous']?.toString(),
      results: raw.map((e) => fromJsonT(e as Map<String, dynamic>)).toList(),
    );
  }
}
