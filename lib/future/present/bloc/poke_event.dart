import 'package:equatable/equatable.dart';

abstract class PokeEvent extends Equatable {
  const PokeEvent();

  @override
  List<Object> get props => [];
}

class GetPoke extends PokeEvent {
  // const GetPoke(this.userId);
  const GetPoke();

  // final String userId;

  @override
  List<Object> get props => [];
}
