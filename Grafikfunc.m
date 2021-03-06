function varargout = Grafikfunc(varargin)
% GRAFIKFUNC MATLAB code for Grafikfunc.fig
%      GRAFIKFUNC, by itself, creates a new GRAFIKFUNC or raises the existing
%      singleton*.
%
%      H = GRAFIKFUNC returns the handle to a new GRAFIKFUNC or the handle to
%      the existing singleton*.
%
%      GRAFIKFUNC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAFIKFUNC.M with the given input arguments.
%
%      GRAFIKFUNC('Property','Value',...) creates a new GRAFIKFUNC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Grafikfunc_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Grafikfunc_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Grafikfunc

% Last Modified by GUIDE v2.5 12-Jul-2021 09:51:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Grafikfunc_OpeningFcn, ...
                   'gui_OutputFcn',  @Grafikfunc_OutputFcn, ...
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


% --- Executes just before Grafikfunc is made visible.
function Grafikfunc_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Grafikfunc (see VARARGIN)

% Choose default command line output for Grafikfunc
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Grafikfunc wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Grafikfunc_OutputFcn(hObject, eventdata, handles) 
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
set(Grafikfunc,'visible','off')
grafik3d

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(Grafikfunc,'visible','off')
grafikgui
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(Grafikfunc,'visible','off')
MetodeNumerik