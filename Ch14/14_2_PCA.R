#날짜 : 2021/01/27
#이름 : 김하린
#내용 : Ch14.요인분석과 상관관계 분석 - 요인분석(주성분 분석) 분석 실습 교재 p449

install.packages('ggplot2')
install.packages('dplyr')

library(ggplot2)
library(dplyr)

data(iris)
View(iris)

#주성분 분석 시행
pca_iris <- prcomp(iris[,1:4])
pca_iris

summary(pca_iris)

#시각화
plot(pca_iris)

#새로운 주성분으로 iris데이터 계산
pre_iris <- predict(pca_iris)
View(pre_iris)

#데이터프레임으로 변환
df_pre_iris <- as.data.frame(pre_iris)

#원본 데이터프레임과 합병
df_iris <- cbind(iris, df_pre_iris)
View(df_iris)

#시각화
ggplot(df_iris, aes(x=PC1, y=PC2, color=Species)) + geom_point()

#결론#############################################
#그래프를 살펴보면 기존 4개의 변수로 표현하는 것보다 
#새로운 주성분 2개(PC1, PC2)로 완벽히 군집을 표현할 수 
#있기 때문에 PCA 분석은 효용이 매우 크다.
