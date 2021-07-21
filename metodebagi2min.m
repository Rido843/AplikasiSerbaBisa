function varargout = metodebagi2min(varargin)
% METODEBAGI2MIN MATLAB code for metodebagi2min.fig
%      METODEBAGI2MIN, by itself, creates a new METODEBAGI2MIN or raises the existing
%      singleton*.
%
%      H = METODEBAGI2MIN returns the handle to a new METODEBAGI2MIN or the handle to
%      the existing singleton*.
%
%      METODEBAGI2MIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in METODEBAGI2MIN.M with the given input arguments.
%
%      METODEBAGI2MIN('Property','Value',...) creates a new METODEBAGI2MIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before metodebagi2min_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to metodebagi2min_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help metodebagi2min

% Last Modified by GUIDE v2.5 12-Jul-2021 08:49:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @metodebagi2min_OpeningFcn, ...
                   'gui_OutputFcn',  @metodebagi2min_OutputFcn, ...
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


% --- Executes just before metodebagi2min is made visible.
function metodebagi2min_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to metodebagi2min (see VARARGIN)

% Choose default command line output for metodebagi2min
handles.output = hObject;
movegui(hObject,'center');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes metodebagi2min wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = metodebagi2min_OutputFcn(hObject, eventdata, handles) 
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
zf=get(handles.edit1,'String');
a1=str2num(get(handles.edit2,'String'));
b1=str2num(get(handles.edit6,'String'));
delta=str2num(get(handles.edit3,'String'));
syms x
sf=@(x)zf;
L=b1-a1;
N=ceil(log(delta/L)/log(0.5));
f = sym(sf);
df = diff(f);
a(1)=a1;
b(1)=b1;
dfx(1)=double(subs(df,a(1)));
dfxx(1)=double(subs(df,b(1)));
if dfx==0
   xp=a(1);
elseif dfxx==0
   xp=b(1);
else
   for k=1:N
       miu(k)=(a(k)+b(k))/2;
       dfx(k)=double(subs(df,a(k)));
       dfxx(k)=double(subs(df,b(k)));
       dfxk(k)=double(subs(df,miu(k)));
       if dfx(k)*dfxk(k)<0
           a(k+1)=a(k);
           b(k+1)=miu(k);
       elseif dfxx(k)*dfxk(k)<0
           a(k+1)=miu(k);
           b(k+1)=b(k);
       elseif dfxk(k)==0
           break
       end
        
   end
   xp=miu(k);
end
fxp = double(subs(f,xp));
set(handles.edit5,'string',xp);
set(handles.edit4,'string',fxp);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hold off
zf=get(handles.edit1,'String');
syms x
sf=@(x)zf;
f=sym(sf);
ezplot(f)
grid on
title('Grafik Fungsi')
xlabel('X');ylabel('Y');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms x
zf=get(handles.edit1,'String');
a1=str2num(get(handles.edit2,'String'));
b1=str2num(get(handles.edit6,'String'));
delta=str2num(get(handles.edit3,'String'));
sf=@(x)zf;
L=b1-a1;
N=ceil(log(delta/L)/log(0.5));
f = sym(sf);
df = diff(f);
a(1)=a1;
b(1)=b1;
dfx(1)=double(subs(df,a(1)));
dfxx(1)=double(subs(df,b(1)));
if dfx==0
   xp=a(1);
elseif dfxx==0
   xp=b(1);
else
   for k=1:N
       miu(k)=(a(k)+b(k))/2;
       dfx(k)=double(subs(df,a(k)));
       dfxx(k)=double(subs(df,b(k)));
       dfxk(k)=double(subs(df,miu(k)));
       if dfx(k)*dfxk(k)<0
           a(k+1)=a(k);
           b(k+1)=miu(k);
       elseif dfxx(k)*dfxk(k)<0
           a(k+1)=miu(k);
           b(k+1)=b(k);
       elseif dfxk(k)==0
           break
       end
        
   end
   xp=miu(k);
end
fxp = double(subs(f,xp));
axes=(handles.axes1);
plot(xp,fxp,'*r');
grid on
hold on
ezplot(f)
title('Grafik Titik Minimum')
xlabel('X');ylabel('Y');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(metodebagi2min,'visible','off')
MetodeNumerik

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



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
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
set(metodebagi2min,'visible','off')
nilaiminimumfungsi


% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1,'string',' ');
set(handles.edit2,'string',' ');
set(handles.edit3,'string',' ');
set(handles.edit4,'string',' ');
set(handles.edit5,'string',' ');
set(handles.edit6,'string',' ');
axes(handles.axes1);
grid off ;
hold off ;
plot(0);
