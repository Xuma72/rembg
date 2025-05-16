FROM python:3.10-slim

# Установка системных пакетов
RUN apt-get update && apt-get install -y \
    build-essential \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

# Установка Python-зависимостей
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir \
        rembg \
        onnxruntime \
        watchdog \
        aiohttp \
        uvicorn \
        fastapi \
        python-multipart \
        Pillow

# Создание рабочей директории
WORKDIR /app

# Копируем FastAPI-приложение
COPY main.py .

# Открываем порт
EXPOSE 8000

# Запуск FastAPI
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
