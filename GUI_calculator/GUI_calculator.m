function varargout = GUI_calculator(varargin)
% GUI_CALCULATOR MATLAB code for GUI_calculator.fig
%      GUI_CALCULATOR, by itself, creates a new GUI_CALCULATOR or raises the existing
%      singleton*.
%
%      H = GUI_CALCULATOR returns the handle to a new GUI_CALCULATOR or the handle to
%      the existing singleton*.
%
%      GUI_CALCULATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_CALCULATOR.M with the given input arguments.
%
%      GUI_CALCULATOR('Property','Value',...) creates a new GUI_CALCULATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_calculator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_calculator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_calculator

% Last Modified by GUIDE v2.5 31-Jan-2022 11:26:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_calculator_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_calculator_OutputFcn, ...
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


% --- Executes just before GUI_calculator is made visible.
function GUI_calculator_OpeningFcn(hObject, eventdata, handles, varargin)
clc;
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_calculator (see VARARGIN)

% Choose default command line output for GUI_calculator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_calculator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_calculator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function num1_text_Callback(hObject, eventdata, handles)
% hObject    handle to num1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num1_text as text
%        str2double(get(hObject,'String')) returns contents of num1_text as a double


% --- Executes during object creation, after setting all properties.
function num1_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function num2_text_Callback(hObject, eventdata, handles)
% hObject    handle to num2_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num2_text as text
%        str2double(get(hObject,'String')) returns contents of num2_text as a double


% --- Executes during object creation, after setting all properties.
function num2_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num2_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in operators_list.
function operators_list_Callback(hObject, eventdata, handles)
% hObject    handle to operators_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns operators_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from operators_list    


% --- Executes during object creation, after setting all properties.
function operators_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to operators_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in equal_button.
function equal_button_Callback(hObject, eventdata, handles)
% hObject    handle to equal_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    list = get(handles.operators_list, 'string');
    index = get(handles.operators_list, 'value');
    set(handles.op_text, 'string', list{index});
    
    num1_string = get(handles.num1_text, 'string');
    num1 = str2double(num1_string);
    num2_string = get(handles.num2_text, 'string');
    num2 = str2double(num2_string);
    
    if (index == 4) && (num2 == 0)
        set(handles.text8, 'string', "Can Not Divide By Zero");
        set(handles.result_text, 'string', " ");
    elseif (isnan(num1)) || (isnan(num2))
        set(handles.text8, 'string', "please enter numbers");
    else
        if index == 1
            set(handles.result_text, 'string', num1+num2);
            set(handles.text8, 'string', " ");
        elseif index == 2
            set(handles.result_text, 'string', num1-num2);
            set(handles.text8, 'string', " ");
        elseif index == 3
            set(handles.result_text, 'string', num1*num2);
            set(handles.text8, 'string', " ");
        elseif index == 4
            set(handles.result_text, 'string', num1/num2);
            set(handles.text8, 'string', " ");
        end
    end
    



function matrix1_text_Callback(hObject, eventdata, handles)
% hObject    handle to matrix1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of matrix1_text as text
%        str2double(get(hObject,'String')) returns contents of matrix1_text as a double


% --- Executes during object creation, after setting all properties.
function matrix1_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to matrix1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function matrix2_text_Callback(hObject, eventdata, handles)
% hObject    handle to matrix2_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of matrix2_text as text
%        str2double(get(hObject,'String')) returns contents of matrix2_text as a double


% --- Executes during object creation, after setting all properties.
function matrix2_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to matrix2_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in op_list.
function op_list_Callback(hObject, eventdata, handles)
contents = cellstr(get(hObject,'String'));
set(handles.oper_text , 'String' , contents{get(hObject,'Value')});
% hObject    handle to op_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns op_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from op_list


% --- Executes during object creation, after setting all properties.
function op_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to op_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function matrix_result_Callback(hObject, eventdata, handles)
% hObject    handle to matrix_result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of matrix_result as text
%        str2double(get(hObject,'String')) returns contents of matrix_result as a double


% --- Executes during object creation, after setting all properties.
function matrix_result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to matrix_result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in matrix_equal.
function matrix_equal_Callback(hObject, eventdata, handles)
set(handles.error_matrix_text,'String','');
set(handles.matrix_result , 'String' , '');
set(handles.matrix_result,'String','');

vec1 = get(handles.matrix1_text, 'String');
vec2 = get(handles.matrix2_text, 'String');

vec1_n = str2double(vec1);
vec2_n = str2double(vec2);

if ~isvector(vec1_n)
    set(handles.error_matrix_text, 'String', 'Input 1 must be Vectors!');
    return
end

if ~isvector(vec2_n)
    set(handles.error_matrix_text, 'String', 'Input 2 must be Vectors!');
    return
end

if length(vec1_n) ~= length(vec2_n)
    set(handles.error_matrix_text, 'String', 'Vectors must be the same length!');
    return
end

if length(vec1_n) < 1 || length(vec2_n) < 1
    set(handles.error_matrix_text, 'String', 'pleaes, enter the vectors');
    return
end

operation = get(handles.op_list , 'String');
if strcmp(operation, '*') | strcmp(operation, '/')
    equation_str = strcat(vec1,'.',operation,vec2);
else
    equation_str = strcat(vec1,operation,vec2);
end
result = str2sym(equation_str);
disp(class(char(result)));
set(handles.matrix_result , 'String' , string(char(result)));
% hObject    handle to matrix_equal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in enter_button.
function enter_button_Callback(hObject, eventdata, handles)
vec1 = str2double(get(handles.matrix1_text, 'String'));
vec2 = str2double(get(handles.matrix2_text, 'String'));
operation = get(handles.plotting_buttons, 'SelectedObject');

switch get(operation, 'Tag')
    case 'x_axis'
        vec2 = 1:1:length(vec1);
        plot(vec1, vec2);
        
    case 'y_axis'
        plot(handles.axes1, vec2);
        
    case 'xy_axis'
        if length(vec1) ~= length(vec2)
            set(handles.error_matrix_text, 'String', 'Vectors must be the same length!');
            
        else
            plot(handles.axes1, vec1, vec2);
        end
        
    case 'resultant'
        plot(handles.axes1, str2double(string(get(handles.matrix_result, 'String'))));
       
        
    case 'sine'
        plot(handles.axes1, sind(0:0.1:360));
        
    case 'cosine'
        plot(handles.axes1, cosd(0:0.1:360));
        
    case 'equation'        
        x = 1:0.1:10;
        y = 1:0.1:10;
        eq = get(handles.text11, 'String'); 
        axes(handles.axes1);
        %plot(eval(eq));
        fplot(eq);
        
    otherwise
        plot(handles.axes1, plot(0, 0));
end
% hObject    handle to enter_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in delete_button.
function delete_button_Callback(hObject, eventdata, handles)
plot(handles.axes1, plot(0, 0));
% hObject    handle to delete_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in plotting_buttons.
function plotting_buttons_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in plotting_buttons 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global select;
    switch(get(eventdata.NewValue, 'Tag'));
        case 'X axis'
            select = get(handles.radiobutton1, 'string')
    end
