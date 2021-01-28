#날짜 : 2021/01/28
#이름 : 김하린
#내용 : 대한민국 지역별 인구연령 분포 분석

########################################
#대한민국 지역별 인구연령 분포 분석
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

#데이터 불러오기
df_koweps <- read.csv('./file/koweps_2015.csv')
View(df_koweps)

#분석에 필요한 데이터프레임 가공처리
df_koweps <- df_koweps %>% select(h10_g3,
                                  h10_g4,
                                  h10_g10,
                                  h10_g11,
                                  h10_eco9,
                                  p1002_8aq1,
                                  h10_reg7)


df_koweps <- rename(df_koweps,
                    gender   = h10_g3,
                    birth    = h10_g4,
                    married  = h10_g10,
                    religion = h10_g11,
                    job      = h10_eco9,
                    income   = p1002_8aq1,
                    region   = h10_reg7)

View(df_koweps)

#지역코드를 갖는 데이터프레임 생성
#region
#1:서울, 2:수도권(경기/인천), 3:부산/경남, 4:대구/경북, 5:대전/충남, 6:강원/충북, 7:광주/전남/전북/제주
df_region_code <- data.frame(region=c(1:7),
                             name=c('서울', '수도권(경기/인천)', '부산/경남', '대구/경북', '대전/충남', '강원/충북', '광주/전남/전북/제주'))  

View(df_region_code)


#지역별 빈도표(도수분포표) 확인
table(df_koweps$region)

#지역코드 데이터프레임 조인
df_koweps <- left_join(df_koweps, df_region_code, by='region')
View(df_koweps)

#나이 파생변수 추가
df_koweps['age'] <- 2021 - df_koweps$birth + 1
View(df_koweps)

#나이대 파생변수 추가
df_koweps <- df_koweps %>% mutate(gen = ifelse(age < 30, 'young', 
                                               ifelse(age < 60, 'middle', 'old')))


View(df_koweps)

#지역별 나이세대 비율 그룹화
df_koweps <- df_koweps %>% group_by(name, gen) %>% 
  summarise(count=n()) %>% 
  mutate(total=sum(count)) %>% 
  mutate(per = round(count/total * 100, 2))

View(df_koweps)


#gen 순서 변경
df_koweps$gen <- factor(df_koweps$gen, levels = c('old', 'middle', 'young'))
View(df_koweps)

#시각화
ggplot(data=df_koweps, aes(x=name, y=per, fill=gen)) + geom_col()
