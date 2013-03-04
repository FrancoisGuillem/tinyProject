\name{project-package}
\alias{project-package}
\alias{project}
\docType{package}
\title{
Organiser les fichiers d'un projet statistique.
}
\description{
Lorsqu'on travaille avec R sur de gros projets, les fichiers de données, de scripts et de sorties
se multiplie très rapidement. Ce package a pour objectif d'accélérer le développement sous R en réduisant le temps passé à chercher, 
charger, sauvegarder et exécuter des fichiers. Il permet à l'utilisateur de créer pour chacun de ses
projets une arborescence et d'enregistrer facilement ses fichiers au bon endroit.
}
\details{
\tabular{ll}{
Package: \tab project\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2011-12-26\cr
License: \tab François Guillem?\cr
}

Pour commencer, on crée un nouveau projet avec la commande \code{\link{createProject}}. Cette
instruction va créer dans le répertoire courant un dossier dont le nom est celui du projet. Ce dossier
contient lui-même trois sous-répertoire : "data" pour les données, "scripts" pour les scripts et
"output" pour les sorties. En plus de ces fichiers trois fichiers sont créés et ouverts dans l'éditeur :
"data" pour les opérations d'importation et de traitement de données, "main" pour les principales opérations
d'analyse et "start" pour toutes les commandes qui doivent être éxécutées chaque fois
que le projet est ouvert (chargement des bibliothèques et des données, définition des constantes...).

Pour ouvrir un projet déjà existant, il suffit d'utiliser la fonction \code{\link{createProject}}. 
Lors de l'ouverture. Le script "start" est automatiquement sourcé, de même que tous les scripts 
dont le nom commence par "tools". Cela peut être utile pour charger des données et des fonctions
personnelles.

\subsection{Gestion des scripts}{
La commande \code{\link{script}} permet de créer un script ou de l'ouvrir s'il existe déjà. Il suffit
de passer en argument le nom du script (sans l'extension ".R") à créer ou à ouvrir. Si la fonction
est appelée sans argument, alors une liste des fichiers disponibles est affichée et l'utilisateur
peut ouvrir le fichier désiré en tapant le numéro correspondant. Si un fichier doit être sourcé 
automatiquement à l'ouverture du projet, alors il suffit de rajouter à son nom le préfixe "tools". 
Enfin pour sourcer un script (éventuellement dans un projet différent) on peut utiliser la fonction \code{\link{prSource}}. 
}

\subsection{Gestion des données}{
N'importe quel objet peut être sauvegardé à l'aide de la fonction \code{\link{prSave}}. Il suffit
de passer en argument à la fonction le nom de l'objet à sauvegarder (entre guillemets). Par défaut,
Si l'objet existe déjà, un message d'erreur est affiché, afin d'éviter d'écraser un fichier déjà existant
par erreur. Dans ce cas, il faut rajouter l'argument \code{replace = TRUE}. Pour charger des données,
il suffit d'utiliser la fonction \code{\link{prLoad}}.
}

\subsection{Gestion des sorties}{
Pour sauvegarder un graphique au format ".png", on peut utiliser la fonction \code{\link{prPng}}. La
fonction prend comme argument le nom du fichier (sans l'extension) et le thème désiré ("black" ou "white").
Le fichier sera créé dans le dossier "output".
}
}

\author{
François Guillem

Maintainer: François Guillem <guillem.francois@gmail.com>
}
\references{
~~ Literature or other references for background information ~~
}
