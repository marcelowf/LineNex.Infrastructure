<br>
<br>
<p align="center">
  <a href="https://github.com/marcelowf/Personal-Icons/">
    <img loading="lazy" alt="LineNex" src="https://raw.githubusercontent.com/marcelowf/Personal-Icons/main/LineNexLogoCut.png" width="80%"/>
  </a>
</p>
<br>
<br>

[![Terraform](https://img.shields.io/badge/Terraform-623CE4?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/) [![Azure](https://img.shields.io/badge/Azure-0078D4?style=for-the-badge&logo=&logoColor=white)](https://azure.microsoft.com/) [![Azure DevOps](https://img.shields.io/badge/Azure%20DevOps-0078D7?style=for-the-badge&logo=&logoColor=white)](https://azure.microsoft.com/services/devops/) [![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)](https://git-scm.com/)

## 🚀 **Sobre o Projeto**  

O LineNex Infrastructure é o componente responsável pela gestão da infraestrutura da aplicação LineNex. Ele automatiza a provisionamento, configuração e monitoramento dos recursos em nuvem e ambientes de execução, garantindo escalabilidade, segurança e consistência nas operações industriais.

### 📚 Visão Geral

Este projeto utiliza Terraform para provisionar:

- App Service Plan
- Web App
- Static Web App
- Storage Account
- Key Vault
- SQL Server
- SQL Database
- Virtual Network
- Application Insights

<p align="center">
  <a href="https://github.com/marcelowf/Svg-Icon-Repo/">
    <img loading="lazy" alt="Azure Infrastructure" src="https://raw.githubusercontent.com/marcelowf/Personal-Icons/main/LineNex/prints/AzureResourceGroup.jpg" width="100%"/>
  </a>
</p>
  
### 🗂️ Estrutura da Infraestrutura

A infraestrutura do LineNex é organizada para promover modularidade e reusabilidade. As principais pastas são:

* **`Skeletons`**: Esta pasta armazena **templates de recursos de infraestrutura**. Cada subpasta dentro de `Skeletons` representa um modelo pré-configurado de um recurso comum, como uma rede virtual, um grupo de recursos ou um serviço específico. Isso agiliza o provisionamento e garante a padronização ao criar novos componentes.
* **`.Application`**: Aqui reside a **estrutura principal do projeto de infraestrutura**. Esta pasta contém os arquivos Terraform (`.tf`) que orquestram a implantação dos recursos para a aplicação LineNex, utilizando, quando aplicável, os templates definidos em `Skeletons`. É o coração da configuração da infraestrutura específica do LineNex.

### 🔧 Pré-requisitos

- Terraform CLI
- Azure CLI
- Acesso a uma assinatura Azure
- Git

### ⚙️ Configuração do Ambiente

Siga estes passos para configurar seu ambiente de desenvolvimento:

1. **Clonar repositório:**
    Clone este repositório em sua máquina local.
2. **Variáveis de Ambiente / Secrets:**
    Entre no projeto que deseja rodar (SelfHost ou Application) e edite o arquivo terraform.tfvars da forma que quiser, depois, em seu Azure DevOps edite seu variable group.

### 📌 **Como Rodar o Projeto**  

#### ➡️ **Executando Localmente**  

```bash
cd {Projeto.Foundation}
az login
az account show
terraform init
terraform validate
terraform plan
terraform apply
```

---

### 🧰 CI/CD

O LineNex utiliza Azure DevOps Pipelines para automatizar o processo de CI/CD usando os arquivos yml localizados em Configuration.AzureDevOps/

---

### 📝 Licença

Este projeto está sob a licença MIT. Consulte o arquivo LICENSE para mais detalhes.

### 👤 Autores e Contato

LinkedIn: [Marcelo Wzorek Filho](https://www.linkedin.com/in/marcelo-wzorek-filho-132228255/)
E-mail: <marcelo.projects.dev@gmail.com>
GitHub: [marcelowf](https://github.com/marcelowf)

### 🏷️ Tags

`LineNex` `Produção Industrial` `IoT` `Monitoramento` `Automação` `Azure` `.NET` `DDD` `Docker` `Terraform` `Prometheus` `Grafana` `Swagger` `CI/CD` `xUnit` `Cucumber` `SonarAnalyzer` `OpenTelemetry`
