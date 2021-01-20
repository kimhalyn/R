#날짜: 2021/01/20
#이름: 김하린
#내용: Ch06. 데이터 조작 - dplyr패키지 실습 교재 p169
#dplyr 패키지 - 데이터프레임을 가공하기 위한 여러가지 함수를 제공

install.packages('dplyr')
library(dplyr)

getwd()

df_exam <- read.csv('C:/Users/bigdata/workspace/R/file/exam.csv')
View(df_exam)

#select - 데이터프레임에서 특정 변수를 선택해서 새로운 데이터프레임 생성
df_math    <- df_exam %>% select(math)          #SELECT `math`    FROM `df_exam`;
df_english <- df_exam %>% select(english)       #SELECT `english` FROM `df_exam`;
df_result1 <- df_exam %>% select(math, science) #SELECT `math`, `science` FROM `df_exam`;
df_result2 <- df_exam %>% select(everything())  #SELECT * FROM `df_exam`;

df_math
df_english
df_result1
df_result2

#filter - SELECT * FROM df_exam WHERE ~ (조건)
df_filter1 <- df_exam %>% select(everything()) %>% filter(class == 1)
df_filter2 <- df_exam %>% select(everything()) %>% filter(math >= 60 & math < 80)
df_filter3 <- df_exam %>% select(everything()) %>% filter(english >= 60 | science < 80)

df_filter1
df_filter2
df_filter3

#arrange
df_math_asc  <- df_exam %>% select(math) %>% filter(math >= 60) %>% arrange(math)
df_math_desc <- df_exam %>% select(math) %>% filter(math >= 60) %>% arrange(desc(math))
df_math_asc
df_math_desc

#mutate - 데이터프레임의 새로운 파생변수를 생성할때 사용
df_total <- df_exam %>% mutate(total = math + english + science)
df_total
View(df_total)

df_mean  <- df_exam %>% mutate(total = math + english + science) %>% mutate(mean = total/3)
df_mean
View(df_mean)

df_grade <- df_exam %>% 
            mutate(total = math + english + science) %>% 
            mutate(mean  = total/3) %>% 
            mutate(grade = ifelse(mean >= 90, 'A', 
                              ifelse(mean >= 80, 'B',
                                     ifelse(mean >= 70, 'C',
                                            ifelse(mean >= 60, 'D', 'F')))))


df_grade
View(df_grade)



#summarise(추가할 칼럼명=함수(칼럼명))
df_summarise1<- df_exam %>% summarise(mean_math=mean(math))
df_exam %>% summarise(mean_math=sum(math))

df_summarise1

#group_by - select sum(`math`) from df_exam group by class;
df_group1 <- df_exam %>% select(everything()) %>% group_by(class) %>% summarise(sum_math = sum(math))
df_group1


iris %>% group_by(Species) %>% summarise(mean(Sepal.Length),
                                         mean(Sepal.Width),
                                         mean(Petal.Length),
                                         mean(Petal.Width))


#inner_join - 2개의 데이터프레임을 합치는 것
df_teacher <- data.frame(class   = c(1, 2, 3, 4, 5), 
                         teacher = c('김유신', '김춘추', '장보고', '강감찬', '이순신'))
df_teacher
View(df_teacher)

df_join <- inner_join(df_exam, df_teacher, by = 'class')
View(df_join)

#교재 p169 실습 - iris 데이터셋을 대상으로 %>% 연산자를 이용하여 함수 적용하기
iris %>% head()
iris %>% head() %>% subset(Sepal.Length >= 5.0)

#교재 p170 실습 - dplyr패키지와 hflight 데이터셋 설치
install.packages('hflights')
library(hflights)

#교재 p171 실습 - hflight 데이터셋 구조 보기
str(hflights)

#교재 p171 실습 - tbl_df() 함수 사용하기
hflights_df <- tbl_df(hflights)
hflights_df

#교재 p172 실습 - hflights_df를 대상으로 특정일의 데이터 추출하기
filter(hflights_df, Month == 1 & DayofMonth == 2) #1월 2일 데이터 추출출

#교재 p173 실습 - hflights_df를 대상으로 지정된 월의 데이터 추출하기
filter(hflights_df, Month == 1 | Month == 2) #1월 또는 2월 데이터 추출출

#교재 p174 실습 - hflights_df를 대상으로 데이터 정렬하기
arrange(hflights_df, Year, Month, DepTime, ArrTime)

#교재 p175 실습 - hflights_df를 대상으로 지정된 칼럼 데이터 검색하기
select(hflights_df, Year, Month, DepTime, ArrTime)

#교재 p175 실습 - hflights_df를 대상으로 칼럼의 범위로 검색하기
select(hflights_df, Year:ArrTime) #year~arrtime 까지 검색

#교재 p176 실습 - hflights_df에서 출발 지연시간과 도착 지연시간의 차이를 계산한 컬럼 추가하기
mutate(hflights_df, gain = ArrDelay - DepDelay,
       gain_per_hour = gain / (AirTime / 60))

#교재 p177 실습 - mutate()함수에 의해 추가된 칼럼 보기
select(mutate(hflights_df, gain = ArrDelay - DepDelay,
              gain_per_hour = gain / (AirTime / 60)),
       Year, Month, ArrDelay, DepDelay, gain, gain_per_hour)

#교재 p177 실습 - hflights_df에서 비행시간의 평균 구하기
summarise(hflights_df, avgAirTime = mean(AirTime, na.rm = TRUE))

#교재 p178 실습 - hflights_df의 관측치 길이 구하기
summarise(hflights_df, cnt = n(),
          delay = mean(AirTime, na.rm = TRUE))

#교재 p178 실습 - 도착시간의 표준편차(sd)와 분산(var) 계산하기
summarise(hflights_df, arrTimeSd = sd(ArrTime, na.rm = TRUE),
          arrTimeVar = var(ArrTime, na.rm = T))
          
#교재 p178 실습 - 집단변수를 이용하여 그룹화하기
species <- group_by(iris, Species)
str(species)
species

#교재 p180 실습 - 공통변수를 이용하여 내부 조인하기 (공통만 조인)
df1 <- data.frame(x = 1:5, y = rnorm(5))
df2 <- data.frame(x = 2:6, z = rnorm(5))

df1
df2

inner_join(df1, df2, by = 'x') # 변수x를 기준으로 조인

#교재 p180 실습 - 공통변수를 이용하여 왼쪽 조인하기
left_join(df1, df2, by = 'x') #df1의 변수x를 기준으로 조인, 없는 값은 결측치(NA)

#교재 p181 실습 - 공통변수를 이용하여 오른쪽 조인하기
right_join(df1, df2, by = 'x') #df2의 변수x를 기준으로 조인, 없는 값은 결측치(NA)
 
#교재 p181 실습 - 공통변수를 이용하여 전체 조인하기 (그냥 다 조인, 없는 값은 결측치(NA))
full_join(df1, df2, by = 'x')

#교재 p182 실습 - 두 개의 데이터프레임을 행 단위로 합치기
df1 <- data.frame(x = 1:5, y = rnorm(5))
df2 <- data.frame(x = 6:10, y = rnorm(5))

df1
df2

df_rows <-bind_rows(df1, df2)
df_rows

#교재 p183 실습 - 두 개의 데이터프레임을 열 단위로 합치기
df_cols <-bind_cols(df1, df2)
df_cols

#교재 p183 실습 - 데이터프레임의 칼럼명 수정하기 (변경 후 칼럼명 = 변경 전 칼럼명)
df_rename <- rename(df_cols, x1 = x...1)
df_rename <- rename(df_rename, y1 = y...2)
df_rename <- rename(df_rename, x2 = x...3, y4 = y...4)

df_rename