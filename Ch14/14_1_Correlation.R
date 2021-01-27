#날짜 : 2021/01/27
#이름 : 김하린
#내용 : Ch14.요인분석과 상관관계 분석 - 상관관계 분석 실습 교재 p466

install.packages('corrplot')
install.packages('corrgram')

library(corrplot)
library(corrgram)

#####################################
#붓꽃 데이터 상관분석
data(iris)
View(iris)

#상관계수 확인
cor(iris$Sepal.Length, iris$Sepal.Width) 
cor(iris$Sepal.Length, iris$Petal.Width) 
cor(iris$Petal.Length, iris$Petal.Width)

#상관행렬
iris[,1:4]
corr_iris <- cor(iris[,1:4], method = 'pearson')

#시각화
pairs(iris[,1:4])
corrplot(corr_iris)
corrplot(corr_iris, type = 'lower')
corrplot(corr_iris, type = 'lower', method = 'color')
corrplot(corr_iris, type = 'lower', method = 'number')
corrplot(corr_iris, method = 'number')
