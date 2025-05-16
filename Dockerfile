FROM python:3.10-slim

# Установка системных библиотек
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# Установка pip-зависимостей
RUN pip install --no-cache-dir \
    rembg \
    onnxruntime \
    filetype \
    watchdog \
    uvicorn \
    fastapi

# Порт для сервера
EXPOSE 5000

# Запуск сервера rembg
CMD ["rembg", "serve"]
