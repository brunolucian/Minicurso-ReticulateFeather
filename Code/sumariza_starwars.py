import pandas as pd
import feather

starwars = pd.read_csv("Dados/starwars.csv")
sumarizacoes = starwars.groupby("gender").mean().reset_index()

sumarizacoes.to_feather("Dados/sumarizado.feather")