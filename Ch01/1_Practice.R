# 날짜 : 2021/06/07
# 이름 : 김하린
# 내용 : Ch01. 연습문제 교재 p56

#작업공간 확인 및 변경
getwd()
setwd('c:Rwork/Part-1')

#조건에 맞는 변수 생성 및 처리
name <- "홍길동"
age <- 33
address <- "서울시 용산구"
name;age;address

mode(name);mode(age);mode(address)
is.character(name);is.numeric(age);is.character(address)

#R에서 제공하는 데이터 셋 처리
data()
mode(women);class(women) #자료 유형과 자료구조조
plot(women)

#c()함수 이용하여 벡터 생성 및 데이터 추가
num <- c(1:100)
mean(num)
