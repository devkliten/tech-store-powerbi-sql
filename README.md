# 📊 Dashboard de Vendas e Perfil de Clientes — TechStore

Projeto end-to-end de Business Intelligence integrando um banco de dados relacional **MySQL** ao **Power BI** otimizado via **SQL Views**.


### 🧮 Linguagem DAX Aplicada
* **Medidas Agregadoras:** SUM, COUNTROWS, DISTINCTCOUNT e AVERAGE para KPIs primários.
* **Funções Iteradoras:** SUMX combinada com RELATED para cálculo de Margem Bruta Total por produto.
* **Manipulação de Contexto:** CALCULATE e DIVIDE para métricas de canais específicos e eficiência de entregas.

---

## 🛠️ Tecnologias Utilizadas
* **Banco de Dados:** MySQL Workbench
* **Linguagem:** SQL (DDL, DML, Views e Joins)
* **Visualização de Dados:** Power BI

---

##  Arquitetura do Projeto

Em vez de importar tabelas brutas no Power BI, foram estruturadas **Views no MySQL** para garantir melhor performance, nomenclatura padronizada e segurança da camada de dados:

1. **`vw_dim_produtos`**: Consolida dados do produto, categoria e margem bruta unitária.
2. **`vw_dim_clientes`**: Dados cadastrais e localização dos clientes por Cidade/Estado.
3. **`vw_fato_vendas`**: Tabela Fato detalhada no nível de item de venda, contendo faturamento total, canais e status de entrega.

---

## 📈 Funcionalidades e Visuais do Dashboard

* **Métricas Principais (KPIs):** Vendas por Canais (E-commerce, Loja Física e Marketplace).
* **Análise Geográfica:** Distribuição percentual de clientes por Estado.
* **Desempenho de Produtos:** Ranking dos itens mais vendidos em barras horizontais.
* **Análise Financeira:** Margem de lucro bruta por linha de produto.

---

## 📸 Demonstração do Dashboard

<img width="1029" height="579" alt="Captura de tela 2026-09-09 204202" src="https://github.com/user-attachments/assets/59e50484-e73a-49a3-a7c0-d2534838e9f1" />



---

##  Como Executar o Projeto
1. Execute o script `script_database_and_views.sql` no MySQL Workbench para criar a base e as Views.
2. Abra o arquivo `Dashboard_Vendas_TechStore.pbix` no Power BI Desktop.
3. Atualize as credenciais de conexão de banco local (`localhost` ou `127.0.0.1`).
