function varargout = traffic_light(varargin)
% TRAFFIC_LIGHT MATLAB code for traffic_light.fig
%      TRAFFIC_LIGHT, by itself, creates a new TRAFFIC_LIGHT or raises the existing
%      singleton*.
%
%      H = TRAFFIC_LIGHT returns the handle to a new TRAFFIC_LIGHT or the handle to
%      the existing singleton*.
%
%      TRAFFIC_LIGHT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRAFFIC_LIGHT.M with the given input arguments.
%
%      TRAFFIC_LIGHT('Property','Value',...) creates a new TRAFFIC_LIGHT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before traffic_light_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to traffic_light_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help traffic_light

% Last Modified by GUIDE v2.5 28-Jan-2022 18:11:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @traffic_light_OpeningFcn, ...
                   'gui_OutputFcn',  @traffic_light_OutputFcn, ...
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


% --- Executes just before traffic_light is made visible.
function traffic_light_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to traffic_light (see VARARGIN)

% Choose default command line output for traffic_light
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes traffic_light wait for user response (see UIRESUME)
% uiwait(handles.figure1);
clc;
clear all;
% global a;
% a = arduino('COM10', 'Uno');
global mode;
mode = 0;  % default automatic
global car_mode;
car_mode = true;  %default count cars
global count_num;
count_num = 0;
global car_max;
global pedestrians_max;  
car_max = 5;
pedestrians_max = 6;

% configurePin(a, 'D2', 'DigitalOutput'); % cars red led
% configurePin(a, 'D3', 'DigitalOutput'); % cars yellow led
% configurePin(a, 'D4', 'DigitalOutput'); % cars green led
% configurePin(a, 'D5', 'DigitalOutput'); % pesestrians red led
% configurePin(a, 'D6', 'DigitalOutput'); % pesestrians green led

% --- Outputs from this function are returned to the command line.
function varargout = traffic_light_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in automatic_mode.
function automatic_mode_Callback(hObject, eventdata, handles)
% hObject    handle to automatic_mode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mode;
mode = 0;
set(handles.mode_text, 'string', 'Automatic');
set(handles.mode_text,'BackgroundColor','#1e9912');
set(handles.cars_counter,'visible','on');
set(handles.text2,'visible','on');
set(handles.pedestrians_counter,'visible','on');
set(handles.text9,'visible','on');
set(handles.counter,'visible','on');

set(handles.continue_btn,'visible','off');
set(handles.stop_btn,'visible','off');

set(handles.text11,'visible','off');
set(handles.car_text,'visible','off');
set(handles.set_counter,'visible','off');
set(handles.text12,'visible','off');
set(handles.pedestrians_text,'visible','off');



% --- Executes on button press in manual_mode.
function manual_mode_Callback(hObject, eventdata, handles)
% hObject    handle to manual_mode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mode;
mode = 1;
set(handles.mode_text, 'string', 'Manual');
set(handles.mode_text,'BackgroundColor','#bac223');
set(handles.continue_btn,'visible','on');
set(handles.stop_btn,'visible','on');

set(handles.cars_counter,'visible','off');
set(handles.text2,'visible','off');
set(handles.pedestrians_counter,'visible','off');
set(handles.text9,'visible','off');
set(handles.counter,'visible','off');

set(handles.text11,'visible','off');
set(handles.car_text,'visible','off');
set(handles.set_counter,'visible','off');
set(handles.text12,'visible','off');
set(handles.pedestrians_text,'visible','off');




% --- Executes on button press in maintenance_mode.
function maintenance_mode_Callback(hObject, eventdata, handles)
% hObject    handle to maintenance_mode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mode;
mode = 2;
set(handles.mode_text, 'string', 'Maintenance');
set(handles.mode_text,'BackgroundColor','#a3141b');
set(handles.text11,'visible','on');
set(handles.car_text,'visible','on');
set(handles.set_counter,'visible','on');
set(handles.text12,'visible','on');
set(handles.pedestrians_text,'visible','on');

set(handles.cars_counter,'visible','off');
set(handles.text2,'visible','off');
set(handles.pedestrians_counter,'visible','off');
set(handles.text9,'visible','off');
set(handles.counter,'visible','off');

set(handles.continue_btn,'visible','off');
set(handles.stop_btn,'visible','off');

% writeDigitalPin(a, 'D4', 0);
% writeDigitalPin(a, 'D3', 0);
% writeDigitalPin(a, 'D2', 0);
% writeDigitalPin(a, 'D5', 0); 
% writeDigitalPin(a, 'D6', 0);


	


% --- Executes on button press in counter.
function counter_Callback(hObject, eventdata, handles)
% hObject    handle to counter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mode
global a;
global count_num;
global car_mode;
global car_max;
global pedestrians_max;
if mode == 0
    if car_mode == true && count_num <= car_max
        set(handles.cars_counter, 'string', count_num);
        set(handles.pedestrians_counter, 'string', '-');
        
%         writeDigitalPin(a, 'D4', 1); % cars green
%         writeDigitalPin(a, 'D3', 0);
%         writeDigitalPin(a, 'D2', 0);
%         writeDigitalPin(a, 'D5', 1); % pedestrians red
%         writeDigitalPin(a, 'D6', 0);
        
    elseif car_mode == false && count_num <= pedestrians_max
        set(handles.cars_counter, 'string', '-');
        set(handles.pedestrians_counter, 'string', count_num);
        
%         writeDigitalPin(a, 'D4', 0);
%         writeDigitalPin(a, 'D3', 0);
%         writeDigitalPin(a, 'D2', 1); % cars red
%         writeDigitalPin(a, 'D5', 0);
%         writeDigitalPin(a, 'D6', 1); % pedestrians green
        
    else 
        car_mode = ~car_mode;
        count_num = 0;
    end
    count_num = count_num +1;
end


% --- Executes on button press in stop_btn.
function stop_btn_Callback(hObject, eventdata, handles)
% hObject    handle to stop_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
global mode;
if mode == 1
%     writeDigitalPin(a, 'D4', 0);
%     writeDigitalPin(a, 'D3', 1);
%     pause(1);
%     writeDigitalPin(a, 'D3', 0);
%     writeDigitalPin(a, 'D2', 1); % cars red
%     writeDigitalPin(a, 'D5', 0);
%     writeDigitalPin(a, 'D6', 1); % pedestrians green
end

% --- Executes on button press in continue_btn.
function continue_btn_Callback(hObject, eventdata, handles)
% hObject    handle to continue_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
global mode;
if mode == 1
%     writeDigitalPin(a, 'D4', 1); % cars green
%     writeDigitalPin(a, 'D3', 0);
%     writeDigitalPin(a, 'D2', 0);
%     writeDigitalPin(a, 'D5', 1); % pedestrians red
%     writeDigitalPin(a, 'D6', 0);
end



function car_text_Callback(hObject, eventdata, handles)
% hObject    handle to car_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of car_text as text
%        str2double(get(hObject,'String')) returns contents of car_text as a double


% --- Executes during object creation, after setting all properties.
function car_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to car_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pedestrians_text_Callback(hObject, eventdata, handles)
% hObject    handle to pedestrians_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pedestrians_text as text
%        str2double(get(hObject,'String')) returns contents of pedestrians_text as a double


% --- Executes during object creation, after setting all properties.
function pedestrians_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pedestrians_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in set_counter.
function set_counter_Callback(hObject, eventdata, handles)
% hObject    handle to set_counter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global car_max;
global pedestrians_max;
num1_string = get(handles.car_text, 'string');
num1 = str2double(num1_string);
car_max = num1;

num2_string = get(handles.pedestrians_text, 'string');
num2 = str2double(num2_string);
pedestrians_max = num2;
