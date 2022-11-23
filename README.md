# Trabalho Prático ![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)

## App consumindo uma API

Esse é o último trabalho prático de TP onde tivemos como objetivo criar uma app com base na linguagem Flutter.<br>
Tivemos como princípais objetivos:  

- Criar um aplicativo no ambiente AndroidStudio
- Obrigatóriamente o App terá que possuir ao menos duas páginas distintas
- Obrigatóriamente o App terá que utilizar uma API

## API

- Ultilizamos a API disponibilizada pelo [Pixabay]
- Ela é uma API que nos fornece um banco de imagens.
- [Documentação API]

## APP e Funcionalidades

  ### Estrutura da Página Inicial:
  
  | Conteúdo            | 
  | ------------------- |
  | AppBar              |
  | Logo                |
  | Box para pesquisa   |
  | Botão para pesquisa |
  | Estilização         |
  
  #### Funcionamento
  
  Na primeira página o usuário pode interagir com duas funcionalidades do app. A primeira será a caixa de pesquisa onde ele definirá uma categoria de    imagem que deseja ver. Em seguida poderá interagir com o botão de procurar onde após ativado levará o usuário para a segunda página do app.
  
  ### Estrutura da Página Secundária:
  
  | Conteúdo                     | 
  | ---------------------------- |
  | AppBar                       |
  | Botão página inicial         |
  | Resultado da busca (imagens) |  
  | Estilização                  |
  
  #### Funcionamento
  
  Na segunda tela do aplicativo não há muito interação com o usuário. Nessa parte será exibida imagens relacionadas a categoria escolhida previamente pelo usuário, além de um botão no qual poderá interagir e ser redirecinado novamente para a página inicial.
  
  ### API
  
  #### Implementação
  
  Armazenamos nossa chava da API em um arquivo separado demoninado de scr.dart – para caso a API expire não precisemos varrer o código por completo – e a importamos para o arquivo main.dart e atribuimos o seu valor a seguinte variável:
  
```Js
var apiKey = 'numero_chame_api';
```

  Atribuimos a categoria escolhido pelo usuário na seguinte variável:
 
```Js
String category;
```

  Para o funcionamento e implementação da api basta agora substituí-las nos locais corretos da URL as variáveis que criamos

```Js
String url = 'https://pixabay.com/api/?key=$apiKey&q=$category$image_type=photo&pretty=true'
```

## Contribuidores
Aqui vemos uma representação fiel dos contribuidores:<br/>
![GitHub Contributors Image](https://contrib.rocks/image?repo=EoBerrr/APP-API)<br/>
Bernardo Tavares e Gabriel Rodrigues, respectivamente

## Piada aleatória! Ria Virgínia. 😂 
![Jokes Card](https://readme-jokes.vercel.app/api)

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen.)

[Pixabay]: <https://pixabay.com/pt/>
[Documentação API]: <https://pixabay.com/api/docs/#api_search_images>
