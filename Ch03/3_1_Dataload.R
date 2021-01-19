# 날짜 : 2021/01/19
# 이름 : 김하린
# 내용 : Ch03. 데이터 입출력 - 데이터 불러오기 교재 p95

#작업 디렉터리 지정
getwd()
setwd('C:/Users/bigdata/workspace/R/file')

#컬럼명이 없는 파일 불러오기
student <- read.table('student.txt')
student
class(student)

#컬럼명 지정
names(student) <- c("번호", "이름","키", "몸무게")
student

#컬럼명이 있는 파일 불러오기 -> 컬럼명이 데이터로 인식하여 로드됨
student1 <- read.table('student1.txt')
student1

#헤더옵션으로 컬럼명 따로 분리
student1 <- read.table('student1.txt', header = T)
student1

#구분자가 있는 파일 불러오기(세미콜론;으로 데이터 구분)
student2 <- read.table('student2.txt', header = T)
student2

student2 <- read.table('student2.txt', sep = ';', header = T)
student2

#결측값을 포함하는 파일 불러오기
student3 <- read.table('student3.txt', header = T, na.strings = '-')
student3

#csv파일 불러오기
student4 <- read.csv('student4.txt', header = T, sep = ',', na.strings = '-')
student4

#Excel 불러오기
install.packages('readxl')
library(readxl)

student_excel <- read_excel('studentexcel.xlsx')
student_excel

#인터넷 파일 불러오기
titanic <- read.csv('https://gist.githubusercontent.com/michhar/2dfd2de0d4f8727f873422c5d959fff5/raw/fa71405126017e6a37bea592440b4bee94bf7b9e/titanic.csv')
titanic
View(titanic)

#관측치 살펴보기
head(titanic)
tail(titanic)

#교차 분할표
tab <- table(titanic$Survived, titanic$Sex) #성별에 따른 생존 여부
tab

#시각화
barplot(tab, col=rainbow(2), main="성별에 따른 생존 여부")
