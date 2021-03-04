function varargout = Erosion_dilation(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Erosion_dilation_OpeningFcn, ...
                   'gui_OutputFcn',  @Erosion_dilation_OutputFcn, ...
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

global image2;
% --- Executes just before Erosion_dilation is made visible.
function Erosion_dilation_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = Erosion_dilation_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in Open_Image.
function Open_Image_Callback(hObject, eventdata, handles)
    [file, path] = uigetfile;
    fullpath1 = fullfile(path, file);
    handles.image_file = (fullpath1);
    set(handles.axes4, 'Units', 'pixels');
    resizePos = get(handles.axes4, 'Position');
    axes(handles.axes4);
    imshow(fullpath1);
    guidata(handles.axes4,handles)
    set(handles.axes4, 'Units', 'normalized');
    image2=imread(handles.image_file)
% --- Executes on button press in Erosion.
function Erosion_Callback(hObject, eventdata, handles)
    Img1=imread(handles.image_file);
    a=erosion(Img1);
    set(handles.axes5,'Units','pixels');
    resizePos = get(handles.axes5,'Position');
    axes(handles.axes5);
    imshow(a);
    set(handles.axes5,'Units','normalized');


% --- Executes on button press in Dilation.
function Dilation_Callback(hObject, eventdata, handles)
    a=imread(handles.image_file);
    a=dilation(a);
    set(handles.axes6,'Units','pixels');
    resizePos = get(handles.axes6,'Position');
    axes(handles.axes6);
    imshow(a);
    set(handles.axes6,'Units','normalized');


