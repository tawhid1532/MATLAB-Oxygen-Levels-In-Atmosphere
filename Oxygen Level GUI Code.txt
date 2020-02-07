function varargout = GraphicalUserInterface(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GraphicalUserInterface_OpeningFcn, ...
                   'gui_OutputFcn',  @GraphicalUserInterface_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function GraphicalUserInterface_OpeningFcn(hObject, ~, handles, varargin)

handles.output = hObject;


guidata(hObject, handles);


function varargout = GraphicalUserInterface_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;


function Input_Callback(hObject, eventdata, handles)


function Input_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Calculate_Callback(hObject, eventdata, handles)
%% For input and result
num = str2num(get(handles.Input,'string'));
result = OxygenLevel(num);
set(handles.Output,'string',strcat(num2str(result),' per/MU'));
%% For Percentage
pp=round((result)/1000000*100*100000)/100000;					
pp=abs(pp);
set(handles.Output2,'string',strcat(num2str(pp),' %'));
%% For Plot
year = 1990:2040;
year_cor_value = [];
for i = 1 : length(year)
    year_cor_value = [year_cor_value OxygenLevel(year(i))];
end
plot(year,year_cor_value,'-.r','LineWidth',2)
axis([1990 2040 -1*10^4 1*10^4 ])
% ylim([-1*10^4 1*10^4])
% xlim([1990 2040])
xlabel('Year >>');
ylabel('Value >>');
grid on
hold on
stem(num,result,'ob');


function Clear_Callback(hObject, eventdata, handles)
set(handles.Input,'string','');
set(handles.Output,'string','');
set(handles.Output2,'string','');
cla reset
