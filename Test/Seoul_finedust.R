#날짜 : 2021/01/28
#이름 : 김하린
#내용 : 데이터분석 실습

###############################
#서울시 미세먼지 데이터 분석

install.packages('readxl')
library(readxl)
library(dplyr)


#데이터 불러오기
df_seoul_find_dust <- read_excel('./file/seoul_fine_dust.xlsx')
View(df_seoul_find_dust)


#비교할 지역 데이터만 가공처리
df_area <- df_seoul_find_dust %>% filter(region == '강남구' | region == '강북구')
View(df_area)

#강남구, 강북구 데이터프레임 나누기
df_area_gn = subset(df_area, region == '강남구')
df_area_gb = subset(df_area, region == '강북구')

View(df_area_gn)
View(df_area_gb)  

#요약통계 확인
summary(df_area_gn)
summary(df_area_gb)

#박스상자 시각화
boxplot(df_area_gn$finedust,
        df_area_gb$finedust,
        names = c('강남구', '강북구'),
        xlab='Region',
        ylab='PM')

#가설검정
#귀무가설:강남구와 강북구의 미세먼지 농도 차이가 없다.
#대립가설:강남구와 강북구의 미세먼지 농도 차이가 있다.

t.test(data=df_area, finedust ~ region)

#결론
#p-value가 0.06693이므로 유의수준 0.05(95%신뢰수준)보다 크므로 귀무가설을 채택한다.
#따라서 강남구와 강북구의 미세먼지 평균 차이는 없다. 