function varargout = GUI_buttons_arduino(varargin)
% GUI_BUTTONS_ARDUINO MATLAB code for GUI_buttons_arduino.fig
%      GUI_BUTTONS_ARDUINO, by itself, creates a new GUI_BUTTONS_ARDUINO or raises the existing
%      singleton*.
%
%      H = GUI_BUTTONS_ARDUINO returns the handle to a new GUI_BUTTONS_ARDUINO or the handle to
%      the existing singleton*.
%
%      GUI_BUTTONS_ARDUINO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_BUTTONS_ARDUINO.M with the given input arguments.
%
%      GUI_BUTTONS_ARDUINO('Property','Value',...) creates a new GUI_BUTTONS_ARDUINO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_buttons_arduino_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_buttons_arduino_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_buttons_arduino

% Last Modified by GUIDE v2.5 23-Jan-2022 20:22:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_buttons_arduino_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_buttons_arduino_OutputFcn, ...
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


% --- Executes just before GUI_buttons_arduino is made visible.
function GUI_buttons_arduino_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_buttons_arduino (see VARARGIN)

% Choose default command line output for GUI_buttons_arduino
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_buttons_arduino wait for user response (see UIRESUME)
% uiwait(handles.figure1);
    clear all;
    global a;
    a = arduino('COM4', 'Uno');
    configurePin(a, 'D12', 'DigitalOutput');


% --- Outputs from this function are returned to the command line.
function varargout = GUI_buttons_arduino_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in on.
function on_Callback(hObject, eventdata, handles)
    global a;
    writeDigitalPin(a, 'D12', 1);
% hObject    handle to on (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in off.
function off_Callback(hObject, eventdata, handles)
    global a;
    writeDigitalPin(a, 'D12', 0);
% hObject    handle to off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

