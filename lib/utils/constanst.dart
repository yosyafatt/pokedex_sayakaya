import 'package:flutter/material.dart';

const kGrassColor = Color(0xFF49D0B0);
const kFireColor = Color(0xFFFC6C6D);
const kWaterColor = Color(0xFF76BEFE);
const kElectricColor = Color(0xFFFFD76F);
const kNormalColor = Color(0xFFB7B7A9);
const kIceColor = Color(0xFF7DD4FF);
const kFightingColor = Color(0xFFC56F61);
const kPoisonColor = Color(0xFFB66FA8);
const kGroundColor = Color(0xFFE2C56F);
const kFlyingColor = Color(0xFF9AA9FF);
const kPsychicColor = Color(0xFFFF6FA9);
const kBugColor = Color(0xFFB7C544);
const kRockColor = Color(0xFFC5B77D);
const kGhostColor = Color(0xFF7D7DC5);
const kDragonColor = Color(0xFF8C7DF1);
const kDarkColor = Color(0xFF8C6F61);
const kSteelColor = Color(0xFFB3B3C2);
const kFairyColor = Color(0xFFF1A9F1);

Color pokemonColor({String type}) {
  switch (type) {
    case 'Grass':
      return kGrassColor;
      break;
    case 'Fire':
      return kFireColor;
      break;
    case 'Water':
      return kWaterColor;
      break;
    case 'Electric':
      return kElectricColor;
      break;
    case 'Ice':
      return kIceColor;
      break;
    case 'Fighting':
      return kFightingColor;
      break;
    case 'Poison':
      return kPoisonColor;
      break;
    case 'Ground':
      return kGroundColor;
      break;
    case 'Flying':
      return kFlyingColor;
      break;
    case 'Psychic':
      return kPsychicColor;
      break;
    case 'Bug':
      return kBugColor;
      break;
    case 'Rock':
      return kRockColor;
      break;
    case 'Ghost':
      return kGhostColor;
      break;
    case 'Dragon':
      return kDragonColor;
      break;
    case 'Dark':
      return kDarkColor;
      break;
    case 'Steel':
      return kSteelColor;
      break;
    case 'Fairy':
      return kFairyColor;
      break;
    default:
      return kNormalColor;
  }
}

const String kPokemonsQuery = '''
    query listPokemons(\$count : Int!)
    {
      pokemons(first: \$count){
        id
        number
        name
        weight {
          minimum
          maximum
        }
        height {
          minimum
          maximum
        }
        classification
        types
        resistant
        attacks {
          fast {
            name
            type
            damage
          }
          special {
            name
            type
            damage
          }
        }
        weaknesses
        fleeRate
        maxCP
        maxHP
        evolutions {
          id
        }
        evolutionRequirements {
          amount
          name
        }
        image
      }
    }
  ''';
