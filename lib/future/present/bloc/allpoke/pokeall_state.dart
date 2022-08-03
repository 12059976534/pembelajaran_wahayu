import 'package:equatable/equatable.dart';
import 'package:fecth2/future/data/model/allpoke.dart';
// import 'package:fecth2/future/data/model/allpoke.dart';

abstract class PokeallState extends Equatable {
  const PokeallState();

  @override
  List<Object> get props => [];
}

class PokeallInitial extends PokeallState {}

class PokeallLoading extends PokeallState {}

class PokeLoadmoreloading extends PokeallState {}

class PokeallLoaded extends PokeallState {
  const PokeallLoaded(this.pokallemodel);

  final Allpoke pokallemodel;

  @override
  List<Object> get props => [pokallemodel];
}

class PokeallfilterLoaded extends PokeallState {
  const PokeallfilterLoaded(this.pokallemodel);

  final Allpoke pokallemodel;

  @override
  List<Object> get props => [pokallemodel];
}

class PokeallError extends PokeallState {
  const PokeallError(this.error) : assert(error != null);

  final String error;

  @override
  List<Object> get props => [error];
}
