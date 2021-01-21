#날짜: 2021/01/21
#이름: 김하린
#내용: Ch07.  EDA와 Data정제 - EDA  실습 교재 p194

#EDA(Exploratory Data Analysis): 데이터를 이해하기 위한 기초적인 분석단계

getwd()
df_exam <- read.csv('./file/exam.csv')
df_exam

#View()  - 데이터프레임 테이블로 출력
View(df_exam)

#head(), tail() - 상위, 하위 데이터 미리보기(기본 6개)
head(df_exam, 10)
tail(df_exam)

#dim() - 데이터프레임 구조확인(행, 열 개수)
dim(df_exam)

#str() - 데이터프레임 속성확인
str(df_exam)

#summary() - 데이터프레임 요약통계
summary(df_exam)

#sum()
sum(df_exam$math)
mean(df_exam$english)

#교재 p194 실습 - 실습용 데이터 가져오기
dataset <- read.csv('./file/exam_na.csv')

#교재 p194 실습 - 전체 데이터 보기
print(dataset)
View(dataset)

#교재 p195 실습 - 데이터의 앞부분과 뒷부분 보기
head(dataset) #상위 6개 데이터
tail(dataset) #하위 6개 데이터

#교재 p196 실습 - 데이터 셋 구조 보기
names(dataset) #열 이름 보기  
attributes(dataset) #  $names: 열 이름, #row.names: 행 이름
str(dataset) #자료구조, 자료 개수, 변수 개수 등 알 수 있음

#교재 p197 실습 - 다양한 방법으로 데이터 셋 조회하기
dataset$id
dataset$class
dataset$math
dataset$english
dataset$science

length(dataset$math) #데이터 개수 구하기
M <- dataset$math #기존 변수의 값을 새로운 데이터 셋에 저장
plot(M) #산점도로 나타내기

dataset["english"] #칼럼명을 사용하여 특정변수 조회
dataset[3] #index로 특정변수 조회(R은 인덱스번호가 1부터 시작함)

dataset[c("math", "science")]#2개 이상의 칼럼 조회
dataset[c(4, 5)]
dataset[c(3:5)]
dataset[c(1, 3:4, 2)]

dataset[ ,c(2:4)] #모든 행의 2~4열 값 조회
dataset[c(2:4)]

dataset[ ,-c(4:5)] # 4, 5열 제외하고 조회
dataset[-c(4:5)]

dataset[-c(4:5), ] #4, 5행 제외하고 조회 
