FROM python:3.10-slim

# Установка системных библиотек
RUN apt-get update && apt-get install -y libgl1-mesa-glx && rm -rf /var/lib/apt/lists/*

# Установка необходимых Python-библиотек
RUN pip install --no-cache-dir rembg onnxruntime

# Открытие порта и запуск сервера rembg
EXPOSE 5000

CMD ["rembg", "serve"]
