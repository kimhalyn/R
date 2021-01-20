#날짜: 2021/01/20
#이름: 김하린
#내용: Ch05. 데이터 시각화 - 히스토그램(막대사이 공간 없음, 연속데이터터 출력에 사용)교재 p150

#히스토그램 기본
cars
dist <- cars[, 2]
dist


hist(dist)

#붓꽃 너비 분포 확인
hist(iris$Sepal.Width,
     xlim = c(1.0, 5.0),
     xlab = "붓꽃 꽃받침 너비",
     main = "붓꽃 꽃받침 너비 분포도")

#교재 p150 실습 - iris 데이터셋 가져오기
data(iris)
names(iris) #iris 컬럼명 보기
str(iris) #데이터 구조 보기
head(iris) #상위 6개만

#교재 p150 실습 - iris 데이터셋의 꽃받침 길이(Sepal.Length)로 히스토그램 시각화하기
summary(iris$Sepal.Length)
hist(iris$Sepal.Length, xlab = "iris$Sepal.Length", col = "magenta",
      main = "iris 꽃받침 길이 Histogram", xlim = c(4.3, 7.9))

#교재 p151 실습 - iris 데이터셋의 꽃받침 너비(Sepal.Width)로 히스토그램 시각화하기
summary(iris$Sepal.Width)
hist(iris$Sepal.Width, xlab = "iris$Sepal.Width", col = "mistyrose",
     main = "iris 꽃받침 너비 Histogram", xlim = c(2.0, 4.5))

#교재 p152 실습 - 히스토그램에서 빈도와 밀도 표현하기
par(mfrow = c(1, 2))
hist(iris$Sepal.Width, 
     xlab = "iris$Sepal.Width", 
     col = "green",
     main = "iris 꽃받침 너비 Histogram:빈도수", 
     xlim = c(2.0, 4.5))

hist(iris$Sepal.Width, 
     xlab = "iris$Sepal.Width", 
     col = "mistyrose",
     freq = F, #밀도 표현
     main = "iris 꽃받침 너비 Histogram:확률밀도", 
     xlim = c(2.0, 4.5))

lines(density(iris$Sepal.Width), col = "red")

#교재 p152 실습 - 정규분포 추정 곡선 나타내기 
par(mfrow = c(1, 1))
hist(iris$Sepal.Width, 
     xlab = "iris$Sepal.Width", 
     col = "mistyrose",
     freq = F,
     main = "iris 꽃받침 너비 Histogram", 
     xlim = c(2.0, 4.5))

 # 히스토그램 밀도를 기준으로 분포곡선 추가
lines(density(iris$Sepal.Width), col = "red")

 # 히스토그램에 정규분포 추정 곡선 추가
x <- seq(2.0, 4.5, 0.1)
curve(dnorm(x, mean = mean(iris$Sepal.Width),
            sd = sd(iris$Sepal.Width)),
            col = "blue", add = T)
