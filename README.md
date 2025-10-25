# 🧩 Atividade Avaliativa — Infraestrutura de TI (Flask, Docker, K8s e Terraform)

## 🚀 Objetivo da Atividade
Este projeto tem como objetivo demonstrar o uso de **Infraestrutura como Código (IaC)**, **conteneirização** e **deploy local em Kubernetes**, utilizando:

- API simples em **Flask (Python)**
- **Docker** para empacotamento da aplicação
- **Kubernetes (Minikube ou Kind)** para orquestração
- **Terraform** para provisionamento de recursos AWS (ou simulados com LocalStack)

---

## 🧱 Estrutura do Repositório
infraestrutura_prova/
├── api_flask/ # API Flask simples
│ ├── app.py
│ ├── requirements.txt
│ └── Dockerfile
│
├── k8s/ # Manifests do Kubernetes
│ ├── deployment.yaml
│ └── service.yaml
│
├── terraform/ # Código IaC (Terraform)
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│
└── README.md

---

## 🧩 API Flask

### 📄 Arquivo principal — `app.py`
A API possui duas rotas:

- `GET /` → retorna mensagem de status  
- `POST /sum` → soma dois valores enviados via JSON  

**Exemplo:**

```
curl -X POST http://localhost:5000/sum \
  -H "Content-Type: application/json" \
  -d '{"a":3,"b":4}'
```
Resposta:

{"a":3,"b":4,"sum":7.0}

🐳 Docker
🏗️ Build da imagem
cd api_flask
docker build -t infra-prova-api:latest .

▶️ Executar o container localmente
docker run --rm -p 5000:5000 infra-prova-api:latest

🧪 Teste
curl http://localhost:5000/

☸️ Kubernetes
📦 Aplicar manifests
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

🔍 Obter URL de acesso
minikube service infra-prova-api-svc --url


Teste no navegador ou via curl com o endereço retornado.

🌍 Terraform
⚙️ Inicialização
cd terraform
terraform init
terraform apply -auto-approve

🪣 Recursos criados

Bucket S3: para armazenar artefatos da aplicação

Usuário IAM: com permissões limitadas a S3

Se estiver usando LocalStack, basta iniciar antes:

localstack start

🧪 Testes

Testes realizados via Insomnia/Postman

Verificado funcionamento das rotas / e /sum

Bucket criado com sucesso via Terraform (terraform output)

✅ Conclusão

A atividade demonstra o fluxo completo de:

Criação de API Python com Flask

Dockerização e execução em container

Deploy local com Kubernetes

Provisionamento de recursos AWS via Terraform

🧠 Autor

Marcus Mikael Rodrigues Vieira

