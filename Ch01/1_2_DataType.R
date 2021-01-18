# 날짜 : 2021/01/18
# 이름 : 김하린
# 내용 : Ch01. R설치와 개요 - 자료형 교재 p41

#숫자형
num1 <- 1
num2 <- 2
num3 <- 3.14
num1
num2;num3

#논리형
bool1 <- TRUE
bool2 <- FALSE
bool1
bool2

#문자형
str1 <- "Hello"
str2 <- '안녕'
str1
str2

#특수형
data1 < -NULL #초기값 의미
data2 <- NA #결측값, Not Available
data3 <- NaN #수학적으로 정의가 불가능한 값, Not a Number
data1
data2
data3

#교재 p42 실습 - 스칼라 변수 사용 예
int <- 20
int

String <-"홍길동"
String

boolean <- TRUE
boolean

sum(10, 20, 20)
sum(10, 20, 20, NA) #NA가 포함되면 NA가 출력됨
sum(10, 20, 20, NA, na.rm=TRUE) #기본값이 na.rm=F임임
#현재 사용 중인 변수 보기
ls() 

#교재 p43 실습 - 자료형 확인
is.character(String)

x <- is.numeric(int)
x

is.logical(boolean)
is.logical(x) #변수의 논리형 여부 확인
is.na(x) #변수의 NA 여부 확인

#교재 p43 실습 - 문자 원소를 숫자 원소로 형 변환하기
x <- c(1,2, "3")
x

result <- x * 3 #문자 포함으로 산술계산 에러
result <- as.numeric(x) * 3
result2 <- as.integer(x) * 3
result
result2

#교재 p44 실습 - 스칼라 변수의 자료형과 자료구조 확인

#mode(변수): 자료의 성격(type)을 알려준다
mode(int)
mode(String)
mode(boolean)

#class(변수): 자료구조의 성격(type)을 알려준다
class(int)
class(String)
class(boolean)

#교재 p45 실습 - 문자벡터와 그래프 생성
gender <- c("man", "woman", "woman", "man", "man")
plot(gender) #에러발생: 차트는 수치 데이터만 가능

#교재 p45 실습 - as.factor() 함수를 이용하여 요인형 변환
Ngender <-as.factor(gender)
table(Ngender)

#교재 p46 실습 - Factor형 변수로 차트 그리기
plot(Ngender)

mode(Ngender)
class(Ngender)
is.factor(Ngender)

#교재 p47 실습 - factor()함수를 이용하여 Factor 형 변환
args(factor)
Ogender <- factor(gender, levels=c("woman", "man"), ordered=T)
Ogender

#교재 p47 실습 - 순서가 없는 요인과 순서가 있는 요인형 변수로 차트 그리기
par(mfrow= c(1,2))
plot(Ngender)
plot(Ogender)
