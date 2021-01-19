# 날짜 : 2021/01/19
# 이름 : 김하린
# 내용 : Ch03. 데이터 입출력 - 데이터 저장하기 교재 p101

#작업 디렉터리 지정
getwd()
setwd('C:/Users/bigdata/workspace/R/file')

#데이터 파일로 저장하기

write.csv(titnic, 'github_titnic.csv', row.names = T)
