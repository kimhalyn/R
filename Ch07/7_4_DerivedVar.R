#날짜: 2021/01/21
#이름: 김하린
#내용: Ch07.  EDA와 Data정제 - 파생변수  실습 교재 p215

#데이터 불러오기
df_exam <- read.csv('./file/exam.csv')
df_exam

#파생변수 total 생성
df_exam$total <- df_exam$math + df_exam$english + df_exam$science
View(df_exam)

#파생변수 mean 생성
df_exam$mean <- df_exam$total / 3
View(df_exam)

#파생변수 grade 생성
df_exam$grade <- ifelse(df_exam$mean >=90, 'A', 
                 ifelse(df_exam$mean >=80, 'B',
                 ifelse(df_exam$mean >=70, 'C',
                 ifelse(df_exam$mean >=60, 'D', 'F'))))
View(df_exam)



#교재 p217 실습 - 더미 파생변수(특정변수를 0과1로 범주화하여 나타내는 변수) 생성하기
user_data <- read.csv('./file/user_data.csv', header = T)
head(user_data)
View(user_data)
table(user_data$house_type)

 #더미변수 생성
house_type2 <- ifelse(user_data$house_type == 1 |
                        user_data$house_type == 2, 0, 1  )

house_type2[1:10]

 #파생변수 추가
user_data$house_type2 <- house_type2
head(user_data)

#교재 p218 실습 - 1:N의 관계를 1:1관계로 파생변수 생성하기
pay_data <- read.csv('./file/pay_data.csv', header = T)
pay_data
View(pay_data)
head(pay_data, 10)
table(pay_data$product_type)

 #구조 변경을 위한 패키지
install.packages('reshape2')
library(reshape2) 
 #행~열, 행렬 값은 sum으로 지정했는데 "Using price as value column: use value.var to override."은 price변수를 측정변수로 사용됐다는 의미
product_price <- dcast(pay_data, user_id ~ product_type, sum, na.rm = T) 
head(product_price, 3)
 #칼럼명 수정
names(product_price) <- c('user_id', '식료품(1)', '생필품(2)', '의류(3)', '잡화(4)', '기타(5)')
head(product_price)

#교재 p220 실습 - 고객식별번호(user_id)에 대한 지불유형(pay_method)의 파생변수 생성하기
 #dcast()함수에서 length는 구매상품의 개수를 구하기 위해 지정
pay_price <- dcast(pay_data, user_id ~ pay_method, length) 
head(pay_price, 3)
 #칼럼명 변경
names(pay_price) <- c('user_id', '현금(1)', '직불카드(2)', '신용카드(3)', '상품권(4)')
head(pay_price, 3)

#교재 p220 실습 - 고객정보(user_data) 테이블에 파생변수 추가하기
 #데이터프레임 병합을 위한 패키지
install.packages('plyr')
library(plyr)

user_pay_data <- join(user_data, product_price, by = 'user_id' )
head(user_pay_data, 10)

 #고객별 지불유형에 따른 구매상품 개수 병합
user_pay_data <- join(user_pay_data, pay_price, by = 'user_id' )
user_pay_data[c(1:10), c(1, 7:15)]

#교재 p221 실습 - 사칙연산으로 총 구매금액 파생변수 생성하기
 user_pay_data$총구매금액 <- user_pay_data$'식료품(1)'+
                             user_pay_data$'생필품(2)'+
                             user_pay_data$'의류(3)'+
                             user_pay_data$'잡화(4)'+
                             user_pay_data$'기타(5)'
 user_pay_data[c(1:10), c(1, 7:11, 16)]
 