```text
lib/
 ├── core/
 │    ├── database/
 │    │    └── hive_setup.dart             <-- Dev 3 [Niveau Intermédiaire] (Magasinier Data : Init Hive)
 │    ├── notifications/
 │    │    └── notification_service.dart   <-- Dev 5 [Niveau Intermédiaire/Avancé] (Système : flutter_local_notifications)
 │    ├── theme/
 │    │    └── app_theme.dart              <-- Dev 1 [Niveau Débutant] (Créatif UI : Thème couleurs, typographies)
 │    └── utils/
 │         └── date_formatter.dart         <-- Tech Lead  [Niveau Intermédiaire] (Logique date/reset quotidien)
 │
 ├── features/
 │    │
 │    ├── hydration/                       # FEATURE 1 : Cœur du projet
 │    │    ├── data/
 │    │    │    ├── models/
 │    │    │    │    └── hydration_record.dart     <-- Dev 3 [Niveau Intermédiaire] (Modèle Hive @HiveType)
 │    │    │    └── repositories/
 │    │    │         └── hydration_repo_impl.dart  <-- Dev 3 [Niveau Intermédiaire] (Implémentation lecture/écriture Hive)
 │    │    ├── domain/
 │    │    │    └── repositories/
 │    │    │         └── hydration_repository.dart <-- Tech Lead  [Niveau Intermédiaire] (Interface / Contrat abstrait)
 │    │    └── presentation/
 │    │         ├── providers/
 │    │         │    └── hydration_provider.dart   <-- Dev 4 [Niveau Intermédiaire] (Cerveau Riverpod : Notifier hydratation)
 │    │         ├── pages/
 │    │         │    └── home_page.dart            <-- Dev 2 [Niveau Débutant Avancé] (Intégrateur UI : Écran principal)
 │    │         └── widgets/
 │    │              └── water_progress_widget.dart <-- Dev 1 [Niveau Débutant] (Créatif UI : Jauge de progression bonus)
 │    │
 │    └── settings/                        # FEATURE 2 : Objectifs et alertes
 │         ├── data/
 │         │    └── repositories/
 │         │         └── settings_repo_impl.dart   <-- Tech Lead  [Niveau Intermédiaire] (Persistance des réglages)
 │         ├── domain/
 │         │    └── repositories/
 │         │         └── settings_repository.dart  <-- Tech Lead  [Niveau Intermédiaire] (Interface abstraite)
 │         └── presentation/
 │              ├── providers/
 │              │    └── settings_provider.dart    <-- Tech Lead  [Niveau Intermédiaire] (Notifier Riverpod des réglages)
 │              └── pages/
 │                   └── settings_page.dart        <-- Dev 2 [Niveau Débutant Avancé] (Intégrateur UI : Vue des paramètres)
 │
 └── main.dart                             <-- Tech Lead  [Niveau Intermédiaire] (Point d'entrée, ProviderScope, câblage)
```

### Récapitulatif par membre de l'équipe

```text
    Dev 1 [Débutant] :

        core/theme/app_theme.dart

        features/hydration/presentation/widgets/water_progress_widget.dart

    Dev 2 [Débutant Avancé] :

        features/hydration/presentation/pages/home_page.dart

        features/settings/presentation/pages/settings_page.dart

    Dev 3 [Intermédiaire] :

        core/database/hive_setup.dart

        features/hydration/data/models/hydration_record.dart

        features/hydration/data/repositories/hydration_repo_impl.dart

    Dev 4 [Intermédiaire] :

        features/hydration/presentation/providers/hydration_provider.dart

    Dev 5 [Intermédiaire/Avancé] :

        core/notifications/notification_service.dart (avec ton soutien en pair-programming)

    Tech Lead [Intermédiaire] :

        core/utils/date_formatter.dart

        features/hydration/domain/repositories/hydration_repository.dart

        Toute la logique métier de la feature features/settings/ (domain, data, providers)
```