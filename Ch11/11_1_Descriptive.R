#날짜: 2021/01/26
#이름: 김하린
#내용 : Ch11.기술통계분석 - 척도별 기술통계량 구하기 교재 p368

##################
#교재예제 실습하기
##################

#교재 p368 실습 - 전체 데이터 셋의 특성 보기
data <- read.csv("./file/descriptive.csv", header = T)
head(data)

dim(data)
length(data) #열 길이
length(data$survey) #survey 컬럼의 관찰치 : 행(300)
str(data)
summary(data)

#교재 p370 실습 - 성별(gender) 변수의 기술 통계량과 빈도수 구하기
length(data$gender)
summary(data$gender)
table(data$gender) #0, 5 이상치 발견

#교재 p370 실습 - 이상치(outlier) 제거
data <- subset(data, gender ==1 | gender == 2) #이상치 제거
x <- table(data$gender)
x

barplot(x)

#교재 p370 실습 - 구성 비율 계산
prop.table(x) #비율계산
y <- prop.table(x)
round(y * 100, 2)

#교재 p371 실습 - 학력 수준 변수를 대상으로 구성 비율 구하기
length(data$level) #학력 수준은 서열척도임
summary(data$level) #명목 척도와 함께 의미 없음
table(data$level) #빈도분석: 의미있음


#교재 p371 실습 - 학력 수준 변수의 빈도수 시각화 하기
x1 <- table(data$level) #각 학력 수준에 빈도수 저장
barplot(x1)

#교재 p372 실습 - 만족도 변수를 대상으로 요약통계량 구하기
survey <- data$survey
survey

summary(survey) #만족도(5점 척도)인 경우 의미있음 -< 2.6(평균 이상)

#교재 p372 실습 - 등간척도 빈도분석
x1 <- table(survey)
x1

#교재 p373 실습 - 등간척도 시각화하기
hist(survey)
pie(x1)

#교재 p374 실습 - 생활비 변수 대상 요약 통계량 구하기
length(data$cost)
summary(data$cost)


#교재 p374 실습 - 데이터 정제(결측치 제거)
plot(data$cost)
data <- subset(data, data$cost >= 2 & data$cost <= 10) #생활비 기준
x <- data$cost
mean(x)

#교재 p374 실습 - 생활비 변수를 대상으로 대표값 구하기
mean(x)
median(x)
sort(x)
sort(x, decreasing = T)

 #사분위수 구하기
quantile(x, 1/4)
quantile(x, 2/4)
quantile(x, 3/4)
quantile(x, 4/4)

#교재 p376 실습 - 생활비 변수의 최빈수 구하기
length(x)
x.t <- table(x)
max(x.t)

x.m <- rbind(x.t)
class(x.m)
str(x.m)
which(x.m[1, ] == 18)

x.df <- as.data.frame(x.m)
which(x.df[1, ] == 18)
x.df[1, 19]
attributes(x.df)
names(x.df[19])

#교재 p377 실습 - 생활비 변수를 대상으로 산포도 구하기
var(x)
sd(x)
sqrt(var(data$cost, na.rm = T))

#교재 p379 실습 - 생활비 변수의 빈도분석과 시각화하기
table(data$cost)
hist(data$cost)
plot(data$cost)
data$cost2[data$cost >= 1 & data$cost <= 3] <- 1
data$cost2[data$cost >= 4 & data$cost <= 6] <- 2
data$cost2[data$cost >= 7] <- 3


table(data$cost2)
par(mfrow = c(1, 2))
barplot(table(data$cost2))
pie(table(data$cost2))

#교재 p381 실습 - 패키지를 이용한 비대칭도 구하기
install.packages("moments")
library(moments)
cost <- data$cost
skewness(cost)
kurtosis(cost)
hist(cost)

#교재 p382 실습 - 히스토그램과 정규분포 곡선 그리기
hist(cost, freq = F)
lines(density(cost), col = 'blue')
x <- seq(0, 8, 0.1)
curve(dnorm(x, mean(cost), sd(cost)), col = 'red', add = T)

#교재 p382 실습 - attach()/detach() 함수로 기술통계량 구하기
attach(data)
length(cost)
summary(cost)
mean(cost)
min(cost)
max(cost)
range(cost)
sqrt(var(cost, na.rm = T))
sd(cost, na.rm = T)
detach(data)

#교재 p383 실습 - NA가 있는 경우 제거한 뒤에 기술통계량 구하기
test <- c(1:5, NA, 10:20)
min(test)
max(test)
range(test)
mean(test)

min(test, na.rm = T)
max(test, na.rm = T)
range(test, na.rm = T)
mean(test, na.rm = T)
