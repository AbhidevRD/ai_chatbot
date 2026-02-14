from flask import Flask, request, jsonify
from flask_cors import CORS
import requests

app = Flask(__name__)
CORS(app)

OLLAMA_URL = "http://localhost:11434/api/generate"

@app.route("/chat", methods=["POST"])
def chat():
    user_message = request.json.get("message")

    payload = {
        "model": "opencoder:1.5b",
        "prompt": user_message,
        "stream": False
    }

    response = requests.post(OLLAMA_URL, json=payload)

    if response.status_code == 200:
        data = response.json()
        return jsonify({"response": data["response"]})
    else:
        return jsonify({"error": "Ollama error"}), 500


if __name__ == "__main__":
    app.run(debug=True, port=5000)
