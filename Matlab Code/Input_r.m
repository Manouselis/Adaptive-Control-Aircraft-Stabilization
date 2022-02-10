%Panteleimon Manouselis 
%Function created for Second Exercise of Intelligent and Adaptive Systems
function r = Input_r(t)
if(t<1&&t>=0)
    r=0*pi/180;
elseif(t<10&&t>=1)
    r=5*pi/180;
elseif(t<22&&t>=10)
    r=0*pi/180;
elseif(t<35&&t>=22)
    r=-5*pi/180;
elseif(t<45&&t>=35)
    r=0*pi/180;
elseif(t<55&&t>=45)
    r=10*pi/180;
elseif(t<65&&t>=55)
    r=0*pi/180;
elseif(t<75&&t>=65)
    r=-10*pi/180;
elseif(t<90&&t>=75)
    r=0*pi/180;
elseif(t<98&&t>=90)
    r=5*pi/180;
elseif(t<110&&t>=98)
    r=0*pi/180;
elseif(t<120&&t>=110)
    r=-5*pi/180;
elseif(t<=140&&t>=120)
    r=0*pi/180;
else
    r=0*pi/180;
    display('Stop the Simulation somewhere you exceeded the time limit');
end

