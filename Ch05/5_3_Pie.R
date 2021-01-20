#날짜: 2021/01/20
#이름: 김하린
#내용: Ch05. 데이터 시각화 - 원형차트 교재 p147

season <- c('winter', 'summer', 'spring', 'summer', 'summer',
            'autumn', 'autumn', 'summer', 'spring', 'spring')

season

#영역별 개수
season_table <- table(season)
season_table

#원형차트
pie(season_table)
pie(season_table, col = rainbow(4))

#교재 p148 실습 - 분기별 매출현황을 파이 차트로 시각화하기
par(mfrow = c(1,1))

 # cex는 각 조각 글씨 크기
pie(chart_data, labels = names(chart_data), col = rainbow(8), cex = 1.2)
title("2018~2019년도 분기별 매출현황")

help(pie)
