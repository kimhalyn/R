# 날짜 : 2021/01/18
# 이름 : 김하린
# 내용 : Ch02. 데이터유형과 구조 - Vector자료구조 교재 p58

#Vector - R에서 가장 많이 사용하는 자료구조, 배열과 동일

v1 <- c(1, 2, 3, 4, 5)
v1
v1[1]
v1[5]

v2 <- 1:5
v2
v2[1]
v2[5]

#벡터 연산
x <- 1:4
y <- 5:8

x+y
x-y
x*y

#seq() 함수를 이용한 벡터 생성
v3 <- seq(1, 10, by=2) #2 간격으로
v3
v4 <- seq(11, 20, 2)
v4

#rep() 함수를 이용한 벡터 생성
v5 <- rep(1:3,2)
v5
v6 <- rep(1:5, each=2)
v6

#벡터의 합과 평균
sum_v1 <- sum(v1)
sum_v1

sum_v2 <- sum(v2)
sum_v2

min_v1 <- min(v1)
min_v1

min_v2 <- min(v2)
min_v2

#교재 p58 실습 - c() 함수를 이용한 벡터 객체 생성
c(1:20)
1:20
c(1, 2, 3, 4, 5)
c(1:5)

#교재 p58 실습 - seq() 함수를 이용한 벡터 객체 생성
seq(1, 10, 2)

#교재 p59 실습 - rep() 함수를 이용한 벡터 생성 
rep(1:3, 3)
rep(1:3, each=3)

#교재 p59 실습 - union(), setdiff(), intersect() 함수를 이용한 벡터 자료 처리
x <- c(1, 3, 5, 7)
y <- c(3, 5)
x
y

union(x, y) # 합집합

setdiff(x, y) #x에만 있는 값(차집합)

intersect(x, y) #공통 값(교집합)

#교재 p59 실습 - 숫자형, 문자형, 논리형 벡터 생성
v1 <- c(33, -5, 20:23, 12, -2:3)
v2 <- c("홍길동", "이순신", "유관순")
v3 <- c(T, TRUE, FALSE, T, TRUE, FALSE)
v1;v2;v3 #한줄에 여러 개의 스크립트 명령문 사용

#교재 p60 실습 - 자료형이 혼합된 경우
v4 <- c(33, 05, 20:23, 12, "4")
v4  #모두 문자형 데이터로 변경

#교재 p60 실습 - 벡터 객체의 값에 칼럼명 지정
age <- c(30, 35, 40)
age

names(age) <- c("홍길동", "이순신", "강감찬")
age
age <- NULL

#교재 p61 실습 - 벡터 자료 참조하기
a <- c(1:50)
a[10:45]
a[19:(length(a) - 5)]

#교재 p61 실습 - c() 함수에서 콤마 사용 예
v1 <- c(13, -5, 20:23, 12, -2:3)
v1[1]
v1[c(2,4)] #인덱스 2,4의 값 출력
v1[c(3:5)]
v1[c(4, 5:8, 7)]
