### Règle n°1 : Nommage des Branches

INTERDICTION DE CODER SUR LE ``main``. Chaque développeur crée une branche pour sa tâche.

Le nom de la branche doit suivre ce format : ``type/nom-de-la-tache``

````text
    feat/... (Pour une nouvelle fonctionnalité ou de l'UI)

        Exemples : feat/home-page, feat/hive-setup, feat/water-widget

    fix/... (Pour réparer un bug)

        Exemple : fix/notification-crash

    chore/... (Pour des configurations ou tâches de fond)

        Exemple : chore/add-dependencies
````

### Règle n°2 : Nommage des Commits

Un message de commit doit expliquer clairement ce qui a été fait. Pas de commit appelés "test", "mise à jour" ou "ça marche".

Format attendu : ````type: description courte````

````text
    feat: ajoute le bouton pour boire un verre d'eau

    fix: corrige le calcul du total d'eau

    style: change la couleur de fond en bleu

    docs: met à jour le README avec les rôles
````

### Règle n°3 : Le Workflow de l'équipe (Très important)

    Le développeur crée sa branche (feat/mon-bouton).

    Il code, il fait ses commits.

    Quand c'est fini, il pousse (push) sa branche sur GitHub et ouvre une Pull Request (PR) vers la branch ``dev``.

    Une fois le PR émit, le développeur informe le chef d'équipe.

    Le mentor ou le chef de groupe regarde le code sur GitHub. S'il n'y a pas de problème, il clique sur le bouton "Merge PR" pour l'intégrer au ``dev``.

    Les autres développeurs font un git pull origin main pour récupérer les nouveautés avant de commencer une nouvelle tâche.
