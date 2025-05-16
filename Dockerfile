FROM python:3.10-slim

# Установка системных зависимостей
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# Установка rembg и всех его зависимостей
RUN pip install --no-cache-dir rembg[all]


CMD ["rembg", "serve"]
