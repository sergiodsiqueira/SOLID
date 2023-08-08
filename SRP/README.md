# SOLID
## (S)RP
O Princípio da Responsabilidade Única (SRP) é um princípio de design de software que afirma que cada classe deve ser responsável por uma única tarefa.
Isso significa que uma classe não deve ser responsável por mais de uma coisa, como acessar dados, processar dados e exibir dados.
Seguir o SRP pode ajudar a tornar o código mais modular, fácil de entender e de manutenção.
Aqui estão alguns benefícios de seguir o SRP:

* Código mais modular: O SRP pode ajudar a tornar o código mais modular, o que significa que pode ser dividido em partes menores e mais gerenciáveis. Isso pode facilitar a compreensão do código e a sua manutenção.
* Código mais fácil de entender: O SRP pode ajudar a tornar o código mais fácil de entender, pois cada classe é responsável por uma única tarefa. Isso pode facilitar para os desenvolvedores encontrarem a informação que estão procurando e entender como o código funciona.
* Código mais fácil de manter: O SRP pode ajudar a tornar o código mais fácil de manter, pois cada classe é responsável por uma única tarefa. Isso significa que, se houver uma mudança necessária no código, ela pode ser feita de forma mais fácil e sem afetar outras partes do código.

### Estudo de Caso
Imaginemos que precisamos autenticar um usuário em um sistema. Como poderíamos fazer isso?
Talvez a solução mais simples seja imaginar uma classe `TUsuario` com as propriedades necessárias e um método `Logar` ou algo do tipo.
Mas vamos tentar descrever essa classe. Como faríamos isso? <br>
Por exemplo, a classe `TUsuario` é uma classe que contém os dados do usuário e, além disso, é responsável por fazer o login do usuário no sistema.<br>
Ops! Na descrição acima, o "além disso" é um problema, porque infringe o Princípio da Responsabilidade Única (SRP). Lembre-se de que cada classe deve ser responsável por uma única tarefa.
OK, mas para solucionar isso, então vamos escrever mais código? Sim, porém isso tornará nosso código mais modular, mais simples de entender e mais fácil de manter.

### Solução proposta
Agora imagine criar uma classe para os dados do usuário `TUser` que somente é responsável por transitar pelo sistema essa entidade. Outra classe TLogin que simplesmente faz o login e pronto e outra classe `TAPIService` que faz as requisições para uma URL. <br>
Conseguiu imaginar agora que cada classe tem uma responsabilidade bem clara (já ouviu falar de coesão?) e, além disso, ganhamos poderes extras, porque?<br>
Separando a classe `TLogin` da classe `TAPIService`, podemos consumir através dessa qualquer API.
