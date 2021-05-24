from numpy.lib.arraypad import pad
from sklearn.model_selection import train_test_split
import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score
import joblib

data = pd.read_csv('music.csv')
x = data.drop(columns=['genre'])
y = data['genre']
x_train , x_test , y_train , y_test = train_test_split(x,y, test_size=0.20)

model = DecisionTreeClassifier()
model.fit(x_train,y_train)
predicts = model.predict(x_test)

#Save Model to file
joblib.dump(model, 'Decision-Basic-20-Data.joblib')

#Load Model Was save
joblib.load('Decision-Basic-20-Data.joblib')
predicts = model.predict([[21 , 1]])

score = accuracy_score(y_test, predicts)
print(score)