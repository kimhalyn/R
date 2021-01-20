#날짜: 2021/01/20
#이름: 김하린
#내용: Ch06. 데이터 조작 - reshape2패키지 실습 교재 p184
#reshape2 패키지 - 데이터의 구조를 유연하게 변경

install.packages('reshape2')
library(reshape2)

data <- ('smiths')
smiths

#넓은 형식의 smiths 데이터 셋을 긴 형식으로 변경
long <- melt(id=1:2, smiths)
long

#긴 형식을 넓은 형식으로 변경
dcast(long, subject + time~ ...)

#3차원 배열 형식으로 변경
data('airquality')
airquality
str(airquality)

#칼럼 제목 대문자로 일괄 변경
names(airquality) <- toupper(names(airquality))
head(airquality)

#데이터 셋을 긴 형식으로 변경
air_melt <- melt(airquality, id=c('MONTH', 'DAY'), na.rm=TRUE)
head(air_melt)

#acast()함수를 이용하여 3차원으로 구조 변경하기
names(air_melt) <- tolower(names(air_melt))
head(air_melt)

acast(air_melt, day ~ month ~ variable)
