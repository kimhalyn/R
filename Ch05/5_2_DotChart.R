#날짜: 2021/01/20
#이름: 김하린
#내용: Ch05. 데이터 시각화 - 점차트 교재 p146

score <- c(80, 72, 60, 78, 82)
names(score) <- c('김유신', '김춘추', '장보고', '강감찬', '이순신')
dotchart(score, horiz = T)

help('dotchart')

#교재 p146 실습 - 점 차트 사용하기
par(mfrow = c(1, 1))
dotchart(chart_data, color = c("blue", "red"), #color: y축과 점 색깔 
         lcolor = "black", pch = 1:2, #구분선, 점모양
         labels = names(chart_data),       
         xlab = "매출액",
         main = "분기별 판매현황: 점차트 시각화",
         cex = 1.2)

