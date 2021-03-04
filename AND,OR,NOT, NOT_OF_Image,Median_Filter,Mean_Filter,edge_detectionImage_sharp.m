function varargout = Assignment2and3(varargin)
    gui_Singleton = 1;
    gui_State = struct('gui_Name', mfilename, ...
      'gui_Singleton', gui_Singleton, ...
      'gui_OpeningFcn', @Assignment2and3_OpeningFcn, ...
      'gui_OutputFcn', @Assignment2and3_OutputFcn, ...
      'gui_LayoutFcn', [], ...
      'gui_Callback', []);
    if nargin && ischar(varargin{1})
        gui_State.gui_Callback = str2func(varargin{1});
    end
 
    if nargout
        [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
    else
        gui_mainfcn(gui_State, varargin{:});
    end
end

% --- Executes just before Assignment2and3 is made visible.
function Assignment2and3_OpeningFcn(hObject, eventdata, handles, varargin)
    handles.output = hObject;
    guidata(hObject, handles);
end

function varargout = Assignment2and3_OutputFcn(hObject, eventdata, handles)
    varargout{1} = handles.output;
end

% --- Executes on button press in Image_1.
function Image_1_Callback(hObject, eventdata, handles)
    [file, path] = uigetfile;
    fullpath1 = fullfile(path, file);
    handles.image_file = (fullpath1);
    set(handles.axes1, 'Units', 'pixels');
    resizePos = get(handles.axes1, 'Position');
    axes(handles.axes1);
    imshow(fullpath1);
    guidata(handles.axes1,handles)
    set(handles.axes1, 'Units', 'normalized');
end
function Image_2_Callback(hObject, eventdata, handles)
    [file, path] = uigetfile;
    fullpath2 = fullfile(path, file);
    handles.image_file_2 = (fullpath2);
    set(handles.axes3, 'Units', 'pixels');
    resizePos = get(handles.axes3, 'Position');
    axes(handles.axes3);
    imshow(fullpath2);
    guidata(handles.axes3,handles);
    set(handles.axes3, 'Units', 'normalized');
end

% --- Executes on button press in And_of_image.
function And_of_image_Callback(hObject, eventdata, handles)
    Img1=imread(handles.image_file);
    Img2=imread(handles.image_file_2);
    result1 = I_And(Img1, Img2);
%     resizePos = get(handles.axes2, 'Position');
    axes(handles.axes2);
    imshow(result1);
%     set(handles.axes2, 'Units', 'normalized');
end

% --- Executes on button press in OR_OF_Image.
function OR_OF_Image_Callback(hObject, eventdata, handles)
    Img1=imread(handles.image_file);
    Img2=imread(handles.image_file_2);
    
    result2 = I_Or(Img1, Img2);
    axes(handles.axes2);
    imshow(result2);
end

% --- Executes on button press in NOT_OF_Image.
function NOT_OF_Image_Callback(hObject, eventdata, handles)
    Img1 = imread(handles.image_file);
    Img3 = rgb2gray(Img1);
    result3 = NOT(Img3);
    axes(handles.axes2);
    imshow(result3);
end
% --------------------------------------------------------
% --------------------------------------------------------
% -------------------------------------------------------------------------------------------------
% --- Executes on button press in OR_Mask.
function OR_Mask_Callback(hObject, eventdata, handles)
    global Img4
    Img4 = imread('mask2.png');
    axes(handles.axes2);
    imshow(Img4);
end

% --- Executes on button press in AND_MASK.
function AND_MASK_Callback(hObject, eventdata, handles)
    global Img3
    Img3 = imread('mask1.png');
    axes(handles.axes2);
    imshow(Img3);
end
% --------------------------------------------------------
% --------------------------------------------------------
% --- Executes on button press in Image_with_AND_MASKING.
function Image_with_AND_MASKING_Callback(hObject, eventdata, handles)
    I1 = imread(handles.image_file);
    global Img3
    result1 = bitand(I1, Img3);
    axes(handles.axes2);
    imshow(result1);
end

% --- Executes on button press in IMAGE_with_OR_MASKING.
function IMAGE_with_OR_MASKING_Callback(hObject, eventdata, handles)
    I1 = imread(handles.image_file);
    global Img4
    result2 = bitor(I1, Img4);
    axes(handles.axes2);
    imshow(result2);
end

% --- Executes on button press in Image_sharp.
function Image_sharp_Callback(hObject, eventdata, handles)
    Img1 = imread(handles.image_file);
    mask = [0, - 1, 0; - 1, 5, - 1; 0, - 1, 0];
    result = conv2(double(Img1), double(mask), 'same');
    axes(handles.axes2);
    imshow(result, []);
end

% --- Executes on button press in edge_detection.
function edge_detection_Callback(hObject, eventdata, handles)
    Img1 = imread(handles.image_file);
    mask = [1, 1, 1; 0, 0, 0; - 1, - 1, - 1];
    result = conv2(double(Img1), double(mask), 'same');
    axes(handles.axes2);
    imshow(result, []);
end

% --- Executes on button press in Mean_Filter.
function Mean_Filter_Callback(hObject, eventdata, handles)
Img1 = imread(handles.image_file);
    
mask=[1,1,1;1,1,1;1,1,1];
mask=double((1/9)*mask);

result=conv2(double(Img1),double(mask),'same');
axes(handles.axes2);
imshow(result,[]);
end

function Input_pane_Callback(hObject, eventdata, handles)
    global Mask_sz
    Mask_sz = str2double(get(handles.Input_pane, 'string'));
end

% --- Executes during object creation, after setting all properties.
function Input_pane_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end
end

% --- Executes on button press in Median_Filter.
function Median_Filter_Callback(hObject, eventdata, handles)
    Img1 = imread(handles.image_file);
    Mask_sz = str2double(get(handles.Input_pane, 'String'));
    [rows, col] = size(Img1);
 
    y = floor(Mask_sz / 2);
    Array = Img1;
    for i = 1:rows
        for j = 1:col
            Array(i, j) = 0;
        end
    end
 
    for i = y + 1:rows - y
        for j = y + 1:col - y
            X = Img1(i - y:i + y, j - y:j + y);
         
            X = X(:);
            Array(i, j) = median(X);
        end
    end
    Final_image = uint8(Array);
    axes(handles.axes2);
    imshow(Final_image);
end

% --- Executes on button press in Myclear.
function Myclear_Callback(hObject, eventdata, handles)
    cla(handles.axes1, 'reset');
    cla(handles.axes2, 'reset');
    cla(handles.axes3, 'reset');
end

%--AND/OR/NOT /NOT_OF_Image/Median_Filter/Mean_Filter/edge_detection/Image_sharp/