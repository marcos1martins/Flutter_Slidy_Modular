import 'package:mobx/mobx.dart';

import '../../shared/models/pokemon_model.dart';
import '../../shared/repositories/poke_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  final PokeRepository pokeRepository;

  _HomeControllerBase(this.pokeRepository){
    fetchPokemons();
  }

  @action
  fetchPokemons(){
    pokemons = pokeRepository.getAllPokemons().asObservable();
  }

  @observable 
  ObservableFuture<List<PokemonModel>> pokemons;
  
}