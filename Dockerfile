
FROM python:3.10-slim

RUN pip install rembg[server]

EXPOSE 5000

CMD ["rembg", "serve"]
