function varargout = FinalExam(varargin)
% FINALEXAM MATLAB code for FinalExam.fig
%      FINALEXAM, by itself, creates a new FINALEXAM or raises the existing
%      singleton*.
%
%      H = FINALEXAM returns the handle to a new FINALEXAM or the handle to
%      the existing singleton*.
%
%      FINALEXAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINALEXAM.M with the given input arguments.
%
%      FINALEXAM('Property','Value',...) creates a new FINALEXAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FinalExam_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FinalExam_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FinalExam

% Last Modified by GUIDE v2.5 20-May-2022 09:35:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FinalExam_OpeningFcn, ...
                   'gui_OutputFcn',  @FinalExam_OutputFcn, ...
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


% --- Executes just before FinalExam is made visible.
function FinalExam_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FinalExam (see VARARGIN)

% Choose default command line output for FinalExam
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FinalExam wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FinalExam_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when entered data in editable cell(s) in table_072.
function table_072_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to table_072 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in tablebutton_072.
function tablebutton_072_Callback(hObject, eventdata, handles)
% hObject    handle to tablebutton_072 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

opts=detectImportOptions('final_project.csv');
opts.SelectedVariableNames = (B51:F100);
data = readmatrix('final_project.csv',opts);
set(handles.table_072,'data',data);

% --- Executes on button press in resultbutton_072.
function resultbutton_072_Callback(hObject, eventdata, handles)
% hObject    handle to resultbutton_072 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% input data based on criteria
x=data;
k=[1,1,0,0];% attribute value, where 0 = cost attribute &amp; 1 = profit attribute
w=[1,3,2,4];% weights for each criterion
disp ('X Value = ')
disp (opts)
disp ('Weight Value, W = ')
disp (w)
disp ('Attributes of each criteria, K = ')
disp (k)

% Step 1. matrix normalization
[m n]=size (x); % matrix m x n with a size of as much as variable x
R=zeros (m,n); % create a matrix R, which is an empty matrix
Y=zeros (m,n); % create a Y matrix, which is a blank point
for j=1:n,
    if k(j)==1, % statement for criteria with profit attributes
        R(:,j)=x(:,j)./max(x(:,j));
    else
        R(:,j)=min(x(:,j))./x(:,j);
    end;
end;

disp ('matriks yang sudah ternomalisasi R=')
disp (R)
%tahapan kedua, proses perangkingan
for i=1:m,
V(i)= sum(w.*R(i,:))
end;