# News App: MVVM Cordinator combine

News App is an sample iOS App written in Swift using the MVVM architecture.  



### Run Sample 
1. Clone this repository.
    ```
    git clone https://github.com/mohamedcherif1920/NewsApp.git
    ```

2. Open `NewsApp.xcworkspace` in Xcode. 

3. Run

## Description

NewsApp is an sample iOS App written in swift using the MVVM architecture. list News , detail News, See more to preview the article  
## choix
: En utilisant Clean Architecture, 
j'ai organisé le code de manière à ce que les différentes parties de l'application aient des responsabilités claires. 
Les couches (Entités, Cas d'utilisation, Interfaces Utilisateur) sont distinctes et interagissent de manière définie, facilitant ainsi la compréhension du code.

MVVM 

Séparation des préoccupations :
MVVM sépare clairement la logique métier de l'interface utilisateur. Les modèles gèrent les données, les vues affichent ces données, et les view models gèrent la logique métier et la liaison entre les modèles et les vues.

Facilitation des tests unitaires : 
En adoptant MVVM, on a rendu le code plus testable. Les view models, étant indépendants de l'interface utilisateur, peuvent être testés facilement, ce qui améliore la qualité et la stabilité de l' application.

Combine (Framework de programmation réactive) :

Gestion asynchrone simplifiée : Combine facilite la gestion des opérations asynchrones en fournissant un modèle déclaratif pour la manipulation des flux de données.
Cela améliore la clarté du code et réduit les erreurs liées à la gestion de la concurrence.

Réactivité de l'interface utilisateur : Combine s'intègre bien avec MVVM, permettant une mise à jour réactive de l'interface utilisateur en réponse aux changements dans les données. 
Cela offre une expérience utilisateur plus fluide

Coordinator :

Coordination de la navigation : En utilisant le pattern Coordinator, on a  centralisé la gestion de la navigation au sein de l'application.
Cela rend la navigation entre les différentes parties de l'application plus claire et facilite l'ajout de nouvelles fonctionnalités sans affecter la logique de navigation existante.

Facilitation de la modularité : Les coordinators facilitent la modularité en permettant de découpler les différentes parties de l'application.
Chaque coordinator peut être responsable d'un flux de navigation spécifique, ce qui simplifie la maintenance et l'extension de l'application.

## Problémes identifies et à traiter 
- ajout interface d'erreur
- ajout filtre 
- rendre l'application multi longue (localizable)
  

## Requirements

- Xcode 10.2+
- Swift 5.0+

## Installation
Clean Architecture :

```
git clone https://github.com/mohamedcherif1920/NewsApp.git
```




## Author

Mohamed cherif, m.cherif.m28@gmail.com

