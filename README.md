# Flutter Challenge 20210610

### Instruções iniciais obrigatórias

- Utilizar o seu github pessoal para publicar o desafio. Confirme que a visibilidade do projeto é pública (não esqueça de colocar no readme a referência a este challenge);
- Leia atentamente todo o descritivo desse documento antes de qualquer coisa;
- O projeto deverá ser desenvolvido em Flutter/Dart;
- Os produtos disponíveis no projeto da aplicação devem ser recuperados através do Firebase Realtime DB ou Firestore;
- Utilize sempre boas práticas nas implementações. OOP, SOLID, DDD, Clean Code, Injeção de Dependência são sempre bem-vindos e fazem toda diferença!!!


## API / Firebase
 
###  Base de Dados
 
- Utilizar o Firestore ou Firebase Realtime DB

- Processar os produtos do arquivo [products.json](products.json) para termos dados para editar e excluir durante os testes 

## Aplicação Flutter
 
![<img src="assets/images/home.png" height="500" alt="Home" title="Home"/>](assets/images/home.png)

#### Listar produtos
 
Criar uma sessão na tela com uma lista de os produtos processados pela API. É importante ter os seguintes campos:
 
        - Foto
        - Title
        - Type
        - Rating
        - Price
        - Created (Data do upload do produto a nova base de datos)
        - Actions (Botões Editar e Excluir)
 
#### Editar produto
 
Na tabela com os produtos precisamos disponibilizar os formulários com todos os campos dos produtos para que a equipe possa editá-los. 
Fazer validação de alguns campos obrigatórios:

        - Title
        - Type
        - Price
 
#### Remover produto
 
Antes de completar a ação de remover produto, devemos perguntar ao usuário se ele realmente 
quer realizar a ação. Para evitar a remoção de produtos de maneira indesejada. Após remover com êxito, notificar o usuário com um alerta de sucesso. 

#### Extras
 
**Diferencial 1** - Utilizar Unit Test no front-end para a opção de `Remover produto`. 

**Diferencial 2** - Utilizar Unit Test para revisar se está listando produtos 

**Diferencial 3 -** Utilizar alguma ferramenta de Injeção de Dependência

**Diferencial 4 -** Utilizar alguma ferramenta para download e cache de imagens

#### Publicar

Utilizar seu repositório para disponibilizar a aplicação as versões Android e/ou iOS.

## Readme do Repositório
 
- Deve conter o título de cada projeto
- Uma descrição de uma frase
- Como instalar e usar o projeto (instruções)
- Não esqueça o [.gitignore](https://www.toptal.com/developers/gitignore)
- Link de downloads para iOS e/ou Android
 
## Finalização 

Avisar sobre a finalização e enviar para correção em: [https://coodesh.com/review-challenge](https://coodesh.com/review-challenge) 

Após essa etapa será marcado a apresentação/correção do projeto.

## Instruções para a Apresentação: 

1. Será necessário compartilhar a tela durante a vídeo chamada;
2. Deixe todos os projetos de solução previamente abertos em seu computador antes de iniciar a chamada;
3. Deixe os ambientes configurados e prontos para rodar; 
4. Prepara-se pois você será questionado sobre cada etapa e decisão do Challenge;
5. Prepare uma lista de perguntas, dúvidas, sugestões de melhorias e feedbacks (caso tenha).


## Suporte

Use a [nossa comunidade](https://coodesh.com/desenvolvedores#community) para tirar dúvidas sobre o processo ou envie um e-mail para contato@coodesh.com.

