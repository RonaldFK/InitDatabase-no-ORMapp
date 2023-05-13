# InitDatabase-no-ORMapp
[![forthebadge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ronald-fonlebeck/)
[![forthebadge](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)](#)


### Projet :

Ce projet purement SQL vient déplacer, amener une partie sécurité au niveau de la base de données ( ici Postgres ).
L'idée est de mettre en place des focntions et des vues qui seront accessibles depuis l'application web par simple requête SELECT.
En procédant de cette manière, le but premier est de fermer tout accès aux utilisateurs (développeurs) de l'application.
En effet, en procédant de cette manière, l'utilisateur n'aura plus nécessiyté d'avoir le droit de modification sur les tables , mais passera par nos focntions pour effectuer ses actions CRUD.


### Todo :
 - Implémentation des tests.


### Outils / Notions :

- PostgresSQL pour le stockage des données de l'application.
- Docker pour exécuter notre conteneur Docker.
- PGAdmin.
- DOMAIN pour la création de type de données générique afin de rajouter un contrôle sur les email notamment avec un REGEX.
- TRIGGER pour déclencher l'archivage de certaines données avant sup^pression.
- PGTap (à tester, je me documente) pour implémenter des tests en SQL.


### Cloner le projet :
```
git@github.com:RonaldFK/InitDatabase-no-ORMapp.git
```

### Démarré le projet

Exécuter le script starProcess.sh sur un serveur Linux ( ou adapter le script )

