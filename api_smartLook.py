from flask import Flask, request # Importa a classe principal do flask

app = Flask(__name__) # Declara a classe de controle da aplicação

@app.route('/api/recebeImage', methods=['POST'])
def recebeImg():
    img = request.form.get('img')
    print("Imagem recebida: " )
	#chama o algoritmo que vai processar 
    return "retorna algoritmo"

@app.route("/api/processImage", methods=['POST']) # Declara a rota e ps tipos métodos de requisição que ela aceita 
def api(): # Função que a rota vai acionar
    return "Hello World"


if __name__ == '__main__': # Inicia a aplicação
    app.run(debug=True)


