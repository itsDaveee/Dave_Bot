# Utilise l'image de base Node.js Alpine pour une taille réduite
FROM node:22-alpine

# Installation des outils nécessaires (git, python, make, g++)
RUN apk add --no-cache git ffmpeg libwebp-tools python3 make g++

# Définition du répertoire de travail (où le code sera exécuté)
WORKDIR /usr/src/app

# Clonage du dépôt dans le répertoire de travail
# Le "." à la fin s'assure que le contenu se trouve directement dans /usr/src/app
RUN git clone -b main https://github.com/souravk111/ragnork-md .

# Installation des dépendances définies dans package.json
RUN npm install

# Création du dossier temporaire (si votre bot en a besoin)
RUN mkdir -p temp

# Définition du fuseau horaire
ENV TZ=Asia/Kolkata

# Indique à Docker que le container écoute sur le port 3000 (le port par défaut dans index.js)
EXPOSE 3000

# Commande de démarrage
CMD [ "npm", "start" ]
