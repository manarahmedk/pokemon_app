import 'package:flutter/material.dart';
import 'package:poke_app/model/pokemon_model.dart';
import 'package:poke_app/view/components/widgets/text_custom.dart';


class PokemonWidget extends StatelessWidget {
  final Pokemon pokemon;
  final void Function()? onTap;

  const PokemonWidget({required this.pokemon, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 7,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 5,
                child: Hero(
                  tag: "tag-${pokemon.id}",
                  child: Image.network(
                    pokemon.img??'',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.error,
                        color: Colors.red,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextCustom(
                    text: pokemon.name ?? "",
                    maxLines: 1,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
