% ----------------------------------------------------------------------%
% ----------------------Assignment #6-----------------------------------%
% ----------------------Hough Transform Using Matlab--------------------%
% ----------------------------------------------------------------------%

function varargout = as6(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @as6_OpeningFcn, ...
                   'gui_OutputFcn',  @as6_OutputFcn, ...
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
% --- Executes 
function as6_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

% ----------------------------------------------------------------------%
% -----------------------GUI-Elements-----------------------------------%
% ---- Outputs from this function are returned to the command line.-----%
% ----------------------------------------------------------------------%


function varargout = as6_OutputFcn(hObject, eventdata, handles)
% Get default command line output from handles structure
varargout{1} = handles.output;
% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%
% ----------------Executes on button press in Enter key-----------------%.

function enteron_desire_Callback(hObject, eventdata, handles)
img = imread(handles.image_file);
global s2;
global s1;
s1 = str2double(get(handles.line_angle, 'string'));
s2 = str2double(get(handles.pixel_per_line, 'string'));
hough=houghTransform(img,s1,s2);
imshow(hough);
% figure
% % subplot(2,1,2);
% imshow(hough,'XData',s1,'YData',s2,...
%    'InitialMagnification','fit');
% title('Limited Theta Range Hough Transform of Gantrycrane Image');
% xlabel('\theta')
% ylabel('\rho');
% axis on, axis normal;
% colormap(gca,hot)

% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%
function line_angle_Callback(hObject, eventdata, handles)
global s1;
s1 = str2double(get(handles.line_angle, 'string'));

% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%
% --- Executes during object creation, after setting all properties.
function line_angle_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%



function pixel_per_line_Callback(hObject, eventdata, handles)
global s2;
s2 = str2double(get(handles.pixel_per_line, 'string'));
% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%


% --- Executes during object creation, after setting all properties.
function pixel_per_line_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%


% --- Executes on button press in upload_Image.
function upload_Image_Callback(hObject, eventdata, handles)
[file, path] = uigetfile;
fullpath1 = fullfile(path, file);
handles.image_file = (fullpath1);
set(handles.axes1, 'Units', 'pixels');
resizePos = get(handles.axes1, 'Position');
axes(handles.axes1);
imshow(fullpath1);
guidata(handles.axes1,handles)
set(handles.axes1, 'Units', 'normalized');

% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%


% --- Executes on button press in clear_image.
function clear_image_Callback(hObject, eventdata, handles)
cla(handles.axes1, 'reset');


% ----------------------------MUHAMMAD-FAIQUE---------------------------%
% ------------------MUHAMMAD-FARHAN-ATIF--------------------------------%
% ----------------------------------------------------------------------%
% ----------------------------------------------------------------------%

