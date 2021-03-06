function varargout = matlap_GUI_task1(varargin)
% MATLAP_GUI_TASK1 MATLAB code for matlap_GUI_task1.fig
%      MATLAP_GUI_TASK1, by itself, creates a new MATLAP_GUI_TASK1 or raises the existing
%      singleton*.
%
%      H = MATLAP_GUI_TASK1 returns the handle to a new MATLAP_GUI_TASK1 or the handle to
%      the existing singleton*.
%
%      MATLAP_GUI_TASK1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATLAP_GUI_TASK1.M with the given input arguments.
%
%      MATLAP_GUI_TASK1('Property','Value',...) creates a new MATLAP_GUI_TASK1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before matlap_GUI_task1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to matlap_GUI_task1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help matlap_GUI_task1

% Last Modified by GUIDE v2.5 15-Jan-2022 16:32:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @matlap_GUI_task1_OpeningFcn, ...
                   'gui_OutputFcn',  @matlap_GUI_task1_OutputFcn, ...
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


% --- Executes just before matlap_GUI_task1 is made visible.
function matlap_GUI_task1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to matlap_GUI_task1 (see VARARGIN)

% Choose default command line output for matlap_GUI_task1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes matlap_GUI_task1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = matlap_GUI_task1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function text_number_Callback(hObject, eventdata, handles)
% hObject    handle to text_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_number as text
%        str2double(get(hObject,'String')) returns contents of text_number as a double


% --- Executes during object creation, after setting all properties.
function text_number_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    number_string = get(handles.text_number, 'string');
    number = str2double(number_string);
    
    if number < 60
        myImage = imread('happy.jpg');
        axes(handles.axes1);
        imshow(myImage);
        set(handles.text3, 'string', "HAPPY");
    elseif number >= 60
        myImage = imread('SAD.jpg');
        axes(handles.axes1);
        imshow(myImage);
        set(handles.text3, 'string', "SAD");
    else
        set(handles.text3, 'string', "enter number");
    end
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
