FROM python:3.10-slim

# Установка системных зависимостей
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# Установка rembg и onnxruntime
RUN pip install --no-cache-dir rembg[server] onnxruntime

EXPOSE 5000

CMD ["rembg", "serve"]