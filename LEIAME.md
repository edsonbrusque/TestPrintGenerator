# TestPrintGenerator

Um gerador de arquivos GCODE para testes de impressoras 3D printers, filamentos and coisas relacionadas

Edson Brusque - September 2020


# O que é isso?

Isso é um software de linha de comando escrito em C simples que gera arquivos GCODE para testar vários recursos de impressoras 3D.

GCODE são comandos (como mover, extrusar, alterar temperatura etc) que as impressoras 3D executam em ordem sequencial.

Este software gera um arquivo, baseado em parâmetros fornecidos pelo usuário, que pode ser executado em uma máquina para fazer "torres de temperatura" (para encontrar a temperatura de extrusão ideal), "testes de stringing" (para encontrar as melhores configurações de retração) e outras coisas nerd.


# Como posso usar?

Primeiro você define a forma geral do objeto que deseja imprimir no arquivo "pattern.txt".

Em seguida, você define os parâmetros de sua impressora e seu objeto no arquivo "config.txt".

Por fim, basta rodar o arquivo executável "TestPrint.exe".

Um arquivo "TestPrint.gcode" será criado. Você pode colocar este arquivo em um cartão SD ou usar qualquer outro método para enviá-lo para sua impressora 3D e gerar o objeto de teste.


# Há algum arquivo de exemplo?

Claro. Você pode encontrar arquivos de exemplo pattern.txt e config.txt nas sub-pastas. Há torres de temperatura, testes de retração, teste de velocidade...


# Como posso modificar o arquivo config.txt para atender às minhas necessidades?

Basta abrir e alterá-los de acordo com sua necessidade ou gosto. A maioria dos parâmetros são autoexplicativos.

Alguns parâmetros, como filamentDiameter e bedTemperature são estáticos. Isto significa que seus valores serão os mesmos durante toda a impressão do objeto.

Outros parâmetros são variáveis durante o tempo de impressão e é aqui onde a diversão acontece. Você pode definir, por exemplo:

layerHeight 0.20
layerHeightStart 0.10
layerHeightFinish 0.40

Isto significa que ao iniciar a impressão, o valor de layerHeight (0.20 mm) será utilizado para gerar a primeira camada. A seguir, a impressora fará a impressão variando linearmente a altura das camadas de layerHeightStart (0.10 mm) para a segunda camada até layerHeightFinish (0.40 mm) para a última. Desta forma, você pode analisar a diferença de qualidade que diferentes alturas de camada podem gerar.

Você pode fazer isso para vários outros parâmetros como temperatura do hotend, velocidade da impressão, comprimento da retração etc.


# O que significam os números no arquivo pattern.txt?

Eles são os pontos que definem o padrão (a forma ou perfil) do objeto gerado.

Por exemplo, se você deseja gerar um tubo quadrado, pode usar algo como:

 90.0  90.0 1
 90.0 110.0 1
110.0 110.0 1
110.0  90.0 1

Cada linha define um ponto. Bem, mais ou menos. Já voltaremos a essa questão.

A primeira coluna é a coordenada X. A segunda coluna é a coordenada Y.

A terceira coluna informa ao gerador se um movimento até este ponto é uma "extrusão" (uma impressão) ou um "deslocamento" (um movimento sem qualquer extrusão).

Portanto, cada linha do arquivo define um ponto. Mas também, em certo sentido, define uma linha. Sim, eu sei que parece um pouco confuso, mas vamos usar outro exemplo:

 90.0  90.0 1
 90.0 110.0 1
110.0 110.0 1
110.0  90.0 0

Neste caso, ainda estamos definindo quatro pontos. Mas estamos definindo apena três linhas. Portanto, nosso objeto terá três lados. Esse tipo de objeto é útil para testar retrações ou velocidades de deslocamento, por exemplo.


# Parece bom, mas posso alterar o código de fonte?

Claro que sim!!! Isso é código livre. Use e abuse.


# Como compilar no Windows?

No Windows, provavelmente, a maneira mais fácil é usar DEV-C++ (https://sourceforge.net/projects/orwelldevcpp/).

Abra "main.c".
Vá para Ferramentas -> Opções do Compilador.
Clique em "Adicionar os seguintes comandos ao chamar o compilador:".
Adicione "std=c99" da caixa de texto correspondente e clique em OK.
Clique em [F11] e o programa deve compilar e executar.

Como foi evitado usar recursos avançados, deve compilar sem problemas na maioria dos ambientes e compiladores.


# Como compilar no Linux?

Basta executar "gcc main.c -lm -o TestPrint.exe" no terminal na mesma pasta do arquivo "main.c"

Se você tiver problemas para compilar, provavelmente não o compilador gcc não está instalado. Normalmente, apenas executar "sudo apt install gcc" no terminal resolve o problema.


# Este código é estúpido. Porque?

Preguiça, ignorância e falta de tempo. Não necessariamente nesta ordem.

Mas ei! Você está convidado a contribuir. Vamos torná-lo melhor!

Porém, um ponto em minha defesa: como espero que este código seja visto (e quem sabe contribuído) por pessoas que não são programadores C no dia-a-dia, eu preferi sacrificar elegância por simplicidade. Prefiro código fácil de entender a código compacto, mesmo ciente de nem sempre conseguir esse resultado.


# Por que você escreve seus comentários em inglês? Seu inglês é horrível!

Novamente, porque acredito que este código é útil e quero que pessoas de todo o mundo usem, entendam e contribuam.

Mas pretendo ao menos manter esta versão em português do README.md.


# O brim é uma droga. Não pode fazer melhor?

É, eu sei. :(

É aqui que entra a parte da ignorância e falta de tempo. A forma como o brim é gerado funciona bem apenas para perfis muito simples como um quadrado. Mas em geral ele serve bem para a sua função de manter o objeto no lugar.

Se você tem ideia de como fazer um gerador de brim melhor. Por favor me fale.


# O que mais falta fazer?

Além de um gerador de brim melhor, um gerador de 'bases' (no lugar do brim) poderia ser uma boa opção para peças mais complexas. Essa é provavelmente a próxima coisa a implementar.

Novamente, se você tiver alguma ideia, me avise.


# Obrigado!

De nada. :)
