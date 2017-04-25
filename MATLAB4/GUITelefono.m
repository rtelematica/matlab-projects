function varargout = GUITelefono(varargin)
% GUITELEFONO M-file for GUITelefono.fig
%      GUITELEFONO, by itself, creates a new GUITELEFONO or raises the existing
%      singleton*.
%
%      H = GUITELEFONO returns the handle to a new GUITELEFONO or the handle to
%      the existing singleton*.
%
%      GUITELEFONO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUITELEFONO.M with the given input arguments.
%
%      GUITELEFONO('Property','Value',...) creates a new GUITELEFONO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUITelefono_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUITelefono_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUITelefono

% Last Modified by GUIDE v2.5 10-Sep-2012 23:21:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUITelefono_OpeningFcn, ...
                   'gui_OutputFcn',  @GUITelefono_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUITelefono is made visible.
function GUITelefono_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUITelefono (see VARARGIN)

% Choose default command line output for GUITelefono
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUITelefono wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUITelefono_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%% 


% --- Executes on button press in t1.
function t1_Callback(hObject, eventdata, handles)
% hObject    handle to t1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    filaf = [697,770,852,941];
    coluf = [1209,1336,1447];

    fs=8000; %frecuencia de muestre del teléfono
    tn=[0:1/fs:0.04]; %vector de tiempo para las señales numéricas %40 ms

    %Definimosla señal de cada dígito

    % tecla uno
    s1 = 0.5*[sin(2*pi*filaf(1)*tn)+sin(2*pi*coluf(1)*tn)];
    % oscilograma
    %grafica en el dominio del tiempo
    axes(handles.oscilograma); 
    cla; 
    plot(tn,s1/max(s1));  % señal normalizada
    title('Oscilograma de la señal numérica al teclear "1"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1209 Hz');
    % espectograma
        %transformada de fourier 
        ffts1 = fftshift(fft(s1));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts1)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectrograma); 
    cla; 
    plot(frec,abs((ffts1)/max(ffts1))); %espectro normalizado
    title('Espectro de la señal numérica al teclear "1"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s1,fs);



% --- Executes on button press in t2.
function t2_Callback(hObject, eventdata, handles)
% hObject    handle to t2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    % tecla dos

    filaf = [697,770,852,941];
    coluf = [1209,1336,1447];

    fs=8000; %frecuencia de muestre del teléfono
    tn=[0:1/fs:0.04]; %vector de tiempo para las señales numéricas %40 ms

    s2 = 0.5*[sin(2*pi*filaf(1)*tn)+sin(2*pi*coluf(2)*tn)];
    % oscilograma
    axes(handles.oscilograma); 
    cla; 
    plot(tn,s2/max(s2));
    title('Oscilograma de la señal numérica al teclear "2"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts2 = fftshift(fft(s2));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts2)); 
    axes(handles.espectrograma); 
    cla; 
    plot(frec,abs((ffts2)/max(ffts2)));
    title('Espectro de la señal numérica al teclear "2"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s2,fs);

% --- Executes on button press in t3.
function t3_Callback(hObject, eventdata, handles)
% hObject    handle to t3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    filaf = [697,770,852,941];
    coluf = [1209,1336,1447];

    fs=8000; %frecuencia de muestre del teléfono
    tn=[0:1/fs:0.04]; %vector de tiempo para las señales numéricas %40 ms

    % tecla tres
    s3 = [sin(2*pi*filaf(1)*tn)+sin(2*pi*coluf(3)*tn)];
    % oscilograma
    axes(handles.oscilograma); 
    cla; 
    plot(tn,s3/max(s3));
    title('Oscilograma de la señal numérica al teclear "3"'),xlabel('t(s)'),ylabel('Suma de senos de 697 Hz y 1447 Hz');
    % espectograma
        %transformada de fourier 
        ffts3 = fftshift(fft(s3));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts3)); 
    axes(handles.espectrograma); 
    cla; 
    plot(frec,abs((ffts3)/max(ffts3)));
    title('Espectro de la señal numérica al teclear "3"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s3,fs);


% --- Executes on button press in t4.
function t4_Callback(hObject, eventdata, handles)
% hObject    handle to t4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filaf = [697,770,852,941];
coluf = [1209,1336,1447];

fs=8000; %frecuencia de muestre del teléfono
tn=[0:1/fs:0.04]; %vector de tiempo para las señales numéricas %40 ms

% tecla cuatro
s4 = 0.5*[sin(2*pi*filaf(2)*tn)+sin(2*pi*coluf(1)*tn)];
    % oscilograma
    
    axes(handles.oscilograma); 
    cla; 
    plot(tn,s4/max(s4));
    title('Oscilograma de la señal numérica al teclear "4"'),xlabel('t(s)'),ylabel('Suma de senos de 770 Hz y 1209 Hz');
    % espectograma
        %transformada de fourier 
        ffts4 = fftshift(fft(s4));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts4)); 
    axes(handles.espectrograma); 
    cla; 
    plot(frec,abs((ffts4)/max(ffts4)));
    title('Espectograma de la señal numérica al teclear "4"'),xlabel('f(Hz)'),ylabel('Espectograma de la señal');
    sound(s4,fs);

% --- Executes on button press in t5.
function t5_Callback(hObject, eventdata, handles)
% hObject    handle to t5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
coluf = [1209,1336,1447];

fs=8000; %frecuencia de muestre del teléfono
tn=[0:1/fs:0.04]; %vector de tiempo para las señales numéricas %40 ms

% tecla cinco    
s5 = 0.5*[sin(2*pi*filaf(2)*tn)+sin(2*pi*coluf(2)*tn)];
    % oscilograma
    
    axes(handles.oscilograma); 
    cla; 
    plot(tn,s5/max(s5));
    title('Oscilograma de la señal numérica al teclear "5"'),xlabel('t(s)'),ylabel('Suma de senos de 770 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts5 = fftshift(fft(s5));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts5)); 
    axes(handles.espectrograma); 
    cla; 
    plot(frec,abs((ffts5)/max(ffts5)));
    title('Espectograma de la señal numérica al teclear "5"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s5,fs);


% --- Executes on button press in t6.
function t6_Callback(hObject, eventdata, handles)
% hObject    handle to t6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filaf = [697,770,852,941];
coluf = [1209,1336,1447];

fs=8000; %frecuencia de muestre del teléfono
tn=[0:1/fs:0.04]; %vector de tiempo para las señales numéricas %40 ms

% tecla seis    
s6 =0.5* [sin(2*pi*filaf(2)*tn)+sin(2*pi*coluf(3)*tn)];
    % oscilograma
    
    axes(handles.oscilograma); 
    cla; 
    plot(tn,s6/max(s6));
    title('Oscilograma de la señal numérica al teclear "6"'),xlabel('t(s)'),ylabel('Suma de senos de 770 Hz y 1447 Hz');
    % espectograma
        %transformada de fourier 
        ffts6 = fftshift(fft(s6));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts6)); 
    axes(handles.espectrograma); 
    cla; 
    plot(frec,abs((ffts6)));
    title('Espectograma de la señal numérica al teclear "6"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s6,fs);



% --- Executes on button press in t7.
function t7_Callback(hObject, eventdata, handles)
% hObject    handle to t7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filaf = [697,770,852,941];
coluf = [1209,1336,1447];

fs=8000; %frecuencia de muestre del teléfono
tn=[0:1/fs:0.04]; %vector de tiempo para las señales numéricas %40 ms

% tecla siete
s7 = 0.5*[sin(2*pi*filaf(3)*tn)+sin(2*pi*coluf(1)*tn)];
    % oscilograma
    
    axes(handles.oscilograma); 
    cla; 
    plot(tn,s7/max(s7));
    title('Oscilograma de la señal numérica al teclear "7"'),xlabel('t(s)'),ylabel('Suma de senos de 852 Hz y 1209 Hz');
    % espectograma
        %transformada de fourier 
        ffts7 = fftshift(fft(s7));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts7)); 
    axes(handles.espectrograma); 
    cla; 
    plot(frec,abs((ffts7)/max(ffts7)));
    title('Espectrograma de la señal numérica al teclear "7"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s7,fs);



% --- Executes on button press in t8.
function t8_Callback(hObject, eventdata, handles)
% hObject    handle to t8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  filaf = [697,770,852,941];
coluf = [1209,1336,1447];

fs=8000; %frecuencia de muestre del teléfono
tn=[0:1/fs:0.04]; %vector de tiempo para las señales numéricas %40 ms

% tecla ocho    
s8 = [sin(2*pi*filaf(3)*tn)+sin(2*pi*coluf(2)*tn)];
    % oscilograma
    
    axes(handles.oscilograma); 
    cla; 
    plot(tn,s8/max(s8));
    title('Oscilograma de la señal numérica al teclear "8"'),xlabel('t(s)'),ylabel('Suma de senos de 852 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts8 = fftshift(fft(s8));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts8)); 
    axes(handles.espectrograma); 
    cla; 
    plot(frec,abs((ffts8)/max(ffts8)));
    title('Espectrograma de la señal numérica al teclear "8"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s8,fs);


% --- Executes on button press in t9.
function t9_Callback(hObject, eventdata, handles)
% hObject    handle to t9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filaf = [697,770,852,941];
coluf = [1209,1336,1447];

fs=8000; %frecuencia de muestre del teléfono
tn=[0:1/fs:0.04]; %vector de tiempo para las señales numéricas %40 ms

% tecla nueve    
s9 = [sin(2*pi*filaf(3)*tn)+sin(2*pi*coluf(3)*tn)];
    % oscilograma
    
    axes(handles.oscilograma); 
    cla; 
    plot(tn,s9/max(s9));
    title('Oscilograma de la señal numérica al teclear "9"'),xlabel('t(s)'),ylabel('Suma de senos de 852 Hz y 1447 Hz');
    % espectograma
        %transformada de fourier 
        ffts9 = fftshift(fft(s9));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts9)); 
    axes(handles.espectrograma); 
    cla; 
    plot(frec,abs((ffts9)/max(ffts9)));
    title('Espectrograma de la señal numérica al teclear "9"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s9,fs);


% --- Executes on button press in tast.
function tast_Callback(hObject, eventdata, handles)
% hObject    handle to tast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filaf = [697,770,852,941];
coluf = [1209,1336,1447];

fs=8000; %frecuencia de muestre del teléfono
tn=[0:1/fs:0.04]; %vector de tiempo para las señales numéricas %40 ms

% tecla asterisco
sas =0.5*[sin(2*pi*filaf(4)*tn)+sin(2*pi*coluf(1)*tn)]; 
    % oscilograma
    
    axes(handles.oscilograma); 
    cla; 
    plot(tn,sas);
    title('Oscilograma de la señal numérica al teclear "asterisco"'),xlabel('t(s)'),ylabel('Suma de senos de 941 Hz y 1209 Hz');
    % espectograma
        %transformada de fourier 
        fftsas = fftshift(fft(sas));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(fftsas)); 
    axes(handles.espectrograma); 
    cla; 
    plot(frec,abs((fftsas)/max(fftsas)));
    title('Espectograma de la señal numérica al teclear "asterisco"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(sas,fs);



% --- Executes on button press in t0.
function t0_Callback(hObject, eventdata, handles)
% hObject    handle to t0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    filaf = [697,770,852,941];
    coluf = [1209,1336,1447];

    fs=8000; %frecuencia de muestre del teléfono
    tn=[0:1/fs:0.04]; %vector de tiempo para las señales numéricas %40 ms

    % tecla cero
    s0 = 0.5*[sin(2*pi*filaf(4)*tn)+sin(2*pi*coluf(2)*tn)];
    % oscilograma
    axes(handles.oscilograma); 
    cla; 
    plot(tn,s0);
    title('Oscilograma de la señal numérica al teclear "0"'),xlabel('t(s)'),ylabel('Suma de senos de 941 Hz y 1336 Hz');
    % espectograma
        %transformada de fourier 
        ffts0 = fftshift(fft(s0));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(ffts0)); 
    axes(handles.espectrograma); 
    cla; 
    plot(frec,abs((ffts0)/max(ffts0)));
    title('Espectrograma de la señal numérica al teclear "0"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(s0,fs);
    


% --- Executes on button press in tgat.
function tgat_Callback(hObject, eventdata, handles)
% hObject    handle to tgat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filaf = [697,770,852,941];
coluf = [1209,1336,1447];

fs=8000; %frecuencia de muestre del teléfono
tn=[0:1/fs:0.04]; %vector de tiempo para las señales numéricas %40 ms

% tecla gato
sg = 0.5*[sin(2*pi*filaf(4)*tn)+sin(2*pi*coluf(3)*tn)];
    % oscilograma
    
    axes(handles.oscilograma); 
    cla; 
    plot(tn,sg);
    title('Oscilograma de la señal numérica al teclear "gato"'),xlabel('t(s)'),ylabel('Suma de senos de 941 Hz y 1447 Hz');
    % espectograma
        %transformada de fourier 
        fftsg = fftshift(fft(sg));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(fftsg)); 
    axes(handles.espectrograma); 
    cla; 
    plot(frec,abs((fftsg)/max(fftsg)));
    title('Espectograma de la señal numérica al teclear "gato"'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(sg,fs);


% --- Executes during object creation, after setting all properties.
function oscilograma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oscilograma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate oscilograma


% --- Executes during object creation, after setting all properties.
function espectrograma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to espectrograma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate espectrograma


% --- Executes on button press in invitacion.
function invitacion_Callback(hObject, eventdata, handles)
% hObject    handle to invitacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fs=8000; %frecuencia de muestreo del teléfono
fsa = 425; %frecuencia de las señalizaciones acústicas
% Tono de invitación a marcar
  
    %_____________________________________ 425 Hz
  
    tiam = [0:1/fs:8] %tiempo de tono i.a.m. % tiempo indefinido : escogemmos 5s
  
  
    siam =0.5* sin(2*pi*fsa*tiam);
    % oscilograma
    
    %gráfica en el dominio del tiempo
    axes(handles.oscilograma); 
    cla; 
    plot(tiam,siam/max(siam)); %señal normalizada
    title('Oscilograma del tono de invitación a marcar"'),xlabel('t(s)'),ylabel('Señal acústica');
    % espectograma
        %transformada de fourier 
        fftsiam = fftshift(fft(siam));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(fftsiam)); 
    %gráfica en el dominio de la frecuencia
    axes(handles.espectrograma); 
    cla; 
    plot(frec,abs((fftsiam)/max(fftsiam))); %espectro normalizado
    title('Espectro del tono de invitación a marcar'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(siam,fs);


% --- Executes on button press in llamada.
function llamada_Callback(hObject, eventdata, handles)
% hObject    handle to llamada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fs=8000; %frecuencia de muestreo del teléfono
fsa = 425; %frecuencia de las señalizaciones acústicas
% Tono de llamada
  
    %1s ____ 4s             1s____ 425 Hz
  
    tllon = [0:1/fs:1] %tiempo de tono i.a.m. % tiempo indefinido : escogemmos 5s
    tlloff= [0:1/fs:4]
  
    sllon = sin(2*pi*fsa*tllon);
    slloff= zeros(1,length(tlloff));    
    sll = [sllon,slloff,sllon,slloff,sllon,slloff]
    
    % oscilograma
    
    %grafica en el dominio del tiempo
    axes(handles.oscilograma); 
    cla; 
    plot(1:length(sll),sll/max(sll)); %señal normalizada
    title('Oscilograma del tono de llamada"'),xlabel('t(s)'),ylabel('Señal acústica');
    % espectograma
        %transformada de fourier 
        fftsll = fftshift(fft(sll));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(fftsll)); 
    %grafica enn el dominio de la frecuencia
    axes(handles.espectrograma); 
    cla; 
    plot(frec,abs((fftsll)/max(fftsll))); %espectro normalizado
    title('Espectro del tono de llamada'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(sll,fs);



% --- Executes on button press in intervencion.
function intervencion_Callback(hObject, eventdata, handles)
% hObject    handle to intervencion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fs = 8000;
fsa = 950;
fsa1 = 1400;
fsa2 =1800;
% Tono de congestión
  
    %0.25s __ 0.25s   0.75s__ 425 Hz
  
    tion = [0:1/fs:0.35] %tiempo de tono de t.c.
    tioff1 = [0:1/fs:0.05] %tiempo de silencio de t.c.
    tioff= [0:1/fs:1] %tiempo de silencio de t.c.
 
    
    sion = 0.5*sin(2*pi*fsa*tion);
    sion1= 0.5*sin(2*pi*fsa1*tion);
    sion2= 0.5*sin(2*pi*fsa2*tion);
    sioff= zeros(1,length(tioff));    
    sioff1= zeros(1,length(tioff1));    
    si = [sion,sioff1,sion1,sioff1,sion2,sioff,sion,sioff1,sion1,sioff1,sion2,sioff,sion,sioff1,sion1,sioff1,sion2,sioff,sion,sioff1,sion1,sioff1,sion2,sioff,sion,sioff1,sion1,sioff1,sion2,sioff,]
    
    % oscilograma
    
    axes(handles.oscilograma); 
    cla; 
    plot(1:length(si),si/max(si));
    title('Oscilograma del tono de intervención de llamada'),xlabel('t(s)'),ylabel('Señal acústica');
    % espectograma
        %transformada de fourier 
        fftsi = fftshift(fft(si));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(fftsi)); 
    axes(handles.espectrograma); 
    cla; 
    plot(frec,abs((fftsi)/max(fftsi)));
    title('Espectro del tono de intervención de llamada'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(si,fs);


% --- Executes on button press in congestion.
function congestion_Callback(hObject, eventdata, handles)
% hObject    handle to congestion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    fs = 8000;
    fsa = 425; %frecuencia de las señalizaciones acústicas
    % Tono de congestión
  
    %0.25s __ 0.25s   0.75s__ 425 Hz
  
    tcon = [0:1/fs:0.25] %tiempo de tono de t.c.
    tcoff1 = [0:1/fs:0.15] %tiempo de silencio de t.c.
    tcoff= [0:1/fs:0.75] %tiempo de silencio de t.c.
 
    
    scon = 0.5*sin(2*pi*fsa*tcon);
    scoff= zeros(1,length(tcoff));    
    scoff1= zeros(1,length(tcoff1));    
    sc = [scon,scoff1,scon,scoff1,scon,scoff1,scoff,scon,scoff1,scon,scoff1,scon,scoff1,scoff,scon,scoff1,scon,scoff1,scon,scoff1,scoff, scon,scoff1,scon,scoff1,scon,scoff1,scoff,scon,scoff1,scon,scoff1,scon,scoff1,scoff]
    
    % oscilograma
    axes(handles.oscilograma)
    cla;
    plot(1:length(sc),sc/max(sc));
    title('Oscilograma del tono de congestión'),xlabel('t(s)'),ylabel('Señal acústica');
    % espectograma
        %transformada de fourier 
        fftsc = fftshift(fft(sc));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(fftsc)); 
    axes(handles.espectrograma)
    cla;
    plot(frec,abs((fftsc)/max(fftsc)));
    title('Espectro del tono de congestión'),xlabel('f(Hz)'),ylabel('SEspectro de la señal');
    sound(sc,fs);



% --- Executes on button press in ocupado.
function ocupado_Callback(hObject, eventdata, handles)
% hObject    handle to ocupado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fs=8000;
fsa = 425; %frecuencia de las señalizaciones acústicas
% Tono de ocupado
  
    %0.25s __ 0.25s   0.25s__ 425 Hz
  
    toon = [0:1/fs:0.25] %tiempo de tono de t.o.
    tooff= [0:1/fs:0.25] %tiempo de silencio de t.o.
  
    soon = 0.5*sin(2*pi*fsa*toon);
    sooff= zeros(1,length(tooff));    
    so = [soon,sooff,soon,sooff,soon,sooff,soon,sooff,soon,sooff,soon,sooff,soon,sooff,soon,sooff,soon,sooff,soon,sooff,soon,sooff,soon,sooff,soon,sooff,soon,sooff,soon,sooff,soon,sooff,soon,sooff,soon,sooff,soon,sooff,soon,sooff] %reproduciremos n tonos y n silencios
    
    % oscilograma
    
    axes(handles.oscilograma); 
    cla; 
    plot(1:length(so),so/max(so));
    title('Oscilograma del tono de ocupado"'),xlabel('t(s)'),ylabel('Señal acústica');
    % espectograma
        %transformada de fourier 
        fftso = fftshift(fft(so));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(fftso)); 
    axes(handles.espectrograma); 
    cla; 
    plot(frec,abs((fftso)/max(fftso)));
    title('Espectro del tono de ocupado'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(so,fs);


% --- Executes on button press in espera.
function espera_Callback(hObject, eventdata, handles)
% hObject    handle to espera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    fs=8000;
    fsa = 425; %frecuencia de las señalizaciones acústicas
    % Tono de llamada en espera
  
    teon = [0:1/fs:0.3] %tiempo de tono de t.ll.e
    teoff1 = [0:1/fs:0.05] %tiempo de silencio de t.ll.e.
    teoff= [0:1/fs:4]
 
    
    seon = 0.5*sin(2*pi*fsa*teon);
    seoff= zeros(1,length(teoff));    
    seoff1= zeros(1,length(teoff1));    
    se =[seon,seoff1,seon,seoff,seon,seoff1,seon,seoff,seon,seoff1,seon,seoff] 
    
    % oscilograma
    
    axes(handles.oscilograma); 
    cla; 
    plot(1:length(se),se/max(se));
    title('Oscilograma del tono de llamada en espera'),xlabel('t(s)'),ylabel('Señal acústica');
    % espectograma
        %transformada de fourier 
        fftse = fftshift(fft(se));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(fftse)); 
    axes(handles.espectrograma); 
    cla; 
    plot(frec,abs((fftse)/max(fftse)));
    title('Espectograma del tono de llamada en espera'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(se,fs);



% --- Executes on button press in timbrado.
function timbrado_Callback(hObject, eventdata, handles)
% hObject    handle to timbrado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    fs = 8000;
    fsa = 25;
    % Tono de congestión
  
    %0.25s __ 0.25s   0.75s__ 425 Hz
  
    treon = [0:1/fs:0.35] %tiempo de tono de t.c.
    treoff1 = [0:1/fs:0.05] %tiempo de silencio de t.c.
    treoff= [0:1/fs:1] %tiempo de silencio de t.c.
 
    
    sreon = 90*sin(2*pi*fsa*treon);
    sreon1= 90*sin(2*pi*fsa*treon);
    sreon2= 90*sin(2*pi*fsa*treon);
    sreoff= zeros(1,length(treoff));    
    sreoff1= zeros(1,length(treoff1));    
    sre = [sreon,sreoff1,sreon1,sreoff1,sreon2,sreoff,sreon,sreoff1,sreon1,sreoff1,sreon2,sreoff,sreon,sreoff1,sreon1,sreoff1,sreon2,sreoff, sreon,sreoff1,sreon1,sreoff1,sreon2,sreoff,sreon,sreoff1,sreon1,sreoff1,sreon2,sreoff]
    
    
    % oscilograma
    axes(handles.oscilograma); 
    cla; 
    plot(1:length(sre),sre/max(sre));
    title('Oscilograma del timbrado'),xlabel('t(s)'),ylabel('Señal acústica');
    % espectograma
        %transformada de fourier 
        fftre = fftshift(fft(sre));
        %eje de frecuencias
        frec = linspace(-fs/2,fs/2,length(fftre)); 
    axes(handles.espectrograma); 
    cla; 
    plot(frec,abs((fftre)/max(fftre)));
    title('Espectro del timbrado'),xlabel('f(Hz)'),ylabel('Espectro de la señal');
    sound(sre,fs);
