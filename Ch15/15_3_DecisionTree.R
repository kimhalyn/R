#날짜 : 2021/01/27
#이름 : 김하린
#내용 : Ch15.지도학습 - 결정트리 분석 실습 교재 p499

install.packages('party')
library(party)


View(iris)

#formula 생성
formula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width 
formula

#결정트리 모델 생성
tree_iris <- ctree(formula, data=iris)
tree_iris

#시각화
plot(tree_iris)
plot(tree_iris, type='simple')


#결정트리 모델 검정
df_sample = read.csv('./file/sample_iris.csv')
View(df_sample)

pre_result <- predict(tree_iris, df_sample)
pre_result