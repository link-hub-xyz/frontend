import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class AnalyticsSampleData extends Equatable {
  final int value;
  final DateTime date;

  const AnalyticsSampleData({
    required this.value,
    required this.date,
  });

  @override
  List<Object?> get props => [
        value,
        date,
      ];
}
