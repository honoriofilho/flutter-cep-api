# POC - Consulta de CEP com Clean Architecture em Flutter

Este projeto é uma prova de conceito (POC) que demonstra a implementação de uma consulta de CEP (Código de Endereçamento Postal) utilizando os princípios da Clean Architecture em Flutter. O objetivo é fornecer uma estrutura clara, testável e escalável para a busca de endereços a partir de um CEP.

## Visão Geral

A Clean Architecture visa separar as preocupações do seu aplicativo em camadas distintas, cada uma com uma responsabilidade bem definida. Isso facilita a manutenção, os testes e a adaptação do seu código a diferentes necessidades.

Nesta POC, a arquitetura é dividida nas seguintes camadas:

*   **Presentation (UI):** Camada responsável pela interface do usuário (widgets, telas).
*   **Controller (Gerenciador de Estado):** Camada responsável por receber as ações do usuário na interface e coordenar as interações com as camadas de domínio e dados. Utilizamos o GetX para gerenciamento de estado.
*   **Domain (Domínio):** Camada que contém as regras de negócio e os casos de uso do aplicativo.
*   **Data (Dados):** Camada responsável por obter os dados de diferentes fontes (API, banco de dados, etc.).
*   **Common (Comum):** Camada para Classes e Funções reutilizáveis como Validação e Formatação.

## Funcionalidades

*   Consulta de CEP em tempo real através da API do ViaCEP.
*   Exibição dos dados do endereço (logradouro, bairro, cidade, estado) na tela.
*   Validação do formato do CEP.
*   Tratamento de erros e exibição de mensagens de erro na tela.
*   Implementação de "debounce" para evitar requisições excessivas à API.

## Tecnologias Utilizadas

*   **Flutter:** Framework para desenvolvimento de aplicativos móveis multiplataforma.
*   **GetX:** Gerenciador de estado, rotas e dependências.
*   **Dio:** Cliente HTTP para fazer requisições à API do ViaCEP.
*   **Equatable:** Biblioteca para facilitar a comparação de objetos (útil para otimizar a reconstrução da UI).
*   **MaskTextInputFormatter:** Biblioteca para formatar o campo de texto do CEP.

## Estrutura do Projeto

cep_app/
├── lib/
│ ├── app.dart # Widget raiz do aplicativo (GetMaterialApp)
│ ├── routes/ # Definição das rotas (GetX)
│ │ ├── app_pages.dart
│ │ └── app_routes.dart
│ ├── modules/ # Módulos do aplicativo (Home)
│ │ ├── home/
│ │ │ ├── home_page.dart # View (UI)
│ │ │ ├── home_controller.dart # Controller (Gerenciador de Estado)
│ │ │ ├── home_binding.dart # Binding (Injeção de Dependência)
│ │ │ └── home_state.dart # State (Estado da tela)
│ ├── data/ # Camada de Dados
│ │ ├── model/
│ │ │ └── address.dart # Modelo de dados (Address)
│ │ ├── provider/
│ │ │ └── address_api.dart # API Client (ViaCEP)
│ │ └── repository/
│ │ └── address_repository.dart # Repositório (Abstração da fonte de dados)
│ ├── configs/ # Arquivos de configuração
│ │ └── dio_config.dart # Configuração do Dio
│ └── main.dart # Ponto de entrada do aplicativo
├── pubspec.yaml # Arquivo de configuração do Flutter
└── README.md # Este arquivo


## Como Executar

1.  Clone este repositório:

    ```bash
    git clone [URL do repositório]
    ```

2.  Entre no diretório do projeto:

    ```bash
    cd [nome do diretório]
    ```

3.  Instale as dependências:

    ```bash
    flutter pub get
    ```

4.  Execute o aplicativo:

    ```bash
    flutter run
    ```

## Observações

*   Esta POC utiliza a API gratuita do ViaCEP. Esteja ciente das limitações de uso e considere utilizar uma API paga para uso em produção.
*   O tratamento de erros é básico. Em um aplicativo real, você deve implementar um tratamento de erros mais robusto e amigável para o usuário.
*   A validação do CEP é simples. Em um aplicativo real, você pode adicionar validações mais complexas (por exemplo, verificar se o CEP existe).
*   O objetivo principal é demonstrar a estrutura da Clean Architecture, e não fornecer um aplicativo completo e pronto para produção.

## Próximos Passos

*   Implementar testes unitários e de widget.
*   Adicionar um tratamento de erros mais robusto.
*   Implementar validações mais complexas do CEP.
*   Adicionar um histórico de consultas de CEP.
*   Implementar a persistência dos dados do endereço.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e enviar pull requests.

## Licença

Licença: [MIT License](LICENSE)

## Autor

Honório Filho