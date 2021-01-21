#날짜: 2021/01/21
#이름: 김하린
#내용: Ch07.  EDA와 Data정제 - 결측치  실습 교재 p200

library(dplyr)

df_exam <- read.csv('./file/exam_na.csv')
View(df_exam)
print(df_exam)

#결측치 존재여부 확인
is.na(df_exam)

#결측치를 제거
df_exam_new <- df_exam %>% filter(!is.na(math) & !is.na(english) & !is.na(science))
View(df_exam_new)

#EDA수행
df_result <- df_exam_new %>%  mutate(total=math+english+science, mean(total/3)) %>% arrange(desc(total))
df_result

#교재 p201 실습 - summary() 함수를 사용하여 결측치 확인하기
summary(df_exam)
summary(df_exam$english) #결측치 확인
sum(df_exam$english) #결측치때문에 NA로 출력

#교재 p201 실습 - sum() 함수의 속성을 이용하여 결측치 제거하기
sum(df_exam$english, na.rm = T)

#교재 p201 실습 - 결측치 제거 함수를 이용하여 결측치 제거
english2 <- na.omit(df_exam$english)
sum(english2)
length(english2)  #17이 나오는데 총 20개에서 17개 남았으므로 결측치가 3개 제거됐음을 알 수 있음

#교재 p202 실습 - 결측치를 0으로 대체하기
x <- df_exam$english
x[1:20]
x

df_exam$english1 = ifelse(!is.na(x), x, 0) #x가 결측치가 아니면 x, 결측치면 0으로 대체체
df_exam$english1
sum(df_exam$english1)

#교재 p202 실습 - 결측치를 평균으로 대체하기
x <- df_exam$english
x[1:20]
x

df_exam$english2 = ifelse(!is.na(x), x, round(mean(x, na.rm = TRUE), 2)) #결측치를 제거한 x의 평균을 반올림 2째 짜리까지
df_exam$english2

df_exam[c('english', 'english1', 'english2')]
