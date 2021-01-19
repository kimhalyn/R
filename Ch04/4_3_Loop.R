# 날짜 : 2021/01/19
# 이름 : 김하린
#내용 : Ch04.제어문과 함수 - 반복문 교재 p115

#교재 p115 실습 - for() 사용 기본
i <- c(1:10)
for(n in i){
  print(n * 10)
  print(n)
}

#교재 p116 실습 - 짝수 값만 출력하기
i <- c(1:10)
for(n in i){
  if(n %% 2 == 0) 
    print(n) 
} 
  

#교재 p116 실습 - 짝수이면 넘기고, 홀수 값만 출력하기
i <- c(1:10)
for(n in i) 
  if(n %% 2 == 0){
    next
  }else{
    print(n)
  }


#교재 p116 실습 - 변수의 칼럼명 출력하기
name <- c(names(exam)) #데이터프레임 exam에서 칼럼명 추출출
for(n in name){
print(n)
}

#교재 p117 실습 - 벡터 데이터 사용하기
score <- c(85, 95, 98)
name <- c("홍길동", "이순신", "강감찬")
i <-1  #변수 i를 name벡터의 첨자로 사용하기 위해 1로 초기화
for(s in score){
  cat(name[i], "->", s, "\n")
  i <- i + 1
}

#교재 p117 실습 - while() 사용하기
i = 0
while (i < 10) {
  i <- i + 1
  print(i)
}
