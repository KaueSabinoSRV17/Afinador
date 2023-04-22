# Afinador

Um Afinador de Instrumentos de Cordas, feito em Flutter.

## Plataformas

A idéia é, primariamente, funcionar como um aplicativo Desktop. Já existem 
várias soluções mobile, e também web para quem está em Desktop, mas acho que
é mais natural ter esse tipo de programa como um app nativo do sistema.

## Como funciona

Notas musicais podem ser medidas em Hertz. Com a Biblioteca Microphone, do Flutter, é possível escutar áudio 
pelo microfone do aparelho e ver este valor em Hertz.

A partir disso, precisamos usar a Matemática para chegar na nota em relação aos Hertz vindos do Microfone.

### Equação

Esta conta é feita na Classe `Musical Note`, do arquivo `note_model.dart`.

Ela consiste no seguinte: 

    numero da nota = 12 x log2 ( frequência em hertz / frequência de A4 que é 440 ) + número base de A4 que é 69. Após chegar no resultado, arredondar.
    
    se dividirmos este número por 12, e pegarmos o seu resto, teremos o número da nota, que sempre estará entre C (Dó) e B (Si).


## Contribuir

No Momento, não há dependências neste projeto, basta ter o Flutter, e de preferência ter o mesmo pronto para
desenvolver para Desktop ou Mobile.