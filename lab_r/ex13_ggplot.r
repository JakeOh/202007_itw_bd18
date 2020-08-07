library(tidyverse)

mpg <- as.data.frame(ggplot2::mpg)
head(mpg)

# 카테고리(범주형) 변수의 빈도수
# drv별 자동차 모델 수
table(mpg$drv)
mpg %>% 
  group_by(drv) %>% 
  summarise(n = n())

# 막대 그래프(bar plot): 카테고리 변수의 빈도수를 막대로 표현.
# geom_bar()에서 x축 mapping만 설정하면, 자동으로 빈도수를 계산.
ggplot(data = mpg) +
  geom_bar(mapping = aes(x = drv, fill = drv))
# geom_bar()의 aesthetic mapping 중에서
# 1) color = 막대 테두리 색깔
# 2) fill = 막대 안쪽을 채우는 색깔

# group_by, summarize를 사용해서 class별 자동차 모델 수를 찾으세요.
# ggplot을 사용해서 class의 막대 그래프 그려보세요.
table(mpg$class)
mpg %>% 
  group_by(class) %>% 
  summarise(n = n())

ggplot(data = mpg) +
  geom_bar(mapping = aes(x = class))

# class별, drv별 자동차 모델 수
mpg %>% 
  group_by(class, drv) %>% 
  summarise(n = n())

ggplot(data = mpg) +
  geom_bar(mapping = aes(x = class, fill = drv))

ggplot(data = mpg) +
  geom_bar(mapping = aes(x = class, fill = drv),
           position = 'dodge')

ggplot(data = mpg) +
  geom_bar(mapping = aes(x = class, fill = drv),
           position = 'fill')

# geom_bar()의 position argument:
# 1) position = 'stack': 기본값(생략 가능)
#    막대들을 위로 쌓아올리는 방식으로 그림.
# 2) position = 'dodge': 막대들을 옆으로 나란히 그림.
# 3) position = 'fill': 비율로 막대를 채우는 그림.

# 가로 막대 그래프
ggplot(data = mpg) +
  geom_bar(mapping = aes(y = class, fill = drv))

ggplot(data = mpg) +
  geom_bar(mapping = aes(y = class, fill = drv),
           position = 'fill')


# 카테고리 변수별 연속형 변수의 요약 통계량을 막대 그래프.
# drv(구동 방식)별 hwy(고속도로 연비)의 평균
mpg_by_drv <- mpg %>% 
  group_by(drv) %>% 
  summarise(avg = mean(hwy))

ggplot(data = mpg_by_drv) +
  geom_col(mapping = aes(x = drv, y = avg))

ggplot(data = mpg_by_drv) +
  geom_col(mapping = aes(x = avg, y = drv))

# class별 hwy의 평균을 계산한 데이터 프레임을 생성.
# 위에서 생성된 데이터 프레임 사용해서 막대 그래프.
mpg_by_class <- mpg %>% 
  group_by(class) %>% 
  summarise(mean_hwy = mean(hwy))

mpg_by_class

ggplot(data = mpg_by_class) +
  geom_col(mapping = aes(x = class, y = mean_hwy))
