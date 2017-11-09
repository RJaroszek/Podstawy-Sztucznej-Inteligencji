close all; clear all; clc;

PR=[0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;   
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;];
%wejscia do sieci i min/max wartosci wejsc
S=20; %ilosc wyjsc z sieci

net = newff(PR,S,{'tansig'},'traingda'); 

   %A B C D E F G H I J K L N O P R S T U Y
WE=[0 1 0 1 1 1 0 1 1 1 1 1 1 0 1 1 0 1 1 1;
    1 1 1 1 1 1 1 0 0 1 0 0 0 1 1 1 1 1 0 0;
    1 1 1 1 1 1 1 0 0 1 0 0 0 1 1 1 1 1 0 1;
    0 0 1 0 1 1 1 1 0 1 1 0 1 0 0 0 1 0 1 0;%
    1 1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 0 1 1;
    0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0;
    0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1;
    1 1 0 1 0 0 0 1 0 1 0 0 1 1 1 1 0 0 1 0;%
    1 1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 0 0 1 0;
    1 1 0 0 1 1 0 1 0 0 1 0 0 0 1 1 1 1 0 1;
    1 1 0 0 1 1 1 1 0 0 0 0 1 0 1 1 1 0 0 0;
    1 0 0 1 0 0 1 1 0 1 0 0 1 1 0 0 0 0 1 0;%
    1 1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 0 0 1 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1;
    0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0;
    1 1 0 1 0 0 1 1 0 1 0 0 1 1 0 0 1 0 1 0;%
    1 1 1 1 1 1 0 1 1 0 1 1 1 0 1 1 1 0 0 0;
    0 1 1 1 1 0 1 0 0 0 0 1 0 1 0 0 1 1 1 1;
    0 1 1 1 1 0 1 0 0 0 0 1 0 1 0 0 1 0 1 0;
    1 0 1 0 1 0 1 1 0 1 1 1 1 0 0 1 0 0 0 0;%
    ];
   %A B C D E F G H I J K L N O P R S T U Y
WY=[1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; %A
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; %B
    0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; %C
    0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; %D
    0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; %E
    0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0; %F
    0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0; %G
    0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0; %H
    0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0; %I
    0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0; %J
    0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0; %K
    0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0; %L
    0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0; %N
    0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0; %O
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0; %P
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0; %R
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0; %S
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0; %T
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0; %U
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1; %Y
    ];

net.name='Rozroznianie liter';

%parametry treningu
net.trainParam.epochs = 10000; %max iloœæ epok
net.trainParam.mu = 0.001; %wspó³czynnik uczenia

net = train(net, WE, WY);%uczenie

%litery do testu: 
testa = [0; 1; 1; 0; %A
         1; 0; 0; 1;
         1; 1; 1; 1;
         1; 0; 0; 1;
         1; 0; 0; 1];
testb = [1; 1; 1; 0; %b
         1; 0; 0; 1;
         1; 1; 1; 0;
         1; 0; 0; 1;
         1; 1; 1; 0];
testc = [0; 1; 1; 1; %c
         1; 0; 0; 0;
         1; 0; 0; 0;
         1; 0; 0; 0;
         0; 1; 1; 1];
testd = [1; 1; 1; 0; %d
         1; 0; 0; 1;
         1; 0; 0; 1;
         1; 0; 0; 1;
         1; 1; 1; 0];
teste = [1; 1; 1; 1; %e
         1; 0; 0; 0;
         1; 1; 1; 0;
         1; 0; 0; 0;
         1; 1; 1; 1];
testf = [1; 1; 1; 1; %f
         1; 0; 0; 0;
         1; 1; 1; 0;
         1; 0; 0; 0;
         1; 0; 0; 0];
testg = [0; 1; 1; 1; %g
         1; 0; 0; 0;
         1; 0; 1; 1;
         1; 0; 0; 1;
         0; 1; 1; 1];
testh = [1; 0; 0; 1; %h
         1; 0; 0; 1;
         1; 1; 1; 1;
         1; 0; 0; 1;
         1; 0; 0; 1];
testi = [1; 0; 0; 0; %i
         1; 0; 0; 0;
         1; 0; 0; 0;
         1; 0; 0; 0;
         1; 0; 0; 0];
testj = [1; 1; 1; 1; %j
         0; 0; 0; 1;
         0; 0; 0; 1;
         1; 0; 0; 1;
         0; 1; 1; 1];
testk = [1; 0; 0; 1; %k
         1; 0; 1; 0;
         1; 1; 0; 0;
         1; 0; 1; 0;
         1; 0; 0; 1];
testl = [1; 0; 0; 0; %l
         1; 0; 0; 0;
         1; 0; 0; 0;
         1; 0; 0; 0;
         1; 1; 1; 1];
testn = [1; 0; 0; 1; %n
         1; 1; 0; 1;
         1; 0; 1; 1;
         1; 0; 0; 1;
         1; 0; 0; 1];     
testo = [0; 1; 1; 0; %o
         1; 0; 0; 1;
         1; 0; 0; 1;
         1; 0; 0; 1;
         0; 1; 1; 0];      
testp = [1; 1; 1; 0; %p
         1; 0; 0; 1;
         1; 1; 1; 0;
         1; 0; 0; 0;
         1; 0; 0; 0];     
testr = [1; 1; 1; 0; %r
         1; 0; 0; 1;
         1; 1; 1; 0;
         1; 0; 1; 0;
         1; 0; 0; 1];      
tests = [0; 1; 1; 1; %s
         1; 0; 0; 0;
         0; 1; 1; 0;
         0; 0; 0; 1;
         1; 1; 1; 0];
testt = [1; 1; 1; 0; %t
         0; 1; 0; 0;
         0; 1; 0; 0;
         0; 1; 0; 0;
         0; 1; 0; 0];
testu = [1; 0; 0; 1; %u
         1; 0; 0; 1;
         1; 0; 0; 1;
         1; 0; 0; 1;
         0; 1; 1; 0];     
testy = [1; 0; 1; 0; %y
         1; 0; 1; 0;
         0; 1; 0; 0;
         0; 1; 0; 0;
         0; 1; 0; 0]; 
%ksztalt nie wystepujacy w danych uczacych
test  = [0; 1; 0; 0; 
         1; 0; 1; 0;
         1; 1; 1; 1;
         1; 0; 0; 0;
         1; 0; 0; 0];     
     
efekt=sim(net, testa);%testowanie sieci
%testX gdzie x to litera

%szukanie najwiekszej wartosci
max=1;
for i=1:1:20
    if (efekt(max)<efekt(i))
        max=i;
    end;
end


%wypisywanie wartosci dla poszczegolnych liter
disp('Wartosci wyjsciowe algorytmu dla wszystkich liter:')
disp('A='),disp(efekt(1));
disp('B='),disp(efekt(2));
disp('C='),disp(efekt(3));
disp('D='),disp(efekt(4));
disp('E='),disp(efekt(5));
disp('F='),disp(efekt(6));
disp('G='),disp(efekt(7));
disp('H='),disp(efekt(8));
disp('I='),disp(efekt(9));
disp('J='),disp(efekt(10));
disp('K='),disp(efekt(11));
disp('L='),disp(efekt(12));
disp('N='),disp(efekt(13));
disp('O='),disp(efekt(14));
disp('P='),disp(efekt(15));
disp('R='),disp(efekt(16));
disp('S='),disp(efekt(17));
disp('T='),disp(efekt(18));
disp('U='),disp(efekt(19));
disp('Y='),disp(efekt(20));

%wypisywanie jaka to litera
switch max
    case 1
        disp('Wpisana litera to A')
    case 2
        disp('Wpisana litera to B')
    case 3
        disp('Wpisana litera to C')
    case 4
        disp('Wpisana litera to D')
    case 5
        disp('Wpisana litera to E')
    case 6
        disp('Wpisana litera to F')
    case 7
        disp('Wpisana litera to G')
    case 8
        disp('Wpisana litera to H')
    case 9
        disp('Wpisana litera to I')
    case 10
        disp('Wpisana litera to J')
    case 11
        disp('Wpisana litera to K')
    case 12
        disp('Wpisana litera to L')
    case 13
        disp('Wpisana litera to N')
    case 14
        disp('Wpisana litera to O')
    case 15
        disp('Wpisana litera to P')
    case 16
        disp('Wpisana litera to R')
    case 17
        disp('Wpisana litera to S')
    case 18
        disp('Wpisana litera to T')
    case 19
        disp('Wpisana litera to U')
    case 20
        disp('Wpisana litera to Y')
    otherwise
        disp('Blad dzialania programu')
end
