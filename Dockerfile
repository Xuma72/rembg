FROM python:3.10-slim

# Установка системных зависимостей
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# Установка зависимостей по отдельности
RUN pip install --no-cache-dir \
    rembg \
    onnxruntime \
    filetype \
    click \
    uvicorn \
    fastapi

# Открытие порта сервера
EXPOSE 5000

# Запуск rembg как сервиса
CMD ["rembg", "serve"]
