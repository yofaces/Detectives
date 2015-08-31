# vers. 1.0
### ----- ��6�� ----- ###


# Code06-01
# �����Y����̖�����Q�f�[�^
kotaro <- read.csv(file.choose(), colClasses = c("numeric","factor","Date","factor","factor"))# "kotaro.csv"
# kotaro <- read.csv("Chapter06_proj/kotaro.csv", colClasses = c("numeric","factor","Date","factor","factor"))# "kotaro.csv"
# ���n��f�[�^�������̂ɕ֗��ȃp�b�P�[�W���C���X�g�[��
# install.packages("xts")
library("xts") 

# �f�[�^�ɓ��t��ݒ�
lostD <- seq(as.Date("2014-10-1"), as.Date("2015-5-30"), by = "days")
lost <- xts(kotaro$��Q�z, order.by = lostD, dateFormat = "Date")



## kotaro %>% group_by(�j��) %>% summarize (mean = mean (��Q�z), sd  = sd (��Q�z))# filter (�j�� == "���j��")
## kotaro %>% summary #summary (kotaro)

# �U���̃O���t����1
library(dplyr)
lost %>% plot (type = "l", main = "��������Q�z")
# plot(lost, type = "l", main = "��������Q�z")



# Code06-02
# �U���̃O���t����2
lost[1:31] %>% plot ( type = "l",main = "��������Q�z(10���j")#  plot(lost[1:30], type = "l",main = "��������Q�z(10���j")

# Code-06-03
# �����q����̍쐬�O���t�i2�T�Ԃ̎��������m�F�j
lost %>% acf #acf(lost)#





# �J�����_�[�O���t��ǉ����邽�߂ɕK�v�ȃp�b�P�[�W
# install.packages("openair")
## �Ȃ��C���X�g�[�����Ɂu ���p�ł���o�C�i���[�ł�����܂����\�[�X�ł͌�҂ł�:�v�Ɛq�˂��邱�Ƃ�����By��n�̂����ꂩ��I�Ԃ悤������邪�An �Ŗ��Ȃ�

library(openair)


# Code06-04
# �����q����̍쐬�O���t�i�J�����_�[�O���t�j
calendarPlot(kotaro, pollutant = "��Q�z", year = c("2014"))#�󋵂ɂ���ē��{�ꕔ���������������邱�Ƃ�����܂�


calendarPlot(kotaro, pollutant = "��Q�z", year = c("2015"))
# dev.off()

# ���W�X�e�B�b�N��A����
# �j�������j������n�܂�悤�Ƀf�[�^�̗���C��
kotaro$�j�� <- factor ( kotaro$�j��, levels = c( "���j��", "���j��", "�Ηj��", "���j��", "�ؗj��", "���j��", "�y�j��" ))
levels (kotaro$�j�� )

kotaro.glm <- kotaro %>% glm (���Q ~ �j�� + �s����, data = ., family = binomial)
# kotaro.glm <- glm (���Q ~ �j�� + �s����, data = kotaro, family = binomial)

kotaro.glm %>% summary
# summary (kotaro.glm)

# �I�b�Y����o��
kotaro.glm$coefficients %>% exp %>% round(2)
# round (exp(kotaro.glm$coefficients), 2)

###################################
## R�t���f�[�^�Ń��W�X�e�B�b�N��A����
data(birthwt, package = "MASS")

bw.glm <- birthwt %>% glm(low ~ age + lwt + race + smoke + ptl + ht + ui + ftv, data = .,family = binomial)
# bw.glm <- glm(low ~ age + lwt + race + smoke + ptl + ht + ui + ftv, data = birthwt,family = binomial)

bw.glm %>% summary 
# summary (bw.glm)

bw.glm$coefficients %>% exp %>%  round(2)

