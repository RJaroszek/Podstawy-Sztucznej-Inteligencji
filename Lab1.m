close all; clear all; clc;
net = newp([0 1; 0 1], 1,'hardlim'); %perceptron
%bramka nand
WE=[0 0 1 1; %wartosc 1. wejscia
    0 1 0 1]; %wartosc 2. wejscia
WY=[1 1 1 0]; %wartosc wyniku NAND

net.name='Bramka NAND';
plotpv(WE,WY);%wykres z wynikami

%parametry treningu
net.trainParam.epochs = 15; %max ilo�� epok
net.trainParam.goal = 0.001; %b��d �redniokwadratowy
net.trainParam.mu = 0.001; %wsp�czynnik uczenia

net = train(net, WE, WY); %uczenie
plotpc(net.iw{1,1}, net.b{1})%rysuje granice decyzyjna
%iw - wartosci wag synaptycznych
%b - warto�� progu perceptronu

Y=sim(net, WE);%symulacja 
test = randi([0 1],2,randi(10));
%wylosowanie macierzy 2xN wypelnionej 0 i 1
efekt=sim(net, test);%testowanie perceptronu
test
efekt


