# Utilise l'image de base Node.js Alpine pour une taille réduite
FROM node:22-alpine

# Installation des outils nécessaires
RUN apk add --no-cache git ffmpeg libwebp-tools python3 make g++

# Définition du répertoire de travail (le code cloné par Render sera ici)
# IMPORTANT : Render met le code à la racine, donc WORKDIR . est plus sûr,
# mais /usr/src/app est une bonne pratique.
WORKDIR /usr/src/app

# Nous n'avons PAS besoin de la ligne RUN git clone ...

# Installation des dépendances définies dans package.json
RUN npm install

# Création du dossier temporaire (si votre bot en a besoin)
RUN mkdir -p temp

# Définition du fuseau horaire
ENV TZ=Asia/Kolkata

# Indique à Docker que le container écoute sur le port 3000
EXPOSE 3000

# Commande de démarrage
CMD [ "npm", "start" ]
