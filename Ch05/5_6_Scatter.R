#날짜: 2021/01/20
#이름: 김하린
#내용: Ch05. 데이터 시각화 - 산점도 교재 p154


#산점도 기본
mtcars
View(mtcars)


plot(mtcars$wt, mtcars$mpg)
plot(mtcars$wt, mtcars$mpg,
     xlab = '중량',
     ylab = '연비')

plot(mtcars$wt, mtcars$mpg,
     xlab = '중량',
     ylab = '연비',
     col = 'red',
     pch=16)


#여러 변수들 간의 산점도
iris
View(iris)

iris2 <- iris[, 3:4]
View(iris2)

group <- as.numeric(iris$Species)
group

color <- c('red', 'green', 'blue')

plot(iris2, pch = 16, col = color[group])

#교재 p154 실습 - 산점도 그래프에 대각선과 텍스트 추가하기
price <- runif(10, min = 1, max = 100)
plot(price, col = "red")

par(new = T) #차트 추가
line_chart = 1:100
plot(line_chart, type = "l", col = "red", axes = F, ann = F) #line 
text(70, 80, "대각선 추가", col = "blue")

#교재 p155 실습 - type 속성으로 산점도 그리기
par(mfrow = c(2, 2))
plot(price, type = "l") #실선
plot(price, type = "o") #실선과 꼭지점 원형
plot(price, type = "h") #직선
plot(price, type = "s") #꺽은선선

#교재 p156 실습 - pch 속성으로 산점도 그리기
par(mfrow = c(2, 2))
plot(price, type = "o", pch = 5) #빈 사각형
plot(price, type = "o", pch = 15) #찬 사각형
plot(price, type = "o", pch = 20, col = "blue") #전부 파란색
plot(price, type = "o", pch = 20, col = "orange", cex = 1.5) #character expansion: 점 모양 확대

par(mfrow = c(1, 1))
plot(price, type = "o", pch = 20, col = "green", cex = 2.0, lwd = 3) #line width: 선 굵기

#교재 p162 실습 - iris 데이터셋의 4개 변수를 상호 비교
attributes(iris)
pairs(iris[iris$Species == "virginica", 1:4])
pairs(iris[iris$Species == "setosa", 1:4])     
