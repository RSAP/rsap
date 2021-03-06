@PostTeste
Feature: Postagem
	As a usuario da rede social
	I want to ter a possibilidade de fazer, apagar, editar postagens no meu perfil e visualizar postagens minhas e de amigos
	So that eu possa interagir com outros usuarios na rede social

	Scenario: Criando uma nova postagem
		Given eu estou logado no meu perfil da rede social com o email "carlosantonio@o-nucleo.com" e senha "rails123456"
		And eu estou no mural do meu perfil
		And eu clico no botao novo post
		When eu preencho o titulo "Exemplo de classe em Java" e o texto ";;lang=java<br> public class Exemplo{ public int atributo}"
		And eu clico no botao de publicar nova postagem
		Then eu vejo que o post "Exemplo de classe em Java" e o texto ";;lang=java<br> public class Exemplo{ public int atributo}" foi publicado no meu mural com a devida formatacao

	Scenario: Apagando uma postagem
		Given eu estou logado no meu perfil da rede social com o email "carlosantonio@o-nucleo.com" e senha "rails123456"
		And eu estou no mural do meu perfil
		And a postagem com titulo "Soma em assembly" e o texto ";;lang=asm6502<br> .text add $t0, $t1, $t2" existe
		When eu clico no botao deletar a postagem com o titulo "Soma em assembly"
		Then a postagem com o titulo "Soma em assembly" eh deletada e some automaticamente do meu mural

	Scenario: Visualizando uma postagem
		Given eu estou logado no meu perfil da rede social com o email "carlosantonio@o-nucleo.com" e senha "rails123456"
		And eu estou no mural do meu perfil
		And a postagem com titulo "Importando bibliotecas em C" e o texto "As bibliotecas em C são utilizadas da seguinte maneira: Digita-se '#include' e depois, entre  <> coloca-se o nome da biblioteca seguido de um .h exemplo: ;;lang=c<br> #include <NomeDaBiblioteca.h>" existe
		When eu clico em visualizar o post "Importando bibliotecas em C"
		Then eu vejo uma tela exibindo o titulo "Importando bibliotecas em C", texto "As bibliotecas em C são utilizadas da seguinte maneira: Digita-se '#include' e depois, entre  <> coloca-se o nome da biblioteca seguido de um .h exemplo: ;;lang=c<br> #include <NomeDaBiblioteca.h>" e comentarios do post

	Scenario: Editando uma postagem
		Given eu estou logado no meu perfil da rede social com o email "carlosantonio@o-nucleo.com" e senha "rails123456"
		And eu estou no mural do meu perfil
		And a postagem com titulo "Comandos do rails" e o texto "Rodar servidor: bin/rails server" existe
		And eu clico em visualizar o post "Comandos do rails"
		When eu clico no botao de editar o post "Comandos do rails"
		And eu preencho os campos do titulo com "Comandos do rails (atualizado)" e o texto com "Rodar servidor: bin/rails server, para usuarios do windows o comando eh: ruby bin/rails server"
		And eu clico no botao de atualizar post
		Then eu vejo que o post "Comandos do rails" foi atualizado para o novo titulo "Comandos do rails (atualizado)" e o novo texto "Rodar servidor: bin/rails server, para usuarios do windows o comando eh: ruby bin/rails server"

	Scenario: Criando post em branco
		Given eu estou logado no meu perfil da rede social com o email "carlosantonio@o-nucleo.com" e senha "rails123456"
		And eu estou no mural do meu perfil
		And eu clico no botao novo post
		When eu clico no botao Publicar sem preencher nenhum campo
		Then eu vejo a mensagem de erro "Titulo em branco"
		And eu vejo a mensagem de erro "Texto em branco"

	Scenario: Postando um link
		Given eu estou logado no meu perfil da rede social com o email "carlosantonio@o-nucleo.com" e senha "rails123456"
		And eu estou no mural do meu perfil
		And eu clico no botao novo post
		When eu preencho o titulo "Link para o meu repositorio no github" e o texto "https://github.com/mrjonio/rsap"
		And eu clico na categoria "Link"
		And eu clico no botao de publicar nova postagem
		And eu clico no link "https://github.com/mrjonio/rsap" da postagem "Link para o meu repositorio no github"
		Then eu sou redirecionado para "https://github.com/mrjonio/rsap"

	Scenario: Editando um post com novos dados em branco
		Given eu estou logado no meu perfil da rede social com o email "carlosantonio@o-nucleo.com" e senha "rails123456"
		And eu estou no mural do meu perfil
		And a postagem com titulo "Visibilidade de atributos em JAVA" e o texto "- public: para atributos com visibilidade total - private: para atributos com visibilidade apenas na classe e - protected: para atributos com visibilidade de pacote e heranca" existe
		And eu clico em visualizar o post "Visibilidade de atributos em JAVA"
		When eu clico no botao de editar o post "Visibilidade de atributos em JAVA"
		And eu limpo os campos do titulo e do text
		And eu clico no botao de atualizar post
		Then eu vejo a mensagem de erro "Titulo em branco"
		And eu vejo a mensagem de erro "Texto em branco"

	Scenario: Postando um titulo com menos de 4 caracteres
		Given eu estou logado no meu perfil da rede social com o email "carlosantonio@o-nucleo.com" e senha "rails123456"
		And eu estou no mural do meu perfil
		And eu clico no botao novo post
		When eu preencho o titulo "C" e o texto "C eh uma linguagem de programacao bem antiga, foi dela que derivou-se o JAVA"
		And eu clico no botao de publicar nova postagem
		Then eu vejo a mensagem de erro "Titulo muito curto (deve ser maior que 4 caracteres)"

	Scenario: Postando um video do youtube
		Given eu estou logado no meu perfil da rede social com o email "carlosantonio@o-nucleo.com" e senha "rails123456"
		And eu estou no mural do meu perfil
		And eu clico no botao novo post
		When eu preencho o titulo "Video tutorial: exceptions em Java" e o texto "https://www.youtube.com/watch?v=ld2C4GcAtsg"
		And eu clico na categoria "Youtube"
		And eu clico no botao de publicar nova postagem
		Then eu vejo que o post "Video tutorial: exceptions em Java" possui um player do video "https://www.youtube.com/watch?v=ld2C4GcAtsg"

	Scenario: Postando uma imagem do computador
		Given eu estou logado no meu perfil da rede social com o email "carlosantonio@o-nucleo.com" e senha "rails123456"
		And eu estou no mural do meu perfil
		And eu clico no botao novo post
		When eu preencho o titulo "Erro comum do rails" e o texto "sou descritivo"
		And eu clico no botao de enviar imagem do computador
		And eu seleciono a imagem "erro.png"
		And eu clico no botao de publicar nova postagem
		Then eu vejo que o post "Erro comum do rails" possui a imagem localizada em "erro.png"

	Scenario: Postando arquivos que deveriam ser imagens do computador
		Given eu estou logado no meu perfil da rede social com o email "carlosantonio@o-nucleo.com" e senha "rails123456"
		And eu estou no mural do meu perfil
		And eu clico no botao novo post
		When eu preencho o titulo "Erro comum do rails" e o texto "sou descritivo"
		And eu clico no botao de enviar imagem do computador
		And eu seleciono o arquivo "erro.txt"
		And eu clico no botao de publicar nova postagem
		Then eu vejo a mensagem de erro "Imagem invalida"

	Scenario: Postando mais de um video do youtube
		Given eu estou logado no meu perfil da rede social com o email "carlosantonio@o-nucleo.com" e senha "rails123456"
		And eu estou no mural do meu perfil
		And eu clico no botao novo post
		When eu preencho o titulo "Videos sobre exceptions" e o texto "https://www.youtube.com/watch?v=ld2C4GcAtsg e https://www.youtube.com/watch?v=Xt0CpwJT5yY"
		And eu clico no botao de publicar nova postagem
		Then eu vejo que o post "Videos sobre exceptions" possui dois links "https://www.youtube.com/watch?v=ld2C4GcAtsg" e "https://www.youtube.com/watch?v=Xt0CpwJT5yY"

	Scenario: Visualizando posts de outro usuario
		Given eu estou logado no meu perfil da rede social com o email "carlosantonio@o-nucleo.com" e senha "rails123456"
		And eu estou no perfil do usuario "Carlos Antonio"
		And o mural dele possui o post com titulo "Java eh a melhor linguagem de programacao" e o texto "Java possui inumeras ferramentas, que a tornam a melhor linguagem de programacao"
		When eu clico em visualizar o post "Java eh a melhor linguagem de programacao"
		Then eu vejo uma tela exibindo o titulo "Java eh a melhor linguagem de programacao", texto "Java possui inumeras ferramentas, que a tornam a melhor linguagem de programacao" e comentarios do post

	Scenario: Editar video de um post
		Given eu estou logado no meu perfil da rede social com o email "carlosantonio@o-nucleo.com" e senha "rails123456"
		And eu estou no mural do meu perfil
		And a postagem com titulo "Programacao dinamica" e o video "https://www.youtube.com/watch?v=ZprpEfLCIfk" existe
		And eu clico em visualizar o post "Programacao dinamica"
		When eu clico no botao de editar o post "Programacao dinamica"
		And eu preencho os campos do titulo com "Programacao dinamica (Atualizado)" e o texto com "https://www.youtube.com/watch?v=SJSRKnxu9Ig"
		And eu clico no botao de atualizar post
		Then eu vejo que o post "Programacao dinamica" foi atualizado para o novo titulo "Programacao dinamica (Atualizado)" e o novo video "https://www.youtube.com/watch?v=SJSRKnxu9Ig"

	Scenario: Editando um post com novo titulo invalido
		Given eu estou logado no meu perfil da rede social com o email "carlosantonio@o-nucleo.com" e senha "rails123456"
		And eu estou no mural do meu perfil
		And a postagem com titulo "Visibilidade de atributos em JAVA" e o texto "- public: para atributos com visibilidade total - private: para atributos com visibilidade apenas na classe e - protected: para atributos com visibilidade de pacote e heranca" existe
		And eu clico em visualizar o post "Visibilidade de atributos em JAVA"
		When eu clico no botao de editar o post "Visibilidade de atributos em JAVA"
		And eu preencho o titulo "Jav" e o texto ";;lang=java<br> public class Exemplo{ public int atributo}"
		And eu clico no botao de atualizar post
		Then eu vejo a mensagem de erro "Titulo muito curto (deve ser maior que 4 caracteres)"
