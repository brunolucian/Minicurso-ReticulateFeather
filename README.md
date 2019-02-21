# Minicurso-ReticulateFeather
## Minicurso: Integrando R e Python: Usando reticulate e feather.

Projeto para organização para o minicurso no IV SER

Nesse minicurso temos a intenção de abordar a integração entre o R e Python em um fluxo de análise rotineiro, vamos utilizar dos pacotes reticulate e feather para facilitar essa integração. 
Vamos mostrar uma análise descritiva em cima do conjunto de dados de e-commerce brasileiro, que pode ser encontrado no kaggle.

-	Reticulate: O pacote permite reticular o código Python em R, criando um novo tipo de projeto que entrelaça os dois idiomas.
    -	O pacote reticulate fornece um conjunto de ferramentas para interoperabilidade entre o Python e o R.
    -	R Markdown, sourcing de scripts Python, importando módulos Python e usando Python interativamente dentro de uma sessão do R.
    -	Tradução entre objetos R e Python.
-	Feather: A Fast On-Disk Format for Data Frames for R and Python
    -	Feather é um formato de arquivo binário rápido, leve e fácil de usar para armazenar dataframes.
    -	 API leve e minimalista: tornar a entrada e saída de dataframes o mais simples possível
    -	Independentemente da linguagem: os arquivos do Feather são os mesmos, quer sejam escritos por código Python ou R. Outras linguagens podem ler e escrever arquivos Feather também.
    -	Alto desempenho de leitura e gravação. Quando possível, as operações de difusão devem estar vinculadas ao desempenho do disco local.

## Database

Os dados foram disponibilizados pelo [olist](https://olist.com/#), site que permite que pequenos e médios vendedores sejam colocados em alguns dos principais marketplaces brasileiros. 

### Relações entre as tabelas

![](img/relacoes_tabelas.png)

## Links:

https://www.kaggle.com/olistbr/brazilian-ecommerce

https://rstudio.github.io/reticulate/index.html

https://blog.rstudio.com/2016/03/29/feather/

