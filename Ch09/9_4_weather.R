#날짜: 2021/01/25
#이름: 김하린
#내용: Ch09.  정형과 비정형 데이터 처리 - 날씨 데이터 분석 시각화 실습

install.packages('rJava')
install.packages('DBI')
install.packages('RJDBC')
install.packages('dplyr')
install.packages('ggplot2')

library(DBI)
library(rJava)
library(RJDBC)
library(dplyr)
library(ggplot2)


#드라이버 로드 
driver <- JDBC(driverClass = 'com.mysql.jdbc.Driver', './file/mysql-connector-java-5.1.49.jar')

#데이터베이스 접속
conn <- dbConnect(driver, 'jdbc:mysql://192.168.10.114:3306/weather', 'weather', '1234')

#쿼리실행
df_weather_20210101 <- dbGetQuery(conn, "SELECT * FROM `2021-01-01`")
View(df_weather_20210101)

#데이터베이스 접속종료
dbDisconnect(conn)

#############################
#부산 기온 시각화 및 요약통계
#############################

#부산 데이터프레임 가공처리
df_busan <- df_weather_20210101 %>% select(everything()) %>% filter(col1 == '부산')
View(df_busan)


#요약 통계 방법1
summary(df_busan$col6)

#요약 통계 방법2
df_busan %>% summarise(mean=mean(col6), min=min(col6), max=max(col6))

#시각화
ggplot(data = df_busan, aes(x=col1, y=col6)) + geom_boxplot()
ggplot(data = df_busan, aes(x= rdate, y=col6, group=1)) + geom_line()
ggplot(data=df_busan, aes(x=rdate, y=col6)) + geom_col()
