function varargout = appkalkulus(varargin)
% APPKALKULUS MATLAB code for appkalkulus.fig
%      APPKALKULUS, by itself, creates a new APPKALKULUS or raises the existing
%      singleton*.
%
%      H = APPKALKULUS returns the handle to a new APPKALKULUS or the handle to
%      the existing singleton*.
%
%      APPKALKULUS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPKALKULUS.M with the given input arguments.
%
%      APPKALKULUS('Property','Value',...) creates a new APPKALKULUS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before appkalkulus_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to appkalkulus_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help appkalkulus

% Last Modified by GUIDE v2.5 26-Jun-2021 16:48:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @appkalkulus_OpeningFcn, ...
                   'gui_OutputFcn',  @appkalkulus_OutputFcn, ...
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


% --- Executes just before appkalkulus is made visible.
function appkalkulus_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to appkalkulus (see VARARGIN)

% Choose default command line output for appkalkulus
handles.output = hObject;
movegui(hObject,'center');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes appkalkulus wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = appkalkulus_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(appkalkulus,'visible','off');
MetodeNumerik


function hasilturunan_Callback(hObject, eventdata, handles)
% hObject    handle to hasilturunan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hasilturunan as text
%        str2double(get(hObject,'String')) returns contents of hasilturunan as a double


% --- Executes during object creation, after setting all properties.
function hasilturunan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hasilturunan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hasilintegral_Callback(hObject, eventdata, handles)
% hObject    handle to hasilintegral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hasilintegral as text
%        str2double(get(hObject,'String')) returns contents of hasilintegral as a double


% --- Executes during object creation, after setting all properties.
function hasilintegral_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hasilintegral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hasilbatas_Callback(hObject, eventdata, handles)
% hObject    handle to hasilbatas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hasilbatas as text
%        str2double(get(hObject,'String')) returns contents of hasilbatas as a double


% --- Executes during object creation, after setting all properties.
function hasilbatas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hasilbatas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fungsi=get(handles.inputfungsi,'string');
x_max=str2double(get(handles.batasatas,'string'));
x_min=str2double(get(handles.batasbawah,'string'));

%menggambar grafik
axes(handles.axes1);
H=ezplot(fungsi,[x_min x_max]);
set(H,'color','r');
title('Fungsi','fontweight','b');
xlabel('Sumbu x','fontweight','b');
ylabel('sumbu y','fontweight','b');

%Hasil proses fungsi
set(handles.hasilturunan,'string',char(diff(sym(fungsi))));
set(handles.hasilintegral,'string',char(int(sym(fungsi))));
set(handles.hasilbatas,'string',char(int(sym(fungsi),x_min,x_max)));

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.inputfungsi,'string',' ');
set(handles.batasatas,'string',' ');
set(handles.batasbawah,'string',' ');
set(handles.hasilturunan,'string',' ');
set(handles.hasilintegral,'string',' ');
set(handles.hasilbatas,'string',' ');

axes(handles.axes1);
plot(0);
grid off ;
hold off ;


function inputfungsi_Callback(hObject, eventdata, handles)
% hObject    handle to inputfungsi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputfungsi as text
%        str2double(get(hObject,'String')) returns contents of inputfungsi as a double


% --- Executes during object creation, after setting all properties.
function inputfungsi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputfungsi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function batasbawah_Callback(hObject, eventdata, handles)
% hObject    handle to batasbawah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of batasbawah as text
%        str2double(get(hObject,'String')) returns contents of batasbawah as a double


% --- Executes during object creation, after setting all properties.
function batasbawah_CreateFcn(hObject, eventdata, handles)
% hObject    handle to batasbawah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function batasatas_Callback(hObject, eventdata, handles)
% hObject    handle to batasatas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of batasatas as text
%        str2double(get(hObject,'String')) returns contents of batasatas as a double


% --- Executes during object creation, after setting all properties.
function batasatas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to batasatas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
