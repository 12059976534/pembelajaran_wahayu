import 'package:equatable/equatable.dart';

abstract class PokeSearchEvent extends Equatable {
  const PokeSearchEvent();

  @override
  List<Object> get props => [];
}

class GetaSearcPoke extends PokeSearchEvent {
  const GetaSearcPoke(
    this.offset,
    this.limit,
  );
  final limit;
  final offset;

  @override
  List<Object> get props => [];
}

class Getloadmoresearch extends PokeSearchEvent {
  const Getloadmoresearch(
    this.offset,
    this.limit,
  );
  final limit;
  final offset;

  @override
  List<Object> get props => [];
}
