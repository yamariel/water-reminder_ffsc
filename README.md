## 📁 Architecture du Projet & Responsabilités Uniques

Chaque fichier a un et un seul responsable attitré pour garantir zéro conflit de merge sur Git.

```text
lib/
 ├── core/
 │    ├── database/
 │    │    └── hive_setup.dart             <-- Supr3m [Intermédiaire] (Init Hive)
 │    ├── notifications/
 │    │    └── notification_service.dart   <-- Badra~ [Débutant Avancé] (flutter_local_notifications)
 │    ├── theme/
 │    │    └── app_theme.dart              <-- Godo [Débutant] (Palette, typographies, styles)
 │    └── utils/
 │         └── date_formatter.dart         <--  Lead  [Intermédiaire] (Reset journalier & formatage)
 │
 ├── features/
 │    ├── hydration/                       # Cœur de l'application
 │    │    ├── data/
 │    │    │    ├── models/
 │    │    │    │    └── hydration_record.dart     <-- Supr3m [Intermédiaire] (Modèle Hive @HiveType)
 │    │    │    └── repositories/
 │    │    │         └── hydration_repo_impl.dart  <-- Supr3m [Intermédiaire] (Lecture/écriture Hive)
 │    │    ├── domain/
 │    │    │    └── repositories/
 │    │    │         └── hydration_repository.dart <--  Lead  [Intermédiaire] (Contrat abstrait)
 │    │    └── presentation/
 │    │         ├── providers/
 │    │         │    └── hydration_provider.dart   <-- Supr3m [Intermédiaire] (Notifier Riverpod)
 │    │         ├── pages/
 │    │         │    ├── home_page.dart            <-- Naldo [Débutant Avancé] (Écran d'accueil)
 │    │         │    └── history_page.dart         <-- Naldo [Débutant Avancé] (Liste chronologique)
 │    │         └── widgets/
 │    │              └── water_progress_widget.dart<-- Abdoul Kader ILBOUDO [Débutant] (Verre interactif)
 │    │
 │    └── settings/                        # Profil et calcul personnalisé
 │         ├── data/
 │         │    └── repositories/
 │         │         └── settings_repo_impl.dart   <--  Lead  [Intermédiaire] (Persistance des réglages)
 │         ├── domain/
 │         │    └── repositories/
 │         │         └── settings_repository.dart  <--  Lead  [Intermédiaire] (Contrat abstrait)
 │         └── presentation/
 │              ├── providers/
 │              │    └── settings_provider.dart    <--  Lead  [Intermédiaire] (Calcul de l'objectif en ml)
 │              └── pages/
 │                   └── settings_page.dart        <-- Godo [Débutant] (Formulaire : Genre, Poids, Réveil/Coucher)
 │
 └── main.dart                             <--  Lead  [Intermédiaire] (Navigation & Root)

### Récapitulatif Strict par Développeur

```text

    Abdoul Kader ILBOUDO [Débutant]

        features/hydration/presentation/widgets/water_progress_widget.dart : Création du widget du verre d'eau qui monte en fonction du pourcentage.

    Godo [Débutant]

        core/theme/app_theme.dart : Configuration des couleurs globales, styles et boutons.

        features/settings/presentation/pages/settings_page.dart : Mise en page du formulaire des réglages (champs Genre, Poids, Heure réveil/coucher).

    Naldo [Débutant Avancé]

        features/hydration/presentation/pages/home_page.dart : Assemblage de l'écran d'accueil (verre, textes ml et boutons d'ajouts).

        features/hydration/presentation/pages/history_page.dart : Interface de l'historique des consommations par heure.

    Badra~ [Débutant Avancé]

        core/notifications/notification_service.dart : Configuration complète du plugin flutter_local_notifications et déclenchement des rappels périodiques.

    Supr3m [Intermédiaire]

        core/database/hive_setup.dart : Initialisation et configuration de Hive.

        features/hydration/data/models/hydration_record.dart : Définition du modèle @HiveType (date, quantité, type).

        features/hydration/data/repositories/hydration_repo_impl.dart : Implémentation des méthodes Hive pour sauvegarder et lire l'eau bue.

        features/hydration/presentation/providers/hydration_provider.dart : Notifier Riverpod pour le suivi en direct de l'eau bue.

     Lead [Intermédiaire]

        main.dart : Point d'entrée et mise en place du MainScreen avec la BottomNavigationBar.

        core/utils/date_formatter.dart : Méthodes de comparaison des dates pour le reset journalier.

        features/hydration/domain/repositories/hydration_repository.dart : Contrat de service pour l'hydratation.

        Feature settings (partie métier) : settings_repository.dart, settings_repo_impl.dart et settings_provider.dart

        Revue et validation exclusive de toutes les Pull Requests.
```