from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route("/")
def index():
    return jsonify({"message": "API Infraestrutura rodando com sucesso!", "status": "ok"})

@app.route("/somar", methods=["POST"])
def somar():
    data = request.get_json() or {}
    a = data.get("a", 0)
    b = data.get("b", 0)
    try:
        soma = float(a) + float(b)
        return jsonify({"a": a, "b": b, "soma": soma})
    except Exception as e:
        return jsonify({"erro": str(e)}), 400

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
