# Используем официальный образ Node.js 18 на базе Alpine для минимального размера
FROM node:18-alpine

# Создаем рабочую директорию
WORKDIR /usr/src/app

# Копируем файлы манифеста для установки зависимостей
COPY package*.json ./

# Устанавливаем зависимости
# Используем --production, чтобы не ставить лишние devDependencies
RUN npm install --production

# Копируем исходный код сервера
COPY . .

# Back4app требует, чтобы приложение слушало порт, заданный в переменной окружения PORT
# В вашем коде уже есть: const PORT = process.env.PORT || 3000;
EXPOSE 3000

# Запускаем приложение
CMD [ "npm", "start" ]
