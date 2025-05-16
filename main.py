from fastapi import FastAPI, UploadFile, File
from fastapi.responses import StreamingResponse
from rembg import remove
from io import BytesIO

app = FastAPI()

@app.post("/remove")
async def remove_bg(file: UploadFile = File(...)):
    image = await file.read()
    output = remove(image)
    return StreamingResponse(BytesIO(output), media_type="image/png")
