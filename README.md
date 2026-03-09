# Smart-Park: Sistema de Monitoramento de Estacionamentos 

O **Smart-Park** é uma solução de IoT desenvolvida para a gestão e monitoramento inteligente de vagas em estacionamentos, visando otimizar o fluxo de veículos e melhorar a experiência do usuário.

## 👥 Integrantes
* **Guilherme Lima Pastorello**
* **Eduardo Guaglioni**
* **Isaac Azevedo**
* **Victor de Souza**
* **Matheus de Paula**
* **Pedro Costa**
* **Rafael Naleto**


## 📂 Estrutura do Projeto

Abaixo estão detalhados os diretórios e arquivos que compõem este repositório:

### 1. 🗄️ Banco de Dados (`/Banco de Dados`) 
Contém os arquivos necessários para a configuração da infraestrutura de dados do projeto.
* **`SCRIPT_BD_SPRINT1.sql`**: Script SQL contendo a criação das tabelas e a estrutura inicial do banco de dados para a primeira fase do projeto.

### 2. 🌐 Códigos e Site (`/Códigos e Site`) 
Nesta pasta reside a interface visual e a lógica de simulação financeira para o cliente final.
* **`TelaSimuladorFinanceiro.html`**: Página web que apresenta a interface do sistema, permitindo interações do usuário e visualização de dados.


### 3. 🤖 Código Arduino (`/Código_Arduino_Teste`) 
Contém o software embarcado que controla os sensores e a comunicação do hardware.
* **`codigo_arduino.ino`**: Código-fonte desenvolvido para a placa Arduino, responsável por realizar a leitura dos sensores de presença nas vagas e enviar os dados para o sistema.

---

## 🛠️ Tecnologias Utilizadas
* **Hardware:** Arduino e Sensores IoT.
* **Banco de Dados:** SQL (Estrutura de tabelas).
* **Frontend:** HTML5, CSS e JavaScript.

## 📝 Como utilizar
1.  **Banco de Dados:** Execute o script `.sql` em seu gerenciador de banco de dados para preparar as tabelas necessárias.
2.  **Hardware:** Carregue o arquivo `.ino` na sua placa utilizando a Arduino IDE para iniciar o monitoramento das vagas.
3.  **Interface:** Abra o arquivo `.html` em um navegador para acessar o simulador financeiro e a interface do usuário.

---