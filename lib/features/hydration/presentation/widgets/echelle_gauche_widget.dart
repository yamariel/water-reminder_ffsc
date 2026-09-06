import 'package:flutter/material.dart';

/***
 * Ce widget construira l'echelle de gauche qui sera graduée et montrera le niveau de progresion
 */
class EchelleGaucheWidget extends StatelessWidget {
  final int objectifJournalier;

  const EchelleGaucheWidget({required this.objectifJournalier});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          // Ajoute un espace de 10 pixels uniquement sur le côté gauche.
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            '${objectifJournalier} ml',
            //Le style est a changé selon le theme
            // Définit le style du texte.
            style: const TextStyle(
              // Définit la couleur du texte en blanc.
              color: Colors.blueAccent,

              // Définit la taille du texte à 22 pixels.
              fontSize: 22,

              // Rend le texte plus épais (gras).
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Ajoute un espace vertical de 10 pixels entre l'objectif journalier  et les graduations.
        const SizedBox(height: 10),
        // Génère automatiquement une liste de 12 éléments.
        // Ici, chaque élément correspond à une graduation de l'échelle.
        ...List.generate(
          12,
          // "index" représente la position de chaque élément.
          // Les valeurs seront : 0, 1, 2, ..., 11.
          (index) {
            return Container(
              // Définit les marges autour de chaque graduation.
              margin: const EdgeInsets.only(
                // Décale chaque graduation de 10 pixels vers la droite.
                left: 10,
                // Ajoute un espace de 17 pixels sous chaque graduation.
                bottom: 17,
              ),
              // Définit la largeur de la graduation.
              // Si index est un multiple de 5 (0, 5, 10),la graduation est plus longue : 38 pixels.
              // Pour les autres graduations, elle mesure 25 pixels.
              width: index % 5 == 0 ? 38 : 25,
              // Définit l'épaisseur de la graduation à 2 pixels.
              height: 2,
              // Définit la couleur de la graduation. changer selon le theme
              color: Colors.blueAccent,
            );
          },
        ),
      ],
    );
  }
}
