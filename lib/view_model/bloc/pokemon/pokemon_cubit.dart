import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/model/pokemon_model.dart';
import 'package:poke_app/view_model/data/network/dio_helper.dart';
import 'package:poke_app/view_model/data/network/end_points.dart';
part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonInitial());

  static PokemonCubit get(context) => BlocProvider.of<PokemonCubit>(context);

  int selectedPokemonIndex = 0;

  void selectPokemon(int index) {
    selectedPokemonIndex = index;
    emit(SelectPokemonState());
  }

  Pokemons? pokemons;

  Future<void> getAllPokemons() async {
    emit(GetAllPokemonLoadingState());
    try {
      final resp = await DioHelper.get(endPoint: EndPoints.pokemone);
      if (resp!.statusCode == 200) {
        //log(jsonEncode(value?.data));
        pokemons = Pokemons.fromJson(json.decode(resp.data));
        emit(GetAllPokemonSuccessState());
      } else {
        emit(GetAllPokemonErrorState());
      }
    } catch (error) {
      print(error);
      emit(GetAllPokemonErrorState());
    }
  }
}
