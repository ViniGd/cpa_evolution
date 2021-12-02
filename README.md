<h1 align="center">Fogo no Parquinho</h1>
<h3 align="center">Trabalho da matéria Linguagens de Programação 1 - 2° Semestre de 2021</h3>
<hr>
<h4 align="center">Front-End desenvolvido por: </h4>
<h5 align="center">Pedro Henrique Ferreira Dominichelli Fabris</h5>
<h5 align="center">Vinicius Abe de Godoy</h5>
<hr>
<h4 align="center">Back-End desenvolvido por: </h4>
<h5 align="center">Julia Fernandes Santana</h5>
<h5 align="center">Pedro Henrique Soares Pinheiro</h5>
<h6 align="center"> <a href="https://github.com/julyca/fogo-no-parquinho-backend">GitHub do Back-End</a> </h6>

<hr>
<h3>Escopo do projeto</h3>
<p>
Este projeto foi desenvolvido como um trabalho para a matéria Linguagens de programação 1(anual), lecionada pelo professor Murilo Zanini de Carvalho. Neste projeto realizamos a construção de um site focado em ser uma rede social de reviews, onde os usuarios podem avaliar as matérias e professores de uma universidade qualquer. O Front-end foi desenvolvido em Flutter/Dart e o Back-end foi desenvolvido em Kotlin. O site foi feito para ser responsivo em dispositivos com uma largura mínima de 500px.
</p>
<h3>O site conta com 7 seções, que são:</h3> 
<ul>
  <li>Landing page</li> 
  <li>página de login</li> 
  <li>página de cadastro</li>
  <li>página de matérias</li>
  <li>página dinamica de avaliações de matérias</li>
  <li>página de professores</li>
  <li>página dinamica de avaliações de professores</li>
 
</ul>
<hr>
<h3>Telas do aplicativo</h3>
<h4>Sketch em Adobe Xd</h4>
<img src="https://media3.giphy.com/media/7GkkvHlzNWfdPdqj6O/giphy.gif?cid=790b7611090028a877ace59c945298de7e636448ddf11c53&rid=giphy.gif&ct=g">
<h4>Versão final</h4>
<img src="https://media0.giphy.com/media/1PQFZnkFK2Zy3Kskcm/giphy.gif?cid=790b76117d65232100af6857b14253d443d68487224a73cc&rid=giphy.gif&ct=g">
<hr>

<h3>Video de apresentação do projeto:</h3>



https://youtu.be/u8B3CUmO9ug
<hr>

<h3> Briefing de principais widgets</h3>

<h4>Menu()</h4>
<p>Widget que realiza a gestão da navegação de páginas utilizando como base para isso a biblioteca material.dart.</p>

<h4>Resumo()</h4>
<p>Widget que apresenta na tela o nome de uma matéria ou professor, com base na lista obtida na chamada de api.</p>

<h4>Avaliacao()</h4>
<p>Widget que apresenta na tela o nome de do avaliador, pontuação dada na review e o texto da avaliação, com base na lista obtida na chamada de api.</p>


<hr>

<h3> Briefing de principais funções</h3>

<h4>login()</h4>
<p>Esta função realiza uma chamada post para a API, enviando o usuario e a senha criptografada, após isso se for bem sucedido ela armazena o token de retorno, chama a função pop_up() para avisar do sucesso e redireciona para a landing page. Caso contrário ela chama a função pop_up() avisando de erro no login.</p>

<h4>cadastro()</h4>
<p>Esta função recebe as strings, usuario,senha,r.a,role,email, e envia uma chamada post para a API, se for sucedido o cadastro, é chamado a função pop_up, avisando que foi bem sucedido e ocorre o redirecionamento para a página login.</p>

<h4>pop_up()</h4>
<p>Esta função recebe uma string, e ativa o widget toast na tela, apresentando a string inserida na função como uma mensagem.</p>

<h4>pegar_materia()&pegar_professores()</h4>
<p>Estas duas funções realizam uma chamada na API, que retorna todas as matérias/professores existentes, e realiza a inserção delas em uma lista que é lida por listview.builder para gerar a página em questão.</p>

<h4>pegar_aval_materias()&pegar_aval_professores()</h4>
<p>Assim como as funções acima, estas duas realizam uma chamada na API para pegar todas as avaliações de determinado professor ou matéria para serem buildadas por um listview.builder para gerar a página em questão.</p>

<h4>postar_aval</h4>
<p>Esta função realiza uma chamada post na API, enviando o token ativo, a avaliação, o score, e a o que/quem a avaliação se refere.</p>

<hr>


