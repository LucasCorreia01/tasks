# Tasks

Meu primeiro app feito em Flutter

## Objetivos

- Compreender e entender os widgets básicos do Flutter.
    - Container;
    - SizedBox;
    - Image;
    - Padding;
    - Icon;
    - ListView;
    - Row;
    - Column;
    - Entre outros.

- Entender as classes padrões e suas forma de funcionamento.
    - StatelessWidget
    - StateFulWidget

- Compreensão do Material App

- Utilização de botões e lógicas simples de nosso aplicativo.

- Utilização animações simples.

![App Tasks](/assets/gifs/app.gif)


## ✔️ Técnicas e tecnologias

**Veja mais de perto o que você aprenderá sobre** :
- `TextField`: Widget de Campo de Texto.
- `TextFormField`: Widget de Campo de Texto com Validação.
- `Form`: Widget de Formulário que cuida da Validação de todos os TextFormFields.
- `controller`: parâmetro de TextField que manipula os dados.
- `ErrorBuilder`: função do Widget Image que permite lidar com erros.
- `keyboardType`: parâmetro do TextField que permite alteração de teclados.
- `validator`: parâmetro do TextFormField que permite adicionar validação.
- `SnackBar`: Widget do Scaffold, perfeito para mostrar informações.
- `Navegação`: conceito de mudança de tela.
- `Rotas`: nomenclatura para Telas.
- `Inherited Widget`: Widget com habilidade de lidar e transmitir dados.

## 🛠️ Abrir e rodar o projeto

**Para executar este projeto você precisa:**

- Ter uma IDE, que pode ser o  [Android Studio](https://developer.android.com/) instalado na sua máquina
- Ter a [SDK do Flutter](https://docs.flutter.dev/get-started/install) na versão 3.0.0

## Resolução do Desafio proposto:
- Para resolução do desafio utilizei o `InheritedWidget` para salvar o nível global das tarefas.
- Também foi necessário transformar o `initialWidget` em um StateFulWidget, que é atualizado toda vez que pressionamos o botão `refresh`, já que realizamos um setState(){}.
- Criei uma função que incrementa um décimo diferente de acordo com o nível da tarefa realizada, `incrementTotalValue`. Ela é executada toda vez que pressionamos o botão UP.

![App-CreateTask]('/assets/gifs/app-createTask.gif)


