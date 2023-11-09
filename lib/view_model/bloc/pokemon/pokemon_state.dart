part of 'pokemon_cubit.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class GetAllPokemonLoadingState extends PokemonState {}

class GetAllPokemonSuccessState extends PokemonState {}

class GetAllPokemonErrorState extends PokemonState {}

class SelectPokemonState extends PokemonState {}


