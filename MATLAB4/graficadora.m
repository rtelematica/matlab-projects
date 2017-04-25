function varargout = graficadora(varargin)
% GRAFICADORA M-file for graficadora.fig
%      GRAFICADORA, by itself, creates a new GRAFICADORA or raises the existing
%      singleton*.
%
%      H = GRAFICADORA returns the handle to a new GRAFICADORA or the handle to
%      the existing singleton*.
%
%      GRAFICADORA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAFICADORA.M with the given input arguments.
%
%      GRAFICADORA('Property','Value',...) creates a new GRAFICADORA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before graficadora_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to graficadora_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help graficadora

% Last Modified by GUIDE v2.5 13-Feb-2012 10:58:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @graficadora_OpeningFcn, ...
                   'gui_OutputFcn',  @graficadora_OutputFcn, ...
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


% --- Executes just before graficadora is made visible.
function graficadora_OpeningFcn(hObject, eventdata, handles, varargin)
global opc
opc=1;
plot(0,0)
axis off
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to graficadora (see VARARGIN)

% Choose default command line output for graficadora
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes graficadora wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = graficadora_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when selected object is changed in uipanel1.
function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)

    
% hObject    handle to the selected object in uipanel1 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)



function frecuencia_Callback(hObject, eventdata, handles)
% hObject    handle to frecuencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frecuencia as text
%        str2double(get(hObject,'String')) returns contents of frecuencia as a double


% --- Executes during object creation, after setting all properties.
function frecuencia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frecuencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tinicial_Callback(hObject, eventdata, handles)
% hObject    handle to tinicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tinicial as text
%        str2double(get(hObject,'String')) returns contents of tinicial as a double


% --- Executes during object creation, after setting all properties.
function tinicial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tinicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edita1_Callback(hObject, eventdata, handles)
% hObject    handle to edita1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edita1 as text
%        str2double(get(hObject,'String')) returns contents of edita1 as a double


% --- Executes during object creation, after setting all properties.
function edita1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edita1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tfinal_Callback(hObject, eventdata, handles)
% hObject    handle to tfinal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tfinal as text
%        str2double(get(hObject,'String')) returns contents of tfinal as a double


% --- Executes during object creation, after setting all properties.
function tfinal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tfinal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in borrar.
function borrar_Callback(hObject, eventdata, handles)
set(handles.tinicial,'String','')
set(handles.tfinal,'String','')
set(handles.tmedio,'String','')
set(handles.edita1,'String','')
set(handles.edita2,'String','')
set(handles.frecuencia,'String','')
plot(0,0)
axis off
% hObject    handle to borrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in graficar.
function graficar_Callback(hObject, eventdata, handles)
global opc
frecuencia=1/str2num(get(handles.frecuencia,'String'));
ti=str2num(get(handles.tinicial,'String'));
tf=str2num(get(handles.tfinal,'String'));
tm=str2num(get(handles.tmedio,'String'));
amplitud=str2num(get(handles.amplitud,'String'));
if amplitud==0
    amplitud=1;
end
switch opc
    case 1
    t1=ti:frecuencia:tm;
    f1=zeros(size(t1));
    t2=tm:frecuencia:tf;
    f2=ones(size(t2));
    t=[t1,t2];
    f=amplitud*[f1,f2];
    plot(t,f)
    grid
    axis on
    case 2
    t1=ti:frecuencia:tm;
    f1=zeros(size(t1));
    t2=tm:frecuencia:tf;
    f2=t2-tm;
    t=[t1,t2];
    f=amplitud*[f1,f2] ;
    plot(t,f)
     grid
    axis on
    case 3
    t1=ti:frecuencia:tm;
    f1=zeros(size(t1));
    t2=tm:frecuencia:tf;
    f2=zeros(size(t2));
    f2(1,1)=Inf;
    t=[t1,t2];
    f=amplitud*[f1,f2] ;
    plot(t,f)
     grid
    axis on
    case 4
    t1=ti:frecuencia:tm;
    f1=ones(size(t1));
    t2=tm:frecuencia:tf
    f2=ones(size(t2));
    t=[t1,t2];
    f=amplitud*[-f1,f2] ;
    plot(t,f)
     grid
    axis on
    case 5
    b=str2num(get(handles.edita1,'String'));
    t1=ti:frecuencia:(tm-b/2);
    f1=zeros(size(t1));
    t2=(tm-b/2):frecuencia:(tm+b/2);
    f2=amplitud*ones(size(t2));
    t3=(tm+b/2):frecuencia:tf;
    f3=zeros(size(t3));
    t=[t1,t2,t3];
    f=amplitud*[f1,f2,f3];
    plot(t,f)
     grid
     axis on
    case 6
       b=str2num(get(handles.edita1,'String')); 
     t1=ti:frecuencia:-b-tm;
     f1=zeros(size(t1));
     t2=-b+tm:frecuencia:tm;
     f2=1-abs(t2-tm)/b;
     t3=tm:frecuencia:b+tm;
     f3=1-abs(t3-tm)/b;
     t4=b-tm:frecuencia:tf;
     f4=zeros(size(t4));
     f=amplitud*[f1,f2,f3,f4];
     t=[t1,t2,t3,t4];
     plot(t,f)
      grid
     axis on
     case 7
     b=str2num(get(handles.edita1,'String')); 
     t1=ti:frecuencia:tm;
     f1=zeros(size(t1));
     t2=tm:frecuencia:tf;
     f2=amplitud*(exp(b*t2+tm));
     t=[t1,t2];
     f=[f1,f2];
     plot(t,f)
      grid
     axis on
    case 8
     b=str2num(get(handles.edita1,'String'));
     t=ti:frecuencia:tf;
     f=amplitud*sin(t*b+tm);
     plot(t,f)
      grid
     axis on
    
end
% hObject    handle to graficar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in op1.
function op1_Callback(hObject, eventdata, handles)
global opc
opc=1
set(handles.texto1,'Visible','off');
set(handles.edita1,'Visible','off');
set(handles.text4,'String','TC');

% hObject    handle to op1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of op1



function tmedio_Callback(hObject, eventdata, handles)
% hObject    handle to tmedio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tmedio as text
%        str2double(get(hObject,'String')) returns contents of tmedio as a double


% --- Executes during object creation, after setting all properties.
function tmedio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tmedio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edita2_Callback(hObject, eventdata, handles)
% hObject    handle to edita2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edita2 as text
%        str2double(get(hObject,'String')) returns contents of edita2 as a double


% --- Executes during object creation, after setting all properties.
function edita2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edita2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.

% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function amplitud_Callback(hObject, eventdata, handles)
% hObject    handle to amplitud (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amplitud as text
%        str2double(get(hObject,'String')) returns contents of amplitud as a double


% --- Executes during object creation, after setting all properties.
function amplitud_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amplitud (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in op2.
function op2_Callback(hObject, eventdata, handles)
global opc
opc=2;
set(handles.texto1,'Visible','off');
set(handles.edita1,'Visible','off');
set(handles.text4,'String','TC');

% hObject    handle to op2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of op2


% --- Executes on button press in op4.
function op4_Callback(hObject, eventdata, handles)
global opc
opc=4;
set(handles.texto1,'Visible','off');
set(handles.edita1,'Visible','off');
set(handles.text4,'String','TC');

% hObject    handle to op4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of op4


% --- Executes on button press in op5.
function op5_Callback(hObject, eventdata, handles)
global opc
opc=5;
set(handles.texto1,'Visible','on');
set(handles.texto1,'String','Base/Beta');
set(handles.edita1,'Visible','on');
set(handles.text4,'String','Origen');
% hObject    handle to op5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of op5


% --- Executes on button press in op6.
function op6_Callback(hObject, eventdata, handles)
global opc
opc=6;
set(handles.texto1,'Visible','on');
set(handles.texto1,'String','Bse/Beta');
set(handles.edita1,'Visible','on');
set(handles.text4,'String','Origen');
% hObject    handle to op6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of op6


% --- Executes on button press in op3.
function op3_Callback(hObject, eventdata, handles)
global opc
opc=3;
set(handles.texto1,'Visible','off');
set(handles.edita1,'Visible','off');
set(handles.text4,'String','TC');
% hObject    handle to op3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of op3


% --- Executes on button press in op7.
function op7_Callback(hObject, eventdata, handles)
global opc
opc=7;
set(handles.texto1,'Visible','on');
set(handles.edita1,'Visible','on');
set(handles.texto1,'String','Exponente');
set(handles.text4,'String','Origen');
% hObject    handle to op7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of op7


% --- Executes on button press in op8.
function op8_Callback(hObject, eventdata, handles)
global opc
opc=8;
set(handles.texto1,'Visible','on');
set(handles.texto1,'String','Periodo');
set(handles.edita1,'Visible','on');
set(handles.text4,'String','Desfasamiento');
% hObject    handle to op8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of op8



function evaluar_Callback(hObject, eventdata, handles)
% hObject    handle to evaluar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of evaluar as text
%        str2double(get(hObject,'String')) returns contents of evaluar as a double


% --- Executes during object creation, after setting all properties.
function evaluar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to evaluar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
