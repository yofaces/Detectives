# vers. 1.0
### ----- ��2�� -----###

# RStudio�̊�b
1 + 2
2 * 3 * 4
8 / 4 / 2


#�@�P����P�O�܂ł̐���
1:10
# ���̍��v
sum (1:10)
# ���̕���
mean (1:10)


# �܂��̓f�[�^�̓��͂���# �_�C�A���O����t�@�C����I��
 breads <- read.csv (file.choose()) 
## �t�@�C�������w�肵�Ă��悢�B�������t�@�C���̈ʒu�w��ɒ���
# breads <- read.csv ("Chapter02_proj/breads.csv")
## breads <- read.csv (file.choose())
# �`������������\��
head (breads)

# ���ϒl
mean (breads$weight)
# �W���΍�
sd (breads$weight)


# �W���΍��̈Ӗ�
# �q�X�g�O������`���Ă݂�
library (ggplot2)
ggplot (breads, aes(x = weight)) + geom_histogram(binwidth = 10, fill = "steelblue", colour="black",  alpha = 0.5) + xlab("�H�p���̏d��") + ylab ("��") + ggtitle("�H�p���̃q�X�g�O����")

## ���K���z (��������̊��Ғl�̗�)
mean (sample (1:6, 10,replace = TRUE))


## �T�C�R����100��U��V�~�����[�V������100000��J��Ԃ�
# 10����̎��s
res <- replicate(100000,  mean (sample(1:6, 100, replace = TRUE)))


# �V���v���ȃq�X�g�O����
hist(res)

# ���������Â����O���t�𐶐�
library(ggplot2)
# ���̂��߂Ƀf�[�^�𐮌`�@
saikoro <- data.frame(�T�C�R�� = res)
head (saikoro)


ggplot(saikoro, aes (x = �T�C�R��)) + geom_histogram(aes(y = ..density..),binwidth = .1, fill = "steelblue", colour="black",  alpha = 0.5) + xlab("���Ғl") + ylab ("") + ggtitle("�T�C�R���̕��ϒl�̕��ϒl") +   stat_function(geom="line", fun = dnorm, args=list(mean = mean (saikoro$�T�C�R��), sd = sd (saikoro$�T�C�R��)))
##  +stat_function�ȍ~�̕������A���K���z�̒ޏ��^�̋Ȑ���ǉ�����R�[�h

# �H�p���f�[�^�̓ǂݍ���
breads <- read.csv (file.choose())# "Chapter02_proj/breads.csv"
# �q�X�g�O�����Ɛ��K���z�𓖂Ă͂߂��Ȑ�
ggplot (breads, aes(x = weight))+ geom_histogram(aes(y = ..density..),binwidth = 10, fill = "steelblue", colour="black",  alpha = 0.5) + xlim(360, 430)  + xlab("�H�p���̏d��") + ylab ("��") + ggtitle("�H�p���̃q�X�g�O����") + stat_function(geom="line", fun = dnorm, args=list(mean = mean (breads$weight), sd = sd (breads$weight))) 
##  +stat_function�ȍ~�̕������A���K���z�̒ޏ��^�̋Ȑ���ǉ�����R�[�h

# ���ϒl�̍��̌���
t.test (breads$weight, mu = 400)

