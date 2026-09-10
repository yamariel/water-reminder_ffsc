import 'package:hive/hive.dart';

part 'hydration_record.g.dart';

// vu qu'on va stocker su du JSON :

@HiveType(typeId: 1)
enum DrinkType {
  @HiveField(0)
  water,
}

// Ici si on pars sur le principe que l'utilisateur va faire une entree du genre : "j'ai bu X quantite d'eau a telle date "

@HiveType(typeId: 0)
class HydrationRecord extends HiveObject {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final int amountM1;

  @HiveField(2)
  final DrinkType type;

  HydrationRecord({
    required this.date,
    required this.amountM1,
    required this.type,
  });
}
