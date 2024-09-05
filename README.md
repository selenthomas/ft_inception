## Description :
Le projet Inception est une mise en pratique des concepts de conteneurisation à l’aide de Docker. Ce projet individuel consiste à créer une mini-infrastructure en utilisant Docker et Docker Compose, en mettant en place une architecture de services interconnectés, chacun dans son propre conteneur.

## Objectifs :
- **Conception et Configuration de Services :** Création et configuration de plusieurs conteneurs Docker, chacun pour un service spécifique, incluant NGINX, WordPress avec PHP-FPM, et MariaDB.
- **Automatisation des Builds et Déploiements :** Développement d’un fichier docker-compose.yml pour orchestrer les services, ainsi qu’un Makefile pour automatiser le build des images Docker.
- **Gestion des Volumes et Réseaux :** Mise en place de volumes pour la persistance des données et configuration d’un réseau Docker pour la communication entre les conteneurs.
- **Sécurité et Performance :** Configuration de NGINX pour utiliser uniquement TLSv1.2 ou TLSv1.3, et utilisation des versions stables d'Alpine ou Debian pour les conteneurs pour optimiser les performances.

## Responsabilités :
- **Écriture des Dockerfiles :** Création de Dockerfiles personnalisés pour chaque service, assurant une construction efficace des images Docker.
- **Configuration de Docker Compose :** Développement d’un fichier docker-compose.yml pour définir et orchestrer les services conteneurisés.
- **Gestion des Volumes :** Mise en place de volumes pour stocker les données de la base de données et les fichiers WordPress, accessibles sur le système de fichiers hôte.
- **Configuration de Réseau Docker :** Création et gestion d’un réseau Docker pour assurer la connectivité entre les conteneurs sans utiliser des méthodes obsolètes comme network: host ou --link.
- **Sécurité et Répétabilité :** Configuration des conteneurs pour qu'ils redémarrent automatiquement en cas de crash et respect des meilleures pratiques en matière de conteneurisation, évitant les solutions de contournement comme les boucles infinies.
  
## Compétences Acquises :
- **Conteneurisation et Orchestration :** Maîtrise de Docker et Docker Compose pour créer des environnements isolés et interconnectés.
- **Automatisation des Builds :** Développement et utilisation de Makefile pour automatiser le processus de build et de déploiement des images Docker.
- **Gestion des Services :** Compétences en configuration de services web (NGINX), de gestion de contenu (WordPress avec PHP-FPM), et de bases de données (MariaDB).
- **Sécurité et Performance :** Application des meilleures pratiques en matière de sécurité (TLSv1.2/1.3) et optimisation des performances avec des versions stables d'Alpine ou Debian.

## Technologies Utilisées :
![Docker](https://avatars.githubusercontent.com/u/7739233?s=200&v=4)
Docker : Création et gestion des conteneurs, rédaction de Dockerfiles.
Docker Compose : Orchestration des conteneurs et gestion des services.
NGINX : Configuration de serveur web avec support TLS.
WordPress + PHP-FPM : Installation et configuration d'un CMS avec un moteur PHP.
MariaDB : Gestion de base de données relationnelle.
Makefile : Automatisation du processus de build et de déploiement.

## Résultats :
Déploiement réussi d'une infrastructure multi-conteneurs fonctionnelle, répondant aux exigences de sécurité et de performance.
Configuration réussie d'un nom de domaine personnalisé pour le site web, conformément aux spécifications.
