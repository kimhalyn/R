#날짜: 2021/01/20
#이름: 김하린
#내용: Ch05. 데이터 시각화 - 상자그래프 교재 p148

################
#박스상자 기본
################
cars
str(cars)
View(cars)

dist <- cars[,2]
dist

boxplot(dist)

#최저값, 1분위값, 중앙값, 3분위값, 최고값, 이상치(out)
boxplot.stats(dist)

#######################################
#박스상자를 이용하여 자동차 데이터 분석
#######################################
mtcars
dim(mtcars)
View(mtcars)

#연비 분포 확인
boxplot(mtcars$mpg)
boxplot.stats(mtcars$mpg)

#기어 수에 따른 연비 분포 확인
boxplot(mtcars$mpg ~ mtcars$gear)

#변속기 종류에 따른 연비 분포 확인
boxplot(mtcars$mpg ~ mtcars$am)

#######################################
#박스상자를 이용하여 붓꽃 데이터 분석
#######################################
iris
View(iris)

boxplot(iris)
boxplot(data=iris, Petal.Length ~ Species) #y축 ~ X축


#######################################
#월별 기온 변화 다중 박스상자 실습
#######################################
getwd()
df_seoul_temp <- read.csv('C:/Users/bigdata/workspace/R/file/seoul_temp_2017.csv')
df_seoul_temp
View(df_seoul_temp)

#서울 1년 기온 분포확인
summary(df_seoul_temp$avg_temp)

boxplot(df_seoul_temp$avg_temp,
        col = '#4DB3E6',
        ylim = c(-20, 40),
        xlab = '서울 1년 기온',
        ylab = '기온'
        )
#1월 평균기온 집계 
 #aggregate = group by
month_avg <- aggregate(df_seoul_temp$avg_temp, by = list(df_seoul_temp$month), mean)
month_avg

boxplot(avg_temp ~ month,
        data = df_seoul_temp,
        col = '#4DB3E6',
        ylim = c(-20, 40),
        xlab = '서울 1년 기온',
        ylab = '기온'
        )


#교재 p148 실습 - VADeaths 데이터셋을 상자그래프로 시각화하기
 # notch = False일때
range = 0 #최솟값과 최댓값이 점선으로 연결
boxplot(VADeaths, range = 0)
 
# notch = True일때 - 중위수 비교 시 허리선 사용
boxplot(VADeaths, range = 0, notch = T)
abline(h = 37, lty = 3, col = "red")

#교재 p149 실습 - VADeaths 데이터셋의 요약통계 보기
summary(VADeaths)
