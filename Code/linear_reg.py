import numpy as np
from sklearn.linear_model import LinearRegression

def linear_reg(v1, v2):
  v1 = np.array(v1).reshape((-1, 1))
  v2 = np.array(v2)
  model = LinearRegression().fit(v1, v2)
  a = float(model.intercept_) #coef linear
  b = float(model.coef_) #coef angular
  return(a, b)
