#날짜: 2021/01/20
#이름: 김하린
#내용: Ch05. 데이터 시각화 - 막대차트 교재 p139


################
#기본 막대차트
################
count <- c(1, 2, 3, 4, 5)
barplot(count)

score <- c(80, 72, 60, 78, 82)
names(score) <- c('김유신', '김춘추', '장보고', '강감찬', '이순신')
barplot(score)


################
#범주형 막대차트
################
season <- c('winter', 'summer', 'spring', 'summer', 'summer',
            'autumn', 'autumn', 'summer', 'spring', 'spring')
season
#season 데이터 도수분포표 생성
season_table <- table(season)
season_table
barplot(season_table)
names(season_table) <- c('spring', 'summer', 'autumn', 'winter')


################
#막대차트 옵션
################
barplot(season_table, main = 'Season')
barplot(season_table, main = 'Season', col = c('red', 'green', 'blue', 'yellow'))
barplot(season_table, main = 'Season', col = rainbow(4))
barplot(season_table, main = 'Season', col = heat.colors(4))
barplot(season_table, main = 'Season', col = terrain.colors(4))

barplot(season_table, 
        main = 'Season', 
        col = terrain.colors(4),
        xlab = '계절',
        ylab = '빈도수')

barplot(season_table, 
        main = 'Season', 
        col = terrain.colors(4),
        xlab = '계절',
        ylab = '빈도수',
        horiz = T) #가로막대


################
#누적 막대차트
################
df_population <- read.csv('./file/sample_population.csv')
df_population
View(df_population)

#메트릭스(행렬)로 변환해야 함
matrix_population <- as.matrix(df_population)
matrix_population
barplot(matrix_population)

#교재 p140 실습 - 세로 막대 차트 그리기
chart_data <- c(305, 450, 320, 460, 330, 480, 380, 520)
 #8개의 벡터에 칼럼명 지정
names(chart_data) <- c("2018 1분기", "2019 1분기",
                       "2018 2분기", "2019 2분기",
                       "2018 3분기", "2019 3분기",
                       "2018 4분기", "2019 4분기"
                       )

 #자료구조 보기
str(chart_data)

 #벡터자료 보기
chart_data

 #세로 막대 차트 그리기
barplot(chart_data, ylim = c(0, 600), #y축 값의 범위
        col = rainbow(8),
        main = "2018년도 vs 2019년도 매출현황 비교")

#교재 p141 실습 - barplot() 함수 도움말 보기
help('barplot')

#교재 p141 실습 - 막대차트의 가로축과 세로축에 레이블 추가하기
barplot(chart_data, ylim = c(0, 600), 
        xlab = "년도별 분기 현황",
        ylab = "매출액(단위: 만원)",
        col = rainbow(8),
        main = "2018년도 vs 2019년도 매출현황 비교")

#교재 p142 실습 - 가로 막대차트 그리기
barplot(chart_data, xlim = c(0, 600), horiz = T,
        xlab = "년도별 분기 현황",
        ylab = "매출액(단위: 만원)",
        col = rainbow(8),
        main = "2018년도 vs 2019년도 매출현황 비교")

#교재 p142 실습 - 막대차트에서 막대 사이의 간격 조정하기
 #spce값이 클수록 막대가 얇아짐, cex.names는 축 이름 크기 지정정
barplot(chart_data, xlim = c(0, 600), horiz = T,
        xlab = "년도별 분기 현황",
        ylab = "매출액(단위: 만원)",
        col = rainbow(8), space = 0.5, cex.names = 0.8,
        main = "2018년도 vs 2019년도 매출현황 비교")


#교재 p143 실습 - 막대차트에서 막대의 색상 지정하기
 # rep 1-검은색, 2-빨간색, 3-초록색, 4-파란색, 5-하늘색, 6-자주색, 7-노란색
barplot(chart_data, xlim = c(0, 600), horiz = T,
        xlab = "년도별 분기 현황",
        ylab = "매출액(단위: 만원)",
        space = 1, cex.names = 0.8,
        main = "2018년도 vs 2019년도 매출현황 비교",
        col = rep(c(2, 4), 4)) #2번과 4번 색상을 4번 반복해라

#교재 p143 실습 - 막대 차트에서 색상이름을 사용하여 막대의 색상 지정하기
barplot(chart_data, xlim = c(0, 600), horiz = T,
        xlab = "년도별 분기 현황",
        ylab = "매출액(단위: 만원)",
        space = 1, cex.names = 0.8,
        main = "2018년도 vs 2019년도 매출현황 비교",
        col = rep(c('red', 'green'), 4))

#교재 p144 실습 - 누적 막대 차트 그리기
 #데이터가져오기
data(VADeaths)
VADeaths

 #데이터 셋 구조 보기
str(VADeaths)
class(VADeaths)
mode(VADeaths)

 #개별차트와 누적차트 그리기
par(mfrow = c(1,2)) #한 화면에서 차트 2개 볼 수 있음

 #개별차트
barplot(VADeaths, beside = T, col = rainbow(5),
        main = "미국 버지니아주 하위계층 사망비율")

 #범례표시
legend(19, 71, c("50-54", "55-59", "60-64" , "65-69", "70-74"),
       cex = 0.8, fill = rainbow(5))
 #누적차트
barplot(VADeaths, beside = F, col = rainbow(5))
title(main = "미국 버지니아주 하위계층 사망비율", font.main = 4)
legend(3.8, 200, c("50-54", "55-59", "60-64", "65-69", "70-74"),
       cex = 0.8, fill = rainbow(5))
 
