# 날짜 : 2021/01/19
# 이름 : 김하린
# 내용 : Ch02. 데이터유형과 구조 - List 자료구조 교재 p78

x1 <- seq(1:5)
x2 <- matrix(1:6, nrow = 2)
x3 <- data.frame(col1 = c(1, 2), col2 = c('김유신', '김춘추'))

x1
x2
x3

list <- list(e1=x1, e2=x2, e3=x3)
list

list$e1[3]
list$e2[1, 2]
list$e3$col2[1]

#교재 p79 실습 -- key를 생략한 list 생성하기
list <- list("lee", "이순신", 95)
list

#교재 p79 실습 -- 리스트를 벡터 구조로 변경하기
unlist <- unlist(list) 
unlist

#교재 p80 실습 -- 1개 이상의 값을 갖는 리스트 객체 생성하기
num <- list(c(1:5), c(6:10))
num

#교재 p80 실습 - key와 value 형식으로 리스트 객체 생성하기
member <- list(name = c("홍길동", "유관순"), age = c(35, 25),
               address = c("한양", "충남"), gender = c("남자", "여자"),
               htype = c("아파트", "오피스텔"))
                      
member
member$name
member$name[1]
member$name[2]

#교재 p81 실습 - key를 이용하여 value에 접근하기
member$age[1] <- 45  #원소 수정
member$id <- "hong" #id 추가
member$pwd <- "1234" #pwd 추가
member

member$age <- NULL #age원소 제거
member

length(member)
mode(member); class(member)

#교재 p82 실습 - 리스트 객체에 함수 적용하기(lapply: 리스트 형태로 반환)
a <- list(c(1:5))
b <- list(c(6:10))
lapply(c(a,b), max) 

#교재 p82 실습 - 리스트 형식을 벡터 형식으로 반환하기(sapply: 벡터 형식으로 반환)
sapply(c(a,b),max)
