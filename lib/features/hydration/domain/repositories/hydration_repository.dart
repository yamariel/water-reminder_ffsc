abstract class HydrationRepository {
  //Ajouter de l'eau
  Future<void> addWater(int amount);

  //Récupérer le total d'eau bue aujourd'hui
  Future<int> getTodayWater();

  //Réinitialiser le compteur à zéro
  Future<void> clearTodayWater();
}
