FROM python:3.10-slim

# Установим системные библиотеки (для opencv и pillow)
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Установка rembg с полным набором зависимостей
RUN pip install --no-cache-dir "rembg[all]"

EXPOSE 5000

CMD ["rembg", "serve"]
