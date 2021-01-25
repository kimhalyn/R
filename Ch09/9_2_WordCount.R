#날짜: 2021/01/25
#이름: 김하린
#내용: Ch09.  정형과 비정형 데이터 처리 - 단어구름 시각화 교재 p301

install.packages("https://cran.seoul.go.kr/bin/windows/contrib/3.4/KoNLP_0.80.1.zip", repos = NULL) #한글의 형태소 분석 패키지
install.packages("Sejong")
install.packages('hash')
install.packages("rJava")
install.packages("tau")
install.packages("RSQLite")
install.packages("devtools")
install.packages("memories")
install.packages("dplyr")
install.packages("stringr")
install.packages("wordcloud")

library(KoNLP)
library(dplyr)
library(stringr)
library(wordcloud)

#텍스트 데이터 불러오기
txt_data <- readLines('./file/wordcloud_data.txt', encoding = 'UTF-8')
txt_data

#데이터 전처리(명사 추출)
txt_noun <- extractNoun(txt_data)
txt_noun

#단어 집계
txt_noun_count <- table(unlist(txt_noun))
txt_noun_count

#데이터프레임 변환
df_word <- as.data.frame(txt_noun_count, stringsAsFactors = F)
View(df_word)


#두 문자 이상의 단어만 정제
df_word <- filter(df_word, nchar(Var1) >= 2)
View(df_word)

#단어 시각화
wordcloud(words = df_word$Var1,
          freq  = df_word$Freq,
          min.freq = 2,
          max.words = 1000,
          random.order = F,
          scale = c(5, 0.8),
          colors = brewer.pal(12, 'Paired'))
