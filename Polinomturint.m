function varargout = Polinomturint(varargin)
% POLINOMTURINT MATLAB code for Polinomturint.fig
%      POLINOMTURINT, by itself, creates a new POLINOMTURINT or raises the existing
%      singleton*.
%
%      H = POLINOMTURINT returns the handle to a new POLINOMTURINT or the handle to
%      the existing singleton*.
%
%      POLINOMTURINT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POLINOMTURINT.M with the given input arguments.
%
%      POLINOMTURINT('Property','Value',...) creates a new POLINOMTURINT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Polinomturint_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Polinomturint_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Polinomturint

% Last Modified by GUIDE v2.5 11-Jan-2015 21:03:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Polinomturint_OpeningFcn, ...
                   'gui_OutputFcn',  @Polinomturint_OutputFcn, ...
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


% --- Executes just before Polinomturint is made visible.
function Polinomturint_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Polinomturint (see VARARGIN)

% Choose default command line output for Polinomturint
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Polinomturint wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Polinomturint_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

label=findobj(gcbf,'Tag','text1'); % Text1 ��esi �a��r�l�r.
label2=findobj(gcbf,'Tag','text2');% Text2 ��esi �a��r�l�r.
label3=findobj(gcbf,'Tag','text3');% Text3 ��esi �a��r�l�r.
str1=findobj(gcbf,'Tag','edit1');  % edit1 ��esi �a��r�l�r.


cla reset                       % Grafi�i temizler. 
syms x                          % x de�i�keni atan�r.

deger=get(str1,'String');      % Girilen fonksiyonun stringi al�n�r.

e=sym(deger,'x');            % Girilen fonksiyon sym olarak atan�r.
a=diff(deger,e);             % Girilen fonksiyonun t�revi al�n�r.
f=int(deger,e);              % Girilen fonksiyonun integrali al�n�r.
c=char(a);                   % Fonksiyon t�revi    yazd�r�lmak i�in karaktere d�n��t�r�l�r.
intgrl=char(f);              % Fonksiyon integrali yazd�r�lmak i�in karaktere d�n��t�r�l�r.

hold on                      % 1 Plotta birden �ok grafik yazd�r�lmak i�in kullan�l�r.

polinom=ezplot(e);           % Fonksiyonun grafi�i �izdirilir.
set(polinom,'color','b','linestyle','-') % Grafi�in rengi ve bi�imi se�ilir.

turev=ezplot(a);             % Fonksiyonun t�revinin grafi�i �izdirilir.
set(turev,'color','r','linestyle','-') % Grafi�in rengi ve bi�imi se�ilir.

integral=ezplot(f);          % Fonksiyonun integralinin grafi�i �izdirilir.
set(integral,'color','g','linestyle','-')  % Grafi�in rengi ve bi�imi se�ilir.

legend('polinom','turev','integral')   %Hangi grafi�in hangisine ait oldu�u belirtilir.    
title('Grafikler')                    %Grafik ba�l��� olu�turulur.
set(label,'String',c);                %Fonksiyon t�revi text1 ��esine yazd�r�l�r.
set(label2,'String',deger);           %Fonksiyon  text2 ��esine yazd�r�l�r.
set(label3,'String',intgrl);          %Fonksiyon integrali text3 ��esine yazd�r�l�r.

hold off


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


%  Hint: place code in OpeningFcn to populate axes3


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
