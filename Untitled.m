clc
clear all
%leemos los datos
load('C587_S1_P1.mat')
%separamos los datos de interes
for i=2:8
    Z(:,i-1)=cell2mat(Data(1,i));
end
%promediamos los datos similares
Masetero=(Z(:,1)+Z(:,2))/2;
Suprahidoideo=(Z(:,3)+Z(:,4))/2;
Infrahidoideo=(Z(:,5)+Z(:,6))/2;
fs=2000;
%separamos las señales en donde tienen mayor actividad para cada uno de los aspectos
%organizamos en un if las graficas
disp('opciones')
disp('1) Yogut 5ml')
disp('2) Yogut 10ml')
disp('3) Yogut 20ml')
disp('4) Saliva')
disp('5) Agua 5ml')
disp('6) Agua 10ml')
disp('7) Agua 20ml')
disp('8) Galleta')
lit=input('Ingrese aspecto a ver: ');
if lit==1
    
    %yogurt5ml
    MasYog5ml=Masetero(16001:28000);
    SupYog5ml=Suprahidoideo(16001:28000);
    InfYog5ml=Infrahidoideo(16001:28000);
    LYog5ml=length(MasYog5ml);
    tYog5ml=(0:LYog5ml-1)/fs;
    %graficamos en el dominio del tiempo
    figure('Name','yogurt 5mL')
    subplot(3,1,1)
    plot(tYog5ml,MasYog5ml)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,1,2)
    plot(tYog5ml,SupYog5ml)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,1,3)
    plot(tYog5ml,InfYog5ml)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    
    %graficamos en el dominio de la frecuencia 
    Y1=fft(MasYog5ml);
    Y2=fft(SupYog5ml);
    Y3=fft(InfYog5ml);
    P1 = abs(Y1/LYog5ml);
    P2 = abs(Y2/LYog5ml);
    P3 = abs(Y3/LYog5ml);
    py1 = P1(1:LYog5ml/2);
    py2 = P2(1:LYog5ml/2);
    py3 = P3(1:LYog5ml/2);
    f=fs*(1:LYog5ml/2)/LYog5ml;
    figure('Name','yogurt 5mL en el dominio de la frecuencia')
    subplot(3,1,1)
    plot(f,py1)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,1,2)
    plot(f,py2)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,1,3)
    plot(f,py3)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    
    %filtramos la señales para mejorar su calidad 
    [b a]=butter(3,[20 400]/(fs/2));
    MasYog5mlf=filter(b,a,MasYog5ml);
    SupYog5mlf=filter(b,a,SupYog5ml);
    InfYog5mlf=filter(b,a,InfYog5ml);
    Y1f=fft(MasYog5mlf);
    Y2f=fft(SupYog5mlf);
    Y3f=fft(InfYog5mlf);
    P1f = abs(Y1f/LYog5ml);
    P2f = abs(Y2f/LYog5ml);
    P3f = abs(Y3f/LYog5ml);
    py1f = P1f(1:LYog5ml/2);
    py2f = P2f(1:LYog5ml/2);
    py3f = P3f(1:LYog5ml/2);
    %graficamos 
    figure('Name','yogurt 5mL filtrada')
    subplot(3,2,1)
    plot(tYog5ml,MasYog5mlf)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,3)
    plot(tYog5ml,SupYog5mlf)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,5)
    plot(tYog5ml,InfYog5mlf)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,2)
    plot(f,py1f)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,2,4)
    plot(f,py2f)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,2,6)
    plot(f,py3f)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    
elseif lit==2
    
    %yogurt10ml
    MasYog10ml=Masetero(38001:50000);
    SupYog10ml=Suprahidoideo(38001:50000);
    InfYog10ml=Infrahidoideo(38001:50000);
    LYog10ml=length(MasYog10ml);
    tYog10ml=(0:LYog10ml-1)/fs;
    %graficamos en el dominio del tiempo
    figure('Name','yogurt 10mL')
    subplot(3,1,1)
    plot(tYog10ml,MasYog10ml)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,1,2)
    plot(tYog10ml,SupYog10ml)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,1,3)
    plot(tYog10ml,InfYog10ml)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    
    %graficamos en el dominio de la frecuencia 
    Y1=fft(MasYog10ml);
    Y2=fft(SupYog10ml);
    Y3=fft(InfYog10ml);
    P1 = abs(Y1/LYog10ml);
    P2 = abs(Y2/LYog10ml);
    P3 = abs(Y3/LYog10ml);
    py1 = P1(1:LYog10ml/2);
    py2 = P2(1:LYog10ml/2);
    py3 = P3(1:LYog10ml/2);
    f=fs*(1:LYog10ml/2)/LYog10ml;
    figure('Name','yogurt 10mL en el dominio de la frecuencia')
    subplot(3,1,1)
    plot(f,py1)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,1,2)
    plot(f,py2)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,1,3)
    plot(f,py3)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    
    %filtramos la señales para mejorar su calidad 
    [b a]=butter(3,[30 380]/(fs/2));
    MasYog10mlf=filter(b,a,MasYog10ml);
    SupYog10mlf=filter(b,a,SupYog10ml);
    InfYog10mlf=filter(b,a,InfYog10ml);
    Y1f=fft(MasYog10mlf);
    Y2f=fft(SupYog10mlf);
    Y3f=fft(InfYog10mlf);
    P1f = abs(Y1f/LYog10ml);
    P2f = abs(Y2f/LYog10ml);
    P3f = abs(Y3f/LYog10ml);
    py1f = P1f(1:LYog10ml/2);
    py2f = P2f(1:LYog10ml/2);
    py3f = P3f(1:LYog10ml/2);
    %graficamos 
    figure('Name','yogurt 10mL filtrada')
    subplot(3,2,1)
    plot(tYog10ml,MasYog10mlf)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,3)
    plot(tYog10ml,SupYog10mlf)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,5)
    plot(tYog10ml,InfYog10mlf)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,2)
    plot(f,py1f)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,2,4)
    plot(f,py2f)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,2,6)
    plot(f,py3f)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    
elseif lit==3
    
    %yogurt20ml
    MasYog20ml=Masetero(54001:72000);
    SupYog20ml=Suprahidoideo(54001:72000);
    InfYog20ml=Infrahidoideo(54001:72000);
    LYog20ml=length(MasYog20ml);
    tYog20ml=(0:LYog20ml-1)/fs;
    %graficamos en el dominio del tiempo
    figure('Name','yogurt 20mL')
    subplot(3,1,1)
    plot(tYog20ml,MasYog20ml)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,1,2)
    plot(tYog20ml,SupYog20ml)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,1,3)
    plot(tYog20ml,InfYog20ml)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')    
    
    %graficamos en el dominio de la frecuencia 
    Y1=fft(MasYog20ml);
    Y2=fft(SupYog20ml);
    Y3=fft(InfYog20ml);
    P1 = abs(Y1/LYog20ml);
    P2 = abs(Y2/LYog20ml);
    P3 = abs(Y3/LYog20ml);
    py1 = P1(1:LYog20ml/2);
    py2 = P2(1:LYog20ml/2);
    py3 = P3(1:LYog20ml/2);
    f=fs*(1:LYog20ml/2)/LYog20ml;
    figure('Name','yogurt 20mL en el dominio de la frecuencia')
    subplot(3,1,1)
    plot(f,py1)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,1,2)
    plot(f,py2)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,1,3)
    plot(f,py3)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    
    %filtramos la señales para mejorar su calidad 
    [b a]=butter(3,[30 380]/(fs/2));
    MasYog20mlf=filter(b,a,MasYog20ml);
    SupYog20mlf=filter(b,a,SupYog20ml);
    InfYog20mlf=filter(b,a,InfYog20ml);
    Y1f=fft(MasYog20mlf);
    Y2f=fft(SupYog20mlf);
    Y3f=fft(InfYog20mlf);
    P1f = abs(Y1f/LYog20ml);
    P2f = abs(Y2f/LYog20ml);
    P3f = abs(Y3f/LYog20ml);
    py1f = P1f(1:LYog20ml/2);
    py2f = P2f(1:LYog20ml/2);
    py3f = P3f(1:LYog20ml/2);
    %graficamos 
    figure('Name','yogurt 20mL filtrada')
    subplot(3,2,1)
    plot(tYog20ml,MasYog20mlf)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,3)
    plot(tYog20ml,SupYog20mlf)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,5)
    plot(tYog20ml,InfYog20mlf)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,2)
    plot(f,py1f)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,2,4)
    plot(f,py2f)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,2,6)
    plot(f,py3f)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    
elseif lit==4
    
    %Saliva
    MasSal=Masetero(82001:92000);
    SupSal=Suprahidoideo(82001:92000);
    InfSal=Infrahidoideo(82001:92000);
    LSal=length(MasSal);
    tSal=(0:LSal-1)/fs;
    %graficamos en el dominio del tiempo
    figure('Name','Saliva')
    subplot(3,1,1)
    plot(tSal,MasSal)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,1,2)
    plot(tSal,SupSal)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,1,3)
    plot(tSal,InfSal)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    
    %graficamos en el dominio de la frecuencia 
    Y1=fft(MasSal);
    Y2=fft(SupSal);
    Y3=fft(InfSal);
    P1 = abs(Y1/LSal);
    P2 = abs(Y2/LSal);
    P3 = abs(Y3/LSal);
    py1 = P1(1:LSal/2);
    py2 = P2(1:LSal/2);
    py3 = P3(1:LSal/2);
    f=fs*(1:LSal/2)/LSal;
    figure('Name','Saliva en el dominio de la frecuencia')
    subplot(3,1,1)
    plot(f,py1)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,1,2)
    plot(f,py2)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,1,3)
    plot(f,py3)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    
    %filtramos la señales para mejorar su calidad 
    [b a]=butter(3,[30 380]/(fs/2));
    MasSalf=filter(b,a,MasSal);
    SupSalf=filter(b,a,SupSal);
    InfSalf=filter(b,a,InfSal);
    Y1f=fft(MasSalf);
    Y2f=fft(SupSalf);
    Y3f=fft(InfSalf);
    P1f = abs(Y1f/LSal);
    P2f = abs(Y2f/LSal);
    P3f = abs(Y3f/LSal);
    py1f = P1f(1:LSal/2);
    py2f = P2f(1:LSal/2);
    py3f = P3f(1:LSal/2);
    %graficamos 
    figure('Name','Saliva filtrada')
    subplot(3,2,1)
    plot(tSal,MasSalf)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,3)
    plot(tSal,SupSalf)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,5)
    plot(tSal,InfSalf)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,2)
    plot(f,py1f)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,2,4)
    plot(f,py2f)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,2,6)
    plot(f,py3f)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    
elseif lit==5
    
    %agua 5ml
    MasAgu5ml=Masetero(96001:106000);
    SupAgu5ml=Suprahidoideo(96001:106000);
    InfAgu5ml=Infrahidoideo(96001:106000);
    LAgu5ml=length(MasAgu5ml);
    tAgu5ml=(0:LAgu5ml-1)/fs;
    %graficamos en el dominio del tiempo
    figure('Name','Agua 5mL')
    subplot(3,1,1)
    plot(tAgu5ml,MasAgu5ml)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,1,2)
    plot(tAgu5ml,SupAgu5ml)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,1,3)
    plot(tAgu5ml,InfAgu5ml)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    
    %graficamos en el dominio de la frecuencia 
    Y1=fft(MasAgu5ml);
    Y2=fft(SupAgu5ml);
    Y3=fft(InfAgu5ml);
    P1 = abs(Y1/LAgu5ml);
    P2 = abs(Y2/LAgu5ml);
    P3 = abs(Y3/LAgu5ml);
    py1 = P1(1:LAgu5ml/2);
    py2 = P2(1:LAgu5ml/2);
    py3 = P3(1:LAgu5ml/2);
    f=fs*(1:LAgu5ml/2)/LAgu5ml;
    figure('Name','Agua 5ml en el dominio de la frecuencia')
    subplot(3,1,1)
    plot(f,py1)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,1,2)
    plot(f,py2)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,1,3)
    plot(f,py3)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    
    %filtramos la señales para mejorar su calidad 
    [b a]=butter(3,[30 380]/(fs/2));
    MasAgu5mlf=filter(b,a,MasAgu5ml);
    SupAgu5mlf=filter(b,a,SupAgu5ml);
    InfAgu5mlf=filter(b,a,InfAgu5ml);
    Y1f=fft(MasAgu5mlf);
    Y2f=fft(SupAgu5mlf);
    Y3f=fft(InfAgu5mlf);
    P1f = abs(Y1f/LAgu5ml);
    P2f = abs(Y2f/LAgu5ml);
    P3f = abs(Y3f/LAgu5ml);
    py1f = P1f(1:LAgu5ml/2);
    py2f = P2f(1:LAgu5ml/2);
    py3f = P3f(1:LAgu5ml/2);
    %graficamos 
    figure('Name','Agua 5mL filtrada')
    subplot(3,2,1)
    plot(tAgu5ml,MasAgu5mlf)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,3)
    plot(tAgu5ml,SupAgu5mlf)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,5)
    plot(tAgu5ml,InfAgu5mlf)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,2)
    plot(f,py1f)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,2,4)
    plot(f,py2f)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,2,6)
    plot(f,py3f)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    
elseif lit==6
    
    %agua 10ml
    MasAgu10ml=Masetero(112001:122000);
    SupAgu10ml=Suprahidoideo(112001:122000);
    InfAgu10ml=Infrahidoideo(112001:122000);
    LAgu10ml=length(MasAgu10ml);
    tAgu10ml=(0:LAgu10ml-1)/fs;
    %graficamos en el dominio del tiempo
    figure('Name','Agua 10mL')
    subplot(3,1,1)
    plot(tAgu10ml,MasAgu10ml)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,1,2)
    plot(tAgu10ml,SupAgu10ml)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,1,3)
    plot(tAgu10ml,InfAgu10ml)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    
    %graficamos en el dominio de la frecuencia 
    Y1=fft(MasAgu10ml);
    Y2=fft(SupAgu10ml);
    Y3=fft(InfAgu10ml);
    P1 = abs(Y1/LAgu10ml);
    P2 = abs(Y2/LAgu10ml);
    P3 = abs(Y3/LAgu10ml);
    py1 = P1(1:LAgu10ml/2);
    py2 = P2(1:LAgu10ml/2);
    py3 = P3(1:LAgu10ml/2);
    f=fs*(1:LAgu10ml/2)/LAgu10ml;
    figure('Name','Agua 10ml en el dominio de la frecuencia')
    subplot(3,1,1)
    plot(f,py1)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,1,2)
    plot(f,py2)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,1,3)
    plot(f,py3)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    
    %filtramos la señales para mejorar su calidad 
    [b a]=butter(3,[30 380]/(fs/2));
    MasAgu10mlf=filter(b,a,MasAgu10ml);
    SupAgu10mlf=filter(b,a,SupAgu10ml);
    InfAgu10mlf=filter(b,a,InfAgu10ml);
    Y1f=fft(MasAgu10mlf);
    Y2f=fft(SupAgu10mlf);
    Y3f=fft(InfAgu10mlf);
    P1f = abs(Y1f/LAgu10ml);
    P2f = abs(Y2f/LAgu10ml);
    P3f = abs(Y3f/LAgu10ml);
    py1f = P1f(1:LAgu10ml/2);
    py2f = P2f(1:LAgu10ml/2);
    py3f = P3f(1:LAgu10ml/2);
    %graficamos 
    figure('Name','Agua 10mL filtrada')
    subplot(3,2,1)
    plot(tAgu10ml,MasAgu10mlf)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,3)
    plot(tAgu10ml,SupAgu10mlf)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,5)
    plot(tAgu10ml,InfAgu10mlf)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,2)
    plot(f,py1f)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,2,4)
    plot(f,py2f)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,2,6)
    plot(f,py3f)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    
elseif lit==7
    
    %agua 20ml
    MasAgu20ml=Masetero(128001:146000);
    SupAgu20ml=Suprahidoideo(128001:146000);
    InfAgu20ml=Infrahidoideo(128001:146000);
    LAgu20ml=length(MasAgu20ml);
    tAgu20ml=(0:LAgu20ml-1)/fs;
    %graficamos en el dominio del tiempo
    figure('Name','Agua 20mL')
    subplot(3,1,1)
    plot(tAgu20ml,MasAgu20ml)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,1,2)
    plot(tAgu20ml,SupAgu20ml)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,1,3)
    plot(tAgu20ml,InfAgu20ml)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')

    %graficamos en el dominio de la frecuencia 
    Y1=fft(MasAgu20ml);
    Y2=fft(SupAgu20ml);
    Y3=fft(InfAgu20ml);
    P1 = abs(Y1/LAgu20ml);
    P2 = abs(Y2/LAgu20ml);
    P3 = abs(Y3/LAgu20ml);
    py1 = P1(1:LAgu20ml/2);
    py2 = P2(1:LAgu20ml/2);
    py3 = P3(1:LAgu20ml/2);
    f=fs*(1:LAgu20ml/2)/LAgu20ml;
    figure('Name','Agua 20ml en el dominio de la frecuencia')
    subplot(3,1,1)
    plot(f,py1)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,1,2)
    plot(f,py2)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,1,3)
    plot(f,py3)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    
    %filtramos la señales para mejorar su calidad 
    [b a]=butter(3,[30 380]/(fs/2));
    MasAgu20mlf=filter(b,a,MasAgu20ml);
    SupAgu20mlf=filter(b,a,SupAgu20ml);
    InfAgu20mlf=filter(b,a,InfAgu20ml);
    Y1f=fft(MasAgu20mlf);
    Y2f=fft(SupAgu20mlf);
    Y3f=fft(InfAgu20mlf);
    P1f = abs(Y1f/LAgu20ml);
    P2f = abs(Y2f/LAgu20ml);
    P3f = abs(Y3f/LAgu20ml);
    py1f = P1f(1:LAgu20ml/2);
    py2f = P2f(1:LAgu20ml/2);
    py3f = P3f(1:LAgu20ml/2);
    %graficamos 
    figure('Name','Agua 20mL filtrada')
    subplot(3,2,1)
    plot(tAgu20ml,MasAgu20mlf)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,3)
    plot(tAgu20ml,SupAgu20mlf)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,5)
    plot(tAgu20ml,InfAgu20mlf)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,2)
    plot(f,py1f)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,2,4)
    plot(f,py2f)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,2,6)
    plot(f,py3f)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    
elseif lit==8
    
    %Galleta
    MasGal=Masetero(160001:215680);
    SupGal=Suprahidoideo(160001:215680);
    InfGal=Infrahidoideo(160001:215680);
    LGal=length(MasGal);
    tGal=(0:LGal-1)/fs;
    %graficamos en el dominio del tiempo
    figure('Name','Galleta')
    subplot(3,1,1)
    plot(tGal,MasGal)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,1,2)
    plot(tGal,SupGal)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,1,3)
    plot(tGal,InfGal)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    
    %graficamos en el dominio de la frecuencia 
    Y1=fft(MasGal);
    Y2=fft(SupGal);
    Y3=fft(InfGal);
    P1 = abs(Y1/LGal);
    P2 = abs(Y2/LGal);
    P3 = abs(Y3/LGal);
    py1 = P1(1:LGal/2);
    py2 = P2(1:LGal/2);
    py3 = P3(1:LGal/2);
    f=fs*(1:LGal/2)/LGal;
    figure('Name','Galleta en el dominio de la frecuencia')
    subplot(3,1,1)
    plot(f,py1)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,1,2)
    plot(f,py2)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,1,3)
    plot(f,py3)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    
    %filtramos la señales para mejorar su calidad 
    [b a]=butter(3,[30 380]/(fs/2));
    MasGalf=filter(b,a,MasGal);
    SupGalf=filter(b,a,SupGal);
    InfGalf=filter(b,a,InfGal);
    Y1f=fft(MasGalf);
    Y2f=fft(SupGalf);
    Y3f=fft(InfGalf);
    P1f = abs(Y1f/LGal);
    P2f = abs(Y2f/LGal);
    P3f = abs(Y3f/LGal);
    py1f = P1f(1:LGal/2);
    py2f = P2f(1:LGal/2);
    py3f = P3f(1:LGal/2);
    %graficamos 
    figure('Name','Galleta filtrada')
    subplot(3,2,1)
    plot(tGal,MasGalf)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,3)
    plot(tGal,SupGalf)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,5)
    plot(tGal,InfGalf)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Tiempo = s')
    subplot(3,2,2)
    plot(f,py1f)
    title('Masetero')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,2,4)
    plot(f,py2f)
    title('Suprahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    subplot(3,2,6)
    plot(f,py3f)
    title('Infrahidoideo')
    ylabel('Amplitud = mV')
    xlabel('Frecuencia = Hz')
    
else
    disp('opcion incorrecta')
end