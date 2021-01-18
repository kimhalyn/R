# 날짜 : 2021/01/18
# 이름 : 김하린
# 내용 : Ch02. 데이터유형과 구조 - DataFrame 자료구조 교재 p71(매우 중요)

#데이터프레임 생성(표라고 생각하면 됨)
a <- c(1, 2)
b <- c(3, 4)
c <- c(T, F)

df1 <- data.frame(a, b, c)
df1

df2 <- data.frame(num=c(1, 2, 3),
                  name=c('김유신', '김춘추', '장보고'),
                  age=c(31, 29, 42))
df2

uid <- c('a101', 'a102', 'a103', 'a104', 'a105')
name <- c('김유신', '강감찬', '이순신', '장보고', '김춘추')
hp <- c('010-1234-1111',
        '010-1234-2222',
        '010-1234-3333',
        '010-1234-4444',
        '010-1234-5555')
pos <- c('과장', '부장', '대리', '사원', '과장')
dep <- c(101, 102, 103, 104, 105)

member_df <- data.frame(uid, name, hp, pos, dep)
member_df <- data.frame('아이디'=uid, 
                        '이름'=name, 
                        '휴대폰'=hp, 
                        '직급'=pos, 
                        '부서'=dep)
member_df

#데이터프레임 데이터 출력
df2$name[1] #1은 앞에 있는 순서번호
df2$name[3]

member_df$uid[3] #'$'는 데이터프레임의 참조연산자
member_df$pos[2]

#데이터프레임 필수 내장함수
iris
class(iris) #데이터 구조 확인함수
View(iris) #'V'대문자, 데이터프레임을 표(시각적)로 출력
head(iris) #데이터프레임의 상위 6개만 출력
tail(iris) #데이터프레임의 하위 6개만 출력
str(iris) #데이터프레임 컬럼의 자료유형을 확인
dim(iris) #데이터프레임 행열 구조 확인
ncol(iris)
nrow(iris)
names(iris) #데이터프레임의 속성(컬럼명) 확인
summary(iris) #데이터프레임 요약통계 확인

#교재 p72 실습 - 벡터를 이용한 데이터프레임 객체 생성하기
no <- c(1, 2, 3)
name <- c('kim', 'lee', 'park')
pay <- c(150, 250, 300)
vemp <- data.frame(No = no, Name = name, Pay = pay )
vemp

#교재 p72 실습 - matrix를 이용한 데이터프레임 객체 생성하기
m <- matrix(
  c(1, "hong", 150,
    2, "lee", 250,
    3, "kim", 300), 3, by=T) #행 우선 생성 (default -> 열 기준, False)
memp <- data.frame(m)
memp

#교재 p73 실습 - 데이터프레임 만들기
df <- data.frame(x = c(1:5), y = seq(2, 10, 2), z = c('a', 'b', 'c', 'd', 'e'))
df

#교재 p73 실습 - 데이터프레임의 칼럼명 참조하기
df$x

#교재 p74 실습 - 데이터프레임의 자료구조, 열수, 행수, 칼럼명 보기
str(df)
ncol(df)
nrow(df)
names(df)
df[c(2:3), 1] #2,3행의 1열 값 출력

#교재 p74 실습 - 요약통계량 보기
summary(df)

#교재 p75 실습 - 데이터프레임 자료에 함수 적용하기 *apply(데이터프레임, 행(1)/열(2), 함수)
apply(df[ , c(1,2)], 2, sum)

#교재 p75 실습 - 데이터 프레임 부분 객체 만들기
x1 <- subset(df, x>=3)
x1

y1 <- subset(df, y<=8)
xyand <- subset(df, x>=2 & y<=6)
xyor <- subset(df, x>=2 | y<=6)
y1
xyand
xyor

#교재 p76 실습 - student 데이터프레임 만들기
sid=c("A","B","c","D")
score=c(90, 80, 70, 60)
subject=c("컴퓨터","국문","소프트웨어","유아교육육")

student <- data.frame(SID=sid, SCORE=score, SUBJECT=subject)
student

#교재 p77 실습 - 두 개 이상의 데이터프레임 병합하기
height <- data.frame(id=c(1,2), h=c(180,175))
weight <- data.frame(id=c(1,2), w=c(80,75))
user <- merge(height, weight, by.x="id", by.y="id")
user
