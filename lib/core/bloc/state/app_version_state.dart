import 'package:equatable/equatable.dart';

class AppVersionCheckerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppVersionCheckerInitial extends AppVersionCheckerState {}

class AppVersionCheckerLoading extends AppVersionCheckerState {}

class AppVersionCheckerLoaded extends AppVersionCheckerState {}

class AppVersionCheckerError extends AppVersionCheckerState {
  final String message;
  AppVersionCheckerError(this.message);
}
