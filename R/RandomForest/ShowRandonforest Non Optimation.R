library(tidyverse)

my_theme <- function(base_size =5, base_family = "sans"){
  theme_bw(base_size = base_size, base_family = base_family) +
    theme(
      panel.grid.major = element_line(color = "gray"),
      panel.grid.minor = element_blank(),
      panel.background = element_rect(fill = NA),
      strip.background = element_rect(fill = "#001d60", color = "#00113a", size =0.5),
      strip.text = element_text(face = "bold", size = 5, color = "white"),
      legend.position = "bottom",
      legend.justification = "center",
      legend.background = element_blank()
    )
}


theme_set(my_theme())


theme_bare <- function(base_size=8,base_family="sans"){theme_bw(base_size = base_size, base_family = base_family)+
    theme(
      axis.line = element_blank(), 
      axis.text.x = element_blank(), 
      axis.text.y = element_blank(),
      axis.ticks = element_blank(), 
      axis.title.x = element_blank(), 
      axis.title.y = element_blank(), 
      legend.position = "bottom", 
      panel.background = element_rect(fill = NA), 
      panel.border = element_blank(), 
      panel.grid.major = element_blank(), 
      panel.grid.minor = element_blank(), 
      plot.margin = unit(c(0,0,0,0), "lines")
    )
}

df=read.csv("http://vincentarelbundock.github.io/Rdatasets/csv/MASS/biopsy.csv")%>%as_tibble()%>%.[,c(3:12)]%>%na.omit()

names(df)=c("clumpthickness",
            "SizeUniformity",
            "ShapeUniformity",
            "Margin_adhesion",
            "EpiCellSize",
            "Barenuclei",
            "BlandChromatin",
            "NormalNucleoli",
            "Mitoses",
            "Class"
)

library(caret)

set.seed(1234)
idtest=caret::createDataPartition(y=df$Class, p=99/683,list=FALSE)

trainset=df[-idtest,]
testset=df[idtest,]

library(randomForest)


rfmod=randomForest(Class~.,
                   data=trainset,
                   ntree=500,
                   mtry=sqrt(9),
                   replace=TRUE,
                   localImp=TRUE
)

rfmod
