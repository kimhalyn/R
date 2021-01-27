#날짜 : 2021/01/27
#이름 : 김하린
#내용 : Ch15.지도학습 - 회귀분석 실습 교재 p477

install.packages('UsingR')
library(UsingR)

#단순선형회귀
View(galton)

galton_model <- lm(galton$child ~ galton$parent, data = galton)
galton_model

#회귀방정식 시각화
plot(galton$child ~ galton$parent, data=galton)
abline(galton_model, col='red')

#예측
predict_galton <- function(x){
  y <- x * 0.6463 + 23.9415
  return(y)
}

predict_galton(70.3)
predict_galton(72.8)
predict_galton(80.1)
predict_galton(67.5)