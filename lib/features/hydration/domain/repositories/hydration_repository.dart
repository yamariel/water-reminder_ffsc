import '../../data/models/hydration_record.dart';

abstract class HydrationRepository {
  // Ajouter une consommation d'eau
  Future<void> addWater(int amount);

  // Récupérer le volume total d'eau bue aujourd'hui
  Future<int> getTodayWater();

  // Réinitialiser la consommation du jour à zéro
  Future<void> clearTodayWater();

  // Récupérer tout l'historique des consommations
  Future<List<HydrationRecord>> getHistory();

  // Supprimer une entrée précise de l'historique via son index
  Future<void> deleteRecord(int index);
}
