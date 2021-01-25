#날짜: 2021/01/21
#이름: 김하린
#내용: Ch09.  정형과 비정형 데이터 처리 -  mariaDB 정형 데이터 처리 교재 p292

#RMysql패키지 설치
install.packages('RMySQL')

library(RMySQL)
library(dplyr)
library(ggplot2)

#데이터베이스 접속
conn <- dbConnect(MySQL(),
                  host='192.168.10.114',
                  user='khr',
                  password='1234',
                  dbname='khr',
                  )                  

df_user <- dbGetQuery(conn, statement = "SELECT * FROM `USER1`;")
Encoding(df_user$name) <- 'UTF-8'
View(df_user)


#매출데이터 불러오기
df_sale <- dbGetQuery(conn, statement = "SELECT * FROM `SALE_2017`;")
View(df_sale)

#직원별 매출 그룹화
df_sale <- df_sale %>% 
           group_by(uid) %>% 
           summarise(total=sum(sales)) %>% 
           arrange(desc(total))
View(df_sale)

#시각화
#geom_bar: 막대차트, 빈도
#geom_col: 막대차트, 평균
ggplot(data = df_sale, aes(x=uid, y=total)) + geom_col() 

#데이터베이스 접속종료
dbConnect(conn)

