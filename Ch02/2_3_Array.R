# 날짜 : 2021/01/18
# 이름 : 김하린
# 내용 : Ch02. 데이터유형과 구조 - Array 자료구조 교재 p69

arr <- array(1:5)
arr
arr[1]

arr2d <-array(1:6, c(2,3)) #2행 3열짜리 배열을 만들어라라
arr2d

#교재 p69 실습 - 배열 객체 생성하기
vec <- c(1:12)
vec
arr <- array(vec, c(3, 2, 2)) # 3행, 2열, 2개 만들어라
arr

#교재 p69 실습 - 배열 객체의 자료 조회하기
arr[, , 1] #첫 번째 배열 객체 출력
arr[, , 2]
mode(arr);class(arr)
