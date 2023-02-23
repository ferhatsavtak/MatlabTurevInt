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

label=findobj(gcbf,'Tag','text1'); % Text1 öðesi çaðýrýlýr.
label2=findobj(gcbf,'Tag','text2');% Text2 öðesi çaðýrýlýr.
label3=findobj(gcbf,'Tag','text3');% Text3 öðesi çaðýrýlýr.
str1=findobj(gcbf,'Tag','edit1');  % edit1 öðesi çaðýrýlýr.


cla reset                       % Grafiði temizler. 
syms x                          % x deðiþkeni atanýr.

deger=get(str1,'String');      % Girilen fonksiyonun stringi alýnýr.

e=sym(deger,'x');            % Girilen fonksiyon sym olarak atanýr.
a=diff(deger,e);             % Girilen fonksiyonun türevi alýnýr.
f=int(deger,e);              % Girilen fonksiyonun integrali alýnýr.
c=char(a);                   % Fonksiyon türevi    yazdýrýlmak için karaktere dönüþtürülür.
intgrl=char(f);              % Fonksiyon integrali yazdýrýlmak için karaktere dönüþtürülür.

hold on                      % 1 Plotta birden çok grafik yazdýrýlmak için kullanýlýr.

polinom=ezplot(e);           % Fonksiyonun grafiði çizdirilir.
set(polinom,'color','b','linestyle','-') % Grafiðin rengi ve biçimi seçilir.

turev=ezplot(a);             % Fonksiyonun türevinin grafiði çizdirilir.
set(turev,'color','r','linestyle','-') % Grafiðin rengi ve biçimi seçilir.

integral=ezplot(f);          % Fonksiyonun integralinin grafiði çizdirilir.
set(integral,'color','g','linestyle','-')  % Grafiðin rengi ve biçimi seçilir.

legend('polinom','turev','integral')   %Hangi grafiðin hangisine ait olduðu belirtilir.    
title('Grafikler')                    %Grafik baþlýðý oluþturulur.
set(label,'String',c);                %Fonksiyon türevi text1 öðesine yazdýrýlýr.
set(label2,'String',deger);           %Fonksiyon  text2 öðesine yazdýrýlýr.
set(label3,'String',intgrl);          %Fonksiyon integrali text3 öðesine yazdýrýlýr.

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
