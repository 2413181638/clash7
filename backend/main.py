from fastapi import FastAPI
import requests

app = FastAPI()

MIHOMO_API = "http://127.0.0.1:9090"
SECRET = "your_api_secret"  # 替换为实际密钥

@app.put("/configs")
async def update_config(path: str = "", payload: str = "", force: bool = True):
    url = f"{MIHOMO_API}/configs{'?force=true' if force else ''}"
    headers = {"Authorization": f"Bearer {SECRET}"}
    data = {"path": path, "payload": payload}
    try:
        response = requests.put(url, headers=headers, json=data)
        response.raise_for_status()
        return {"status": "success", "data": response.json()}
    except requests.RequestException as e:
        return {"status": "error", "message": str(e)}
