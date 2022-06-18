from fastapi import FastAPI
from nlp.textAnalyser import analyseText

app = FastAPI()

#/analyse-text/?text=<string>&aspect=<string>
# uvicorn main:app 
@app.get("/analyse-text/")
def root(text: str, aspect: str):
    return analyseText(text, aspect)