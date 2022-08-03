import 'package:equatable/equatable.dart';
import 'package:fecth2/future/data/model/pokemodel.dart';

abstract class PokeState extends Equatable {
  const PokeState();

  @override
  List<Object> get props => [];
}

class PokeInitial extends PokeState {}

class PokeLoading extends PokeState {}

class PokeLoaded extends PokeState {
  const PokeLoaded(this.pokemodel);

  final Pokemodel pokemodel;

  @override
  List<Object> get props => [pokemodel];
}

class PokeError extends PokeState {
  const PokeError(this.error) : assert(error != null);

  final String error;

  @override
  List<Object> get props => [error];
}
