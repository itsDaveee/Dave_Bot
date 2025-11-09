# Utilise l'image de base Node.js standard (Debian)
FROM node:22

# Définition du répertoire de travail (le code cloné par Render sera ici)
WORKDIR /usr/src/app

# Installation des outils nécessaires pour les dépendances natives
# Cette image est plus complète, donc moins de paquets manuels nécessaires.
RUN apt-get update && apt-get install -y git python3 make g++

# Installation des dépendances définies dans package.json
RUN npm install

# Définition du fuseau horaire
ENV TZ=Asia/Kolkata

# Indique à Docker que le container écoute sur le port 3000
EXPOSE 3000

# Commande de démarrage
CMD [ "npm", "start" ]
