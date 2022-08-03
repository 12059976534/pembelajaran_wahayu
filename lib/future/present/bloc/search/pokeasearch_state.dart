import 'package:equatable/equatable.dart';
import 'package:fecth2/future/data/model/allpoke.dart';
// import 'package:fecth2/future/data/model/allpoke.dart';

abstract class PokesearchState extends Equatable {
  const PokesearchState();

  @override
  List<Object> get props => [];
}

class PokesearchInitial extends PokesearchState {}

class PokesearchLoading extends PokesearchState {}

class PokeLoadmoresearchloading extends PokesearchState {}

class PokeserchLoaded extends PokesearchState {
  const PokeserchLoaded(this.pokallemodel);

  final Allpoke pokallemodel;

  @override
  List<Object> get props => [pokallemodel];
}

class PokesearchError extends PokesearchState {
  const PokesearchError(this.error) : assert(error != null);

  final String error;

  @override
  List<Object> get props => [error];
}
