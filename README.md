
<!-- README.md is generated from README.Rmd. Please edit that file -->

# irpfrv

<!-- badges: start -->
<!-- badges: end -->

O objetivo do pacote irpfrv é gerar arquivos importantes para o auxílio
do preenchimento dos dados de renda variável do imposto de renda pessoa
física (IRPF). Ele gera arquivos de discriminação e a situação anual de
cada ativo de renda variável, como ações, fundos de investimento
imobiliário e ETFs.

## Instalação

Você pode instalar a versão em desenvolvimento do irpfrv através do
[GitHub](https://github.com/):

``` r
#install.packages("devtools")
devtools::install.github("lailaviana/irpfrv")
```

## Adquirindo seus dados

1.  Para obter os seus dados de negociação em bolsa de valores, entre no
    site da [B3](https://www.investidor.b3.com.br/) e acesse sua conta.
2.  Ao entrar, clique em **Menu** e logo depois em **Extrato**. No canto
    superior esquerdo, selecionar **Negociação**.
3.  Nessa tela, já haverá as últimas movimentações feitas pelo usuário.
    Porém para baixar os dados, é necessário clicar no canto superior
    direito em **Filtrar** e selecionar a Data Inicial e Data Final que
    quer recuperar. É importante ressaltar que a B3 só disponibiliza a
    visualização no site ou realização do download de um período igual
    ou inferior a 12 meses (por consulta), com data inicial a partir de
    01/11/2019.
4.  Feito isso, clicar em **Filtrar**. Abrirá uma nova página e no
    rodapé terá a opção de **Baixar o Extrato**, seleciona-se então o
    formato **Excel**. Esse é o arquivo necessário para que o pacote
    consiga fazer os cálculos e gere os arquivos auxiliares para o
    preenchimento do IRPF.

## Estrutura do arquivo baixado

A tabela baixada deve conter as seguintes informações:

1.  Coluna 1: Data do Negócio  
2.  Coluna 2: Tipo de Movimentação  
3.  Coluna 3: Mercado  
4.  Coluna 4: Prazo/Vencimento  
5.  Coluna 5: Instituição  
6.  Coluna 6: Código de Negociação  
7.  Coluna 7: Quantidade  
8.  Coluna 8: Preço  
9.  Coluna 9: Valor

## Exemplos de como executar as funções do pacote

Esse é um exemplo básico de como carregar o pacote e realizar as
análises:

``` r
library(irpfrv)
```

### Gerando a análise geral dos seus investimentos

A primeira função disponível é a **analise_geral**. Para executá-la deve
ser fornecido o arquivo obtido pelo site da B3 e a classe do ativo que
deve ser analisado. Existem 3 opções:  
- acoes  
- fiis  
- etfs

Ela retorna o codigo de negociação, o código geral do ativo, o preço
médio, o custo de aquisição, o número/quantidade de cada ativo e o nome
da empresa. Essa função dá uma visão geral dos seus investimentos.

``` r
acoes <- analise_geral("inst/b3_negociacao.xlsx", classe = acoes)
acoes |> head(5)
#> # A tibble: 5 x 6
#>   codigo_de_negociacao codigo preco_medio custo_aquisicao numero_ativos empresa 
#>   <chr>                <chr>        <dbl>           <dbl>         <dbl> <chr>   
#> 1 BBAS3F               BBAS3        32.3            323.             10 BCO BRA~
#> 2 BBSE3F               BBSE3        24.8            594.             24 BB SEGU~
#> 3 BIDI4F               BIDI4        16.8            219.             13 BANCO I~
#> 4 CASH3F               CASH3        21.9             87.6             4 MÉLIUZ ~
#> 5 CIEL3F               CIEL3         4.26             0               0 CIELO S~
```

A mesma função agora sendo executada filtrando pela classe de fiis. O
output gerado é bem semelhante ao de ações, com a única diferença de que
é fornecido o nome do fundo e também o seu administrador.

``` r
fiis <- analise_geral("inst/b3_negociacao.xlsx", classe = fiis)
fiis |> head(5)
#> # A tibble: 5 x 7
#>   codigo_de_negociacao codigo preco_medio custo_aquisicao numero_ativos nome    
#>   <chr>                <chr>        <dbl>           <dbl>         <dbl> <chr>   
#> 1 HGRU11               HGRU11       118.             236.             2 CSHG Re~
#> 2 HSML11               HSML11        88.4            265.             3 HSI Mal~
#> 3 TGAR11               TGAR11       122.             245.             2 TG Ativ~
#> 4 VGIR11               VGIR11        80.1            240.             3 Valora ~
#> 5 VILG11               VILG11       119.             357.             3 Vinci L~
#> # ... with 1 more variable: administrador <chr>
```

No caso de não haver nenhum ativo de certa classe, ele retorna uma
tibble vazia, como abaixo.

``` r
etfs <- analise_geral("inst/b3_negociacao.xlsx", classe = etfs)
etfs
#> # A tibble: 0 x 6
#> # ... with 6 variables: codigo_de_negociacao <chr>, codigo <chr>,
#> #   preco_medio <dbl>, custo_aquisicao <dbl>, numero_ativos <dbl>, nome <chr>
```

### Gerando a discriminação de cada ativo

As próximas funções que serão abordadas, geram um texto que pode ser
copiado e colado na parte de discriminação de cada ativo. Para
executá-la será preciso fornecer o output da função anterior. Sendo
assim para ações deve ser executado o seguinte comando:

``` r
discriminacao_acoes(acoes) |> head(2)
#> [1] "10 ACOES DA EMPRESA BCO BRASIL S.A. NEGOCIADAS NA B3 COM O CODIGO BBAS3F, ADQUIRIDAS PELO VALOR TOTAL DE R$ 322.88 AO PRECO MEDIO DE R$ 32.29"                 
#> [2] "24 ACOES DA EMPRESA BB SEGURIDADE PARTICIPAÇÕES S.A. NEGOCIADAS NA B3 COM O CODIGO BBSE3F, ADQUIRIDAS PELO VALOR TOTAL DE R$ 594.26 AO PRECO MEDIO DE R$ 24.76"
```

Para gerar a discriminação dos fiis:

``` r
discriminacao_fiis(fiis) |> head(2)
#> [1] "2 COTA(S) DO FUNDO IMOBILIARIO CSHG Renda Urbana, NEGOCIADAS NA B3 COM O CODIGO HGRU11, ADMINISTRADO POR CREDIT SUISSE ADQUIRIDAS PELO VALOR TOTAL DE 236.38 AO PRECO MEDIO DE 118.19"
#> [2] "3 COTA(S) DO FUNDO IMOBILIARIO HSI Malls, NEGOCIADAS NA B3 COM O CODIGO HSML11, ADMINISTRADO POR SANTANDER CACEIS ADQUIRIDAS PELO VALOR TOTAL DE 265.1 AO PRECO MEDIO DE 88.37"
```

### Gerando a situação anual de cada ativo

A função recebe o arquivo gerado pela B3 e te retorna um dataframe
mostrando ano a ano a situação daquele ativo no dia 31/12. Para a sua
declaração basta copiar e colar os valores gerados.

``` r
situacao <- situacao("inst/b3_negociacao.xlsx")
situacao |> head(4)
#> # A tibble: 4 x 3
#> # Groups:   codigo_de_negociacao [2]
#>   codigo_de_negociacao   ano cumulativo_ano
#>   <chr>                <dbl>          <dbl>
#> 1 BBAS3F                2020           247.
#> 2 BBAS3F                2021           320.
#> 3 BBSE3F                2020           319.
#> 4 BBSE3F                2021           586.
```
