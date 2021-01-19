# 날짜 : 2021/01/19
# 이름 : 김하린
#내용 : Ch04.제어문과 함수 - 연산자 교재 p108

#교재 p108 실습 - 산술연산자 사용
num1 <-100
num2 <- 20
result <- num1 + num2
result

result <- num1 - num2
result

result <- num1 * num2
result

result <- num1 / num2
result

result <- num1 %% num2 
result

result <- num1^2  #제곱계산 (num1 ** 100)
result

result <- num1^num2 #100의 20승, 1뒤에 0이 40개 있음
result

#교재 p109 실습 - 관계연산자 사용
boolean <- num1 == num2
boolean

boolean <- num1 != num2
boolean

boolean <- num1 > num2
boolean

boolean <- num1 >= num2
boolean


boolean <- num1 < num2
boolean

boolean <- num1 <= num2
boolean

#교재 p109 실습 - 논리연산자 사용
logical <- num1 >= 50 & num2 <= 10 #두 식이 모두 참인지 판단
logical

logical <- num1 >= 50 | num2 <= 10 # 두 식 중 하나라도 참인지 판단단
logical

logical <- num1 >= 50
logical

logical <- !(num1 >= 50)
logical

X <- TRUE ;y <- FALSE
xor(x, y) #논리값이 상반되는 경우 TRUE, 같으면 FALSE
