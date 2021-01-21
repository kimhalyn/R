#날짜: 2021/01/21
#이름: 김하린
#내용: Ch08.  고급 시각화 분석 - ggplot2 패키지  실습 교재 p259

install.packages('ggplot2')
library(ggplot2)

######################
#막대차트
######################
mtcars
View(mtcars)

#R 기본 막대차트
mtcars_cyl_table <- table(mtcars$cyl)
mtcars_cyl_table
barplot(mtcars_cyl_table)

##ggplot2 패키지 막대차트
qplot(data = mtcars, x=cyl, geom = 'bar')
ggplot(mtcars, aes(x=cyl)) + geom_bar()

######################
#라인차트
######################
economics
View(economics)

#R 기본 라인차트
plot(economics$date, economics$unemploy, type = 'l')

##ggplot2 패키지 라인인차트
qplot(data = economics, x = date, y = unemploy, geom = 'line')
ggplot(data = economics, aes(x=date, y=unemploy)) + geom_line()

######################
#박스상자
######################
mpg
View(mpg)

#R 기본 박스상자
boxplot(mpg$hwy ~ mpg$drv)

##ggplot2 패키지 박스상자
qplot(data = mpg, x=drv, y=hwy, geom = 'boxplot')
ggplot(data = mpg, aes(s=drv, y=hwy)) + geom_boxplot()

######################
#히스토그램
######################
iris

#R 기본 히스토그램
hist(iris$Sepal.Width)

##ggplot2 패키지 히스토그램
qplot(data = iris, x=Sepal.Width, geom = 'histogram')
ggplot(data = iris, aes(x=Sepal.Width)) + geom_histogram()

######################
#산점도
######################
iris

#R 기본 산점도
plot(iris[,3:4], col = iris$Species, pch=16)

##ggplot2 패키지 산점도도
qplot(data = iris, x=Petal.Length, y=Petal.Width, col=Species, geom = 'point')
ggplot(data = iris, aes(x=Petal.Length, y=Petal.Width, color=Species)) + geom_point()

