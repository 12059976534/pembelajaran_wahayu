import 'package:equatable/equatable.dart';

abstract class PokeallEvent extends Equatable {
  const PokeallEvent();

  @override
  List<Object> get props => [];
}

class GetallPoke extends PokeallEvent {
  const GetallPoke(
    this.offset,
    this.limit,
  );
  final limit;
  final offset;

  @override
  List<Object> get props => [];
}

class GetafilterPoke extends PokeallEvent {
  const GetafilterPoke(
    this.offset,
    this.limit,
  );
  final limit;
  final offset;

  @override
  List<Object> get props => [];
}

class Getloadmore extends PokeallEvent {
  const Getloadmore(
    this.offset,
    this.limit,
  );
  final limit;
  final offset;

  @override
  List<Object> get props => [];
}
