function varargout = MetodeRungekutta4(varargin)
% METODERUNGEKUTTA4 MATLAB code for MetodeRungekutta4.fig
%      METODERUNGEKUTTA4, by itself, creates a new METODERUNGEKUTTA4 or raises the existing
%      singleton*.
%
%      H = METODERUNGEKUTTA4 returns the handle to a new METODERUNGEKUTTA4 or the handle to
%      the existing singleton*.
%
%      METODERUNGEKUTTA4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in METODERUNGEKUTTA4.M with the given input arguments.
%
%      METODERUNGEKUTTA4('Property','Value',...) creates a new METODERUNGEKUTTA4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MetodeRungekutta4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MetodeRungekutta4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MetodeRungekutta4

% Last Modified by GUIDE v2.5 12-Jul-2021 08:26:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MetodeRungekutta4_OpeningFcn, ...
                   'gui_OutputFcn',  @MetodeRungekutta4_OutputFcn, ...
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


% --- Executes just before MetodeRungekutta4 is made visible.
function MetodeRungekutta4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MetodeRungekutta4 (see VARARGIN)

% Choose default command line output for MetodeRungekutta4
handles.output = hObject;
movegui(hObject,'center');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MetodeRungekutta4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MetodeRungekutta4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

syms x y
sf=get(handles.edit1,'String');
a=str2num(get(handles.edit2,'String'));
b=str2num(get(handles.edit3,'String'));
y0=str2num(get(handles.edit4,'String'));
h=str2num(get(handles.edit5,'String'));
f=eval(sf);
x = a:h:b;
y(1) = y0;
for i=1:(length(x)-1)
k1 = double(f(x(i),y(i)));
k2 = double(f(x(i)+0.5*h,y(i)+0.5*h*k1));
k3 = double(f((x(i)+0.5*h),(y(i)+0.5*h*k2)));
k4 = double(f((x(i)+h),(y(i)+k3*h)));
y(i+1) = (y(i)+(h/6)*(k1+2*k2+2*k3+k4));
end
xp=double(x(:));
yp=double(y(:));
hasil=table(xp,yp);
hasil2=table2cell(hasil);
set(handles.uitable1,'Data',hasil2);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms x y
sf=get(handles.edit1,'String');
a=str2num(get(handles.edit2,'String'));
b=str2num(get(handles.edit3,'String'));
y0=str2num(get(handles.edit4,'String'));
h=str2num(get(handles.edit5,'String'));
f=eval(sf);
x = a:h:b;
y(1) = y0;
for i=1:(length(x)-1)
    k1 = double(f(x(i),y(i)));
    k2 = double(f(x(i)+0.5*h,y(i)+0.5*h*k1));
    k3 = double(f((x(i)+0.5*h),(y(i)+0.5*h*k2)));
    k4 = double(f((x(i)+h),(y(i)+k3*h)));
    y(i+1) = (y(i)+(h/6)*(k1+2*k2+2*k3+k4));
end
xp=double(x(:));
yp=double(y(:));
axes=(handles.axes1);
plot(xp,yp);
title('Grafik Aproksimasi')
xlabel('X');ylabel('Y');
grid on




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 set(MetodeRungekutta4,'visible','off');
MetodeNumerik


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(MetodeRungekutta4,'visible','off');
PenyeleseianDiferensial


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1,'string',' ');
set(handles.edit2,'string',' ');
set(handles.edit3,'string',' ');
set(handles.edit4,'string',' ');
set(handles.edit5,'string',' ');
axes(handles.axes1);
grid off ;
hold off ;
plot(0);
