function varargout = MetodeNumerik(varargin)
% METODENUMERIK MATLAB code for MetodeNumerik.fig
%      METODENUMERIK, by itself, creates a new METODENUMERIK or raises the existing
%      singleton*.
%
%      H = METODENUMERIK returns the handle to a new METODENUMERIK or the handle to
%      the existing singleton*.
%
%      METODENUMERIK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in METODENUMERIK.M with the given input arguments.
%
%      METODENUMERIK('Property','Value',...) creates a new METODENUMERIK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MetodeNumerik_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MetodeNumerik_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MetodeNumerik

% Last Modified by GUIDE v2.5 26-Jun-2021 20:00:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MetodeNumerik_OpeningFcn, ...
                   'gui_OutputFcn',  @MetodeNumerik_OutputFcn, ...
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


% --- Executes just before MetodeNumerik is made visible.
function MetodeNumerik_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MetodeNumerik (see VARARGIN)

% Choose default command line output for MetodeNumerik
handles.output = hObject;
movegui(hObject,'center');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MetodeNumerik wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axes(handles.axes1);
logo=imread('logo2.png');
imshow(logo);

axes(handles.axes3);
love=imread('love2.png');
imshow(love);


% --- Outputs from this function are returned to the command line.
function varargout = MetodeNumerik_OutputFcn(hObject, eventdata, handles) 
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
set(MetodeNumerik,'visible','off');
metodenewton3

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(MetodeNumerik,'visible','off');
PenyeleseianDiferensial

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(MetodeNumerik,'visible','off');
nilaiminimumfungsi

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(MetodeNumerik,'visible','off');
parabola

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(MetodeNumerik,'visible','off');
Grafikfunc


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(MetodeNumerik,'visible','off');
appkalkulus
