clc
clear all
close all

I = im2double(imread('test.png'));
[CENTS1,Is1,C1] = KmeanSegmentation(4,I(1:10,1:10,:));
[CENTS2,Is2,C2] = KmeanSegmentation(4,I(11:20,1:10,:));



[as,f3] = IOCCD(C1,C2,CENTS1,CENTS2);


