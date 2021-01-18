# 날짜 : 2021/01/18
# 이름 : 김하린
# 내용 : Ch01. R설치와 개요 - 변수 교재 p39

#변수
num1 <- 1
num2 <- 2
print(num1)
print(num2)

str1 <- "Hello R!"
str2 <- '안녕 R!'
str1
str2

#스칼라(scalar) 변수(한 개의 값을 갖는 변수, 일반적인 변수)
var1 <- 1
var2 <- 2
var3 <- var1 + var2
var3

#벡터(vector) 변수(하나 이상의 값을 갖는 변수, 가장 많이 쓰는 변수, 배열)
x <- c(1, 2, 3)
y <- c('김춘추', '이순신','장보고', '강감찬','김유신')
x
y

# R에서는 인덱스번호 1부터 시작
x[1]
y[1]

#팩터(factor) 변수(문자열이 저장되는 벡터, 위의 y변수가 팩터, 범주형 데이터에 사용)
bt <- c('A', 'B', 'B', 'O', 'AB', 'A')
bt
f_bt <- factor(bt)
f_bt

#교재 p40 실습 - 변수 사용 예
var1 <- 0
var1

var1 <- 1
var1

var2 <- 2
var2

var3 <- 3
var3

#교재 p40 실습 - 변수.멤버 형식의 변수 선언 예
goods.code <- 'a101'
goods.name <- '냉장고'
goods.price <- 850000
goods.des <- '최고사양, 동급 최고 품질'

#교재 p41 실습 - 스칼라 변수 사용 예
age <- 35
name <- "홍길동"
age
name

#교재 p41 실습 - 벡터 변수 사용 예
age <- 35
names <- c("홍길동", "이순신", "유관순")
age
names
