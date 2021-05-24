library(tidyverse)

require(foreign)
df = read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/00277/ThoraricSurgery.arff")

name(df) = c("Chuẩn Đoán", "Dung_tích_thở",
             "Thê_tích_thở"
             ,"Zuborg", "Chỉ số đau", "Ho ra Máu", "Khó thở", "Ho", "Cơ thể yếu"
             ,"Giai đoạn khối u", "Phân suất tống máu", "Nhồi máu cơ tim",
             "bệnh động mạch ngoại vi", "Sử dụng thuốc lá", "Bệnh hen xuyễn"
             ,"Tuổi tác", "Sự sống còn")
#Set Label
df$Survival = df$Survival%>%recode_factor(.,'F' = "Die" , 'T' = "Survived")

df$Benh_Phoi = df$Thê_tích_thở/df$Dung_tích_thở

library(caret)

set.seed(123)