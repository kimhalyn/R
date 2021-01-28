#날짜: 2021/01/28
#이름: 김하린
#내용: Ch16. 비지도학습 - 군집분석 실습 교재 p543

library(ggplot2)

#다이몬드 군집분석
data(diamonds)
View(diamonds)

#모집단에서 1000개 샘플링
sample <- sample(1:nrow(diamonds), 1000)
df_test_sample <- diamonds[sample,]
View(df_test_sample)

#군집분석용 데이터프레임 생성
df_test_diamond <- df_test_sample[c('price', 'carat', 'depth', 'table')]
View(df_test_diamond)

#군집분석
result_kmeans <- kmeans(df_test_diamond, 3)
result_kmeans

df_test_diamond['cluster'] <- result_kmeans$cluster
View(df_test_diamond)

#시각화
plot(df_test_diamond$carat, 
     df_test_diamond$price, 
     col=df_test_diamond$cluster)

