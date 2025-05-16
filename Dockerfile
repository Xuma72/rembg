FROM python:3.10-slim

# Установка зависимостей
RUN apt-get update && apt-get install -y libgl1-mesa-glx && rm -rf /var/lib/apt/lists/*

# Установка rembg и onnxruntime вручную
RUN pip install --no-cache-dir rembg onnxruntime

# Открываем порт API
EXPOSE 5000

# Запускаем rembg в режиме сервера
CMD ["rembg", "serve"]
