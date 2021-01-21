#날짜: 2021/01/21
#이름: 김하린
#내용: Ch07.  EDA와 Data정제 - 극단치(이상치)  실습 교재 p202

library(dplyr)

#이상치 확인
df_exam <- read.csv('./file/exam_outlier.csv')
View(df_exam)

#이상치를 결측치로 수정
df_exam$math <- ifelse(df_exam$math > 100 | df_exam$math < 0, NA, df_exam$math) #('|'=또는)
df_exam$english <- ifelse(df_exam$english > 100 | df_exam$english < 0, NA, df_exam$english) 
df_exam$science <- ifelse(df_exam$science > 100 | df_exam$science < 0, NA, df_exam$science) 
df_exam

#결측치를 0으로 수정
df_exam[is.na(df_exam)] <- 0

#EDA 수행
df_result <- df_exam %>%  mutate(total=math+english+science) %>%  
                          mutate(mean(total/3)) %>% 
                          arrange(desc(total))
df_result

#교재 p203 실습 - 범주형 변수의 극단치 처리하기
dataset <- read.csv('./file/dataset.csv')
View(dataset)
table(dataset$gender)
pie(table(dataset$gender))

#교재 p203 실습 - subset(데이터프레임, 조건식) 함수를 사용하여 조건식에 맞는 데이터 정제하기
dataset <- subset(dataset, gender == 1 | gender == 2) #gender가 1 or 2인 데이터만 선택
length(dataset$gender)
table(dataset$gender)
pie(table(dataset$gender))
pie(table(dataset$gender), col = c("red", "blue")) #그래프에 색상 지정

#교재 p204 실습 - 연속형 변수의 극단치 보기
dataset <- read.csv('./file/dataset.csv', header = T)
View(dataset)

dataset$price
length(dataset$price)
plot(dataset$price)
summary(dataset$price) #최솟값, 1분위값, 중앙값, 평균, 3분위값, 최댓값, 결측치 한번에 보여줌

#교재 p205 실습 - price 변수의 데이터 정제와 시각화
dataset2 <- subset(dataset, price >=2 & price <=8)
length(dataset2$price)
stem(dataset2$price) #줄기와 잎 도표 보기

#교재 p205 실습 - age 변수의 데이터 정제와 시각화
summary(dataset$age)
length(dataset$age)

dataset3 <- subset(dataset, age >= 20 & age <= 69)
length(dataset3)
boxplot(dataset3$age)

#교재 p206 실습 - boxplot와 통계를 이용한 극단치 처리하기
boxplot(dataset$price)
boxplot(dataset$price)$stats #boxplot 통계치 출력

dataset_sub <- subset(dataset, price >= 2.1 & price <=7.9) 
summary(dataset_sub$price)
