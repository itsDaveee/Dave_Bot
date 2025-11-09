# Utilise l'image de base Node.js Alpine
FROM node:22-alpine

# Installation des outils nécessaires
RUN apk add --no-cache build-base git ffmpeg libwebp-tools python3 make g++

# Nous n'avons PAS besoin de WORKDIR si le code est à la racine.

# Installation des dépendances définies dans package.json
RUN npm install

# Création du dossier temporaire
RUN mkdir -p temp

# Définition du fuseau horaire
ENV TZ=Asia/Kolkata

# Indique à Docker que le container écoute sur le port 3000
EXPOSE 3000

# Commande de démarrage (s'exécute à la racine)
CMD [ "npm", "start" ]
