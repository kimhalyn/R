#날짜: 2021/01/25
#이름: 김하린
#내용: Ch09.  정형과 비정형 데이터 처리 - 네이버키워드 시각화

library(KoNLP)
library(dplyr)
library(stringr)
library(wordcloud)

#데이터 불러오기
naver_keyword <- readLines('./file/naver_keyword.csv', encoding = 'UTF-8')
naver_keyword

#키워드 집계
naver_keyword_count <- table(unlist(naver_keyword))
naver_keyword_count

#데이터프레임 변환
df_naver <- as.data.frame(naver_keyword_count, stringsAsFactors = F)
View(df_naver)

#단어 시각화
wordcloud(words = df_naver$Var1,
          freq  = df_naver$Freq,
          min.freq = 2,
          max.words = 1000,
          random.order = F,
          scale = c(5, 0.8),
          colors = brewer.pal(12, 'Paired'))
