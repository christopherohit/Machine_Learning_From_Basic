from itertools import tee
from pathlib import Path
import pandas as pd
from sklearn.compose import ColumnTransformer
from sklearn.ensemble import RandomForestClassifier
from sklearn.impute import KNNImputer , SimpleImputer
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import OneHotEncoder, RobustScaler
import numpy as np


def pipeline():
    
    data_dir = Path("D:\Lesson\Data Set\titannic")
    data_dir.head()
    df_train_full = pd.read_csv(data_dir + "\traintitanic.csv")
    df_test = pd.read_csv(data_dir + "\test.csv")
    df_train_full.drop(columns=["Cabin"])
    df_test.drop(columns=["Cabin"]);
    df_train , df_val = train_test_split(df_train_full, test_size=0.1)
    X_train = df_train.copy()
    Y_train = X_train.pop("Survived")
    X_val = df_val.copy()
    Y_val = X_val.pop("Survived")


#  DataClean():
    cat_cols = ["Embarked", "Sex", "Pclass"]
    cat_transformer = Pipeline(
        steps=[
            ("imputer", SimpleImputer(strategy="most_frequent")),
            ("onehot", OneHotEncoder(handle_unknown="ignore", sparse= False)),
        ]
    )


#   DataProcessing():
    num_cols = ["Age", "Fare"]
    num_transformer = Pipeline(
        steps=[("imputer", KNNImputer(n_neighbors=5)),
        ("Scaler", RobustScaler)]
    )

    