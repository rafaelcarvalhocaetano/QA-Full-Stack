# Instalação

Guia de referência para os matchers

Um matcher no RSpec é um objeto que serve para verificar o comportamento esperado no nosso teste. Ele é usado para montar uma expectation do RSpec de dois modos diferentes:

expect(actual).to matcher(expected)
expect(actual).to_not matcher(expected)
Um exemplo para cada um dos modos de expectation pode ser:

expect(1).to eq(1)
expect(1).to_not eq(2)
Como mencionado na seção anterior, o RSpec vem com muitos built-in matchers para nos ajudar a escrever testes expressivos. Vamos dar uma olhada neles, começando pelos mais básicos, os "be matchers".

Matchers relacionados a truthy e falsy

Os be matchers servem para você testar se um objeto é avaliado como true ou false. Você pode usá-los do seguinte modo:

# passa se obj é truthy (não nil ou não false)
expect(obj).to be_true  
# passa se obj é falsy (nil ou false)
expect(obj).to be_false
# passa se obj é nil
expect(obj).to be_nil
# passa se obj é truthy (não nil e não false)
expect(obj).to be
Os matchers de equidade

Os equality matchers servem para verificar se um objeto é igual a outro objeto. Existe mais de um matcher para esse tipo de verificação porque no Ruby existe mais de um modo de checar a equidade entre dois objetos, que são os seguintes:

expect(a).to equal(b) # passa se a.equal?(b)
expect(a).to be(b)    # passa se a.equal?(b)
expect(a).to eql(b)   # passa se a.eql?(b)
expect(a).to eq(b)    # passa se a == b
Matchers relacionados a arrays

O RSpec nos oferece alguns matchers específicos para verificação de arrays. O primeiro é o MatchArray. Esse matcher é usado para verificar se um array é "igual" a outro, independente da ordem dos seus elementos. Segue um exemplo de uso desse matcher:

array = [1, 2, 3, 4]

expect(array).to match_array([1, 2, 3, 4])
expect(array).to match_array([4, 3, 2, 1])

expect(array).not_to match_array([1, 2, 3])
expect(array).not_to match_array([1, 2, 3, 4, 5])
Outro matcher relacionado à verificação de arrays é o Include Matcher. Você pode usá-lo para verificar a relação de pertinência entre um ou mais elementos e um determinado array. Segue um exemplo de uso:

array = [1, 2, 3, 4]

expect(array).to include(1)
expect(array).to include(1, 2, 3)
expect(array).to include(1, 2, 3, 4)

expect(array).not_to include(0)
expect(array).not_to include(5)
expect(array).not_to include(5, 6, 7, 8)
expect(array).not_to include([1, 2, 3, 4])
Por fim, existem também os matchers start_with e end_with que servem para verificar se um array começa ou termina com uma sequência de elementos. Segue um exemplo de uso desses array = [1, 2, 3, 4]:

array = [1, 2, 3, 4]

expect(array).to start_with(1)
expect(array).to start_with(1, 2)
expect(array).not_to start_with(2)

expect(array).to end_with(4)
expect(array).to end_with(3, 4)
expect(array).not_to end_with(3)
Matchers relacionados a strings

O RSpec oferece alguns matchers relacionados a strings, sendo que alguns deles são os mesmos usados para verificar arrays. Vamos começar olhando o Match Matcher, que serve para verificar o valor de uma string de acordo com uma expressão regular:

string = "qa ninja"

expect(string).to match(/qa/)
expect(string).to match(/inja/)

expect(string).not_to match(/ka/)
expect(string).not_to match(/qaninja/)
Agora seguem exemplos dos matchers usados por strings e arrays, começando pelo include:

string = "qa ninja"

expect(string).to include("q")
expect(string).to include("qa")
expect(string).to include("qa", "ninja")

expect(string).not_to include("ka")
expect(string).not_to include("ninjas")
Por fim, você também pode usar os matchers start_with e end_with com strings:

string = "qa ninja"

expect(string).to start_with("qa")
expect(string).not_to start_with("ninja")

expect(string).to end_with("ninja")
expect(string).not_to end_with("qa")

#----------------------------------------------------------------------------------------------------------#
Estória de Usuário


Qualidade de Software começa na especificação

Você foi contratado para trabalhar no Ninja Bank (uma nova startup que vai concorrer com a nuBank #SQN)

O diferencial desta startup é que ela terá uma rede própria de atendimento por caixas eletrônicos.

Seu PO, Analista de Negócio ou Cliente envia para voce^ um email solicitando e explicando como funciona o saque do banco:

Veja a seguinte estória de usuário:

Estória: Saque no Caixa Eletrônico

    Sendo um cliente que é correntista do Ninja Bank

    Posso sacar dinheiro

    Para que eu consiga comprar em lugares que não aceitam débito ou crédito. (mesmo estando no século 21 hahaha)



Existem 3 pontos chaves que sa~o fundamentais nas estórias de usuário, sa~o eles:

Quem? Para quem estamos desenvolvendo a funcionalidade.
O que? Uma descric¸ão resumida da funcionalidade em si.
Por que? O motivo pelo qual o cliente precisa desta funcionalidade. Se possível citando o ganho de negócio.
Normalmente para responder as três perguntas citadas acima nós usamos o SENDO... POSSO... PARA QUE... 



Beleza, mas como testar?

Para isto podemos usar a técnica do BDD (Behavior Driven Development) de Dan North, onde as palavras chave Dado que... Quando... Então... nos apoiam na criac¸ão de ricos cenários de teste. 

Vejam os exemplos abaixo:



    Cenário: Saque em conta corrente

        Dado que eu tenho R$ 1000 em minha conta corrente

        Quando faço um saque de R$ 200

        Então meu saldo final deve ser R$ 800

Repare que no cenário anterior nós usamos o “Dado que” para indicar o cenário atual, o “quando” para indicar a ac¸ão do usuário, e o “Então” para indicar como o software vai reagir.

Podemos também usar o “E” e o “MAS” para criar cenários de teste ainda mais ricos. 

    Cenário: Deu ruim não tenho saldo

        Dado que eu tenho R$ 0 em minha conta corrente

        Quando faço um saque de R$ 100

        Então vejo a mensagem "Saldo insuficiente para saque :("

        E meu saldo final deve ser R$ 0



    Cenário: Tenho saldo mas não o suficiente

        Dado que eu tenho R$ 500 em minha conta corrente

        Quando faço um saque de R$ 501

        Então vejo a mensagem "Saldo insuficiente para saque :("

        E meu saldo final deve ser R$ 500



    Cenário: Limite por saque :(

        Dado que eu tenho R$ 1000 em minha conta corrente

        Quando faço um saque de R$ 701

        Então vejo a mensagem "Limite máximo por saque é de R$ 700"

        E meu saldo final deve ser R$ 1000



Importante: Voce^ não precisa escrever os critérios de aceitação exatamente desta forma. Mas e interessante que voce^ registre de alguma forma os testes que devem ser realizados para que a user story possa ser bem testada.

No´s da QA Ninja gostamos muito de usar o “Dado que”, “quando”, “então”, mas fica a seu critério.

Próxima aula: Tangibilizando o produto - Desenvolvimento guiado por Comportamento


###################################################################################################

Vamos criar um Projeto do ZERO
Você foi contratado para trabalhar no Projeto Enjoeat, um projeto de Desenvolvimento ágil. E vamos trabalhar juntos para desenvolver uma WebApp parecida com o iFood.



Vamos começar criando um novo diretório e um projeto Ruby vazio.

mkdir enjoeat
cd enjoeat
Crie um Gemfilecom o seguinte conteúdo:

source "https://rubygems.org"

group :test do
  gem 'capybara', '3.14'
  gem 'cucumber', '3.1.2'
  gem 'rspec', '3.7.0'
  gem 'selenium-webdriver', '3.141'
end
Instale todas as dependências e crie um projeto Cucumber:

bundle install
cucumber --init
Dentro da pasta features, crie um arquivo chamado restaurantes.feature e dentro dele, escreva a seguinte especificação:


#language: pt

Funcionalidade: Restaurantes    
    Para que eu possa saber quais os restaurantes disponíveis com o tempo de entrega e nota de avaliação
    Sendo um usuário que deseja pedir comida
    Posso acessar a lista de restaurantes

    Cenario: Todos os restaurantes

        Quando acesso a lista de restaurantes
        Então vejo todas as opções disponíveis

    Cenario: Categorias

        Quando acesso a lista de restaurantes
        Então cada restaurante deve exibir sua categoria

    Cenario: Tempo de entrega

        Quando acesso a lista de restaurantes
        Então cada restaurante deve exibir o tempo de entrega

    Cenario: Nota de avaliação

        Quando acesso a lista de restaurantes
        Então cada restaurante deve exibir sua nota de avaliação
Como ficou?

A linha três deste arquivo começa com a palavra-chave Funcionalidade: seguida pelo nome "Restaurantes". É uma boa prática usar um nome semelhante ao nome do arquivo.

A segunda linha é uma breve descrição do recurso, em nosso caso a estória do usuário. O Cucumber não executa essa linha, pois é apenas a documentação.

Na sequencia temos os  cenários, que são exemplos concretos que ilustram como a aplicação deverá se comportar.

Por fim temos os steps Quando e Então que são os passos do nosso cenário. Isto é o que Cucumber irá executar.

Quando fazemos o Desenvolvimento Orientado por Comportamento com o Cucumber, usamos exemplos concretos para especificar o que queremos que o software faça. Os cenários são gravados antes do código de produção. Eles começam sua vida como uma especificação executável . À medida que o código de produção surge, os cenários assumem um papel como documentação viva e testes automatizados .

Pronto, agora podemos começar a trabalhar com especificação e automação para projetos ágeis.

# QA-Full-Stack

Ruby para Testadores - Testes Unitários - Cucumber e BDD - Conhecendo o Capybara - Cucumber e BDD para WebApps - Automação Web Ninja - Page Object

CMD:

### Comando para Gerar Relatórios em HTML e XML

- ``` rspec --formt html --out report.html ```
- ``` rspec --form RspecJunitFormatter --out report.xml ```

### Criando cenário de teste com Cucumber

