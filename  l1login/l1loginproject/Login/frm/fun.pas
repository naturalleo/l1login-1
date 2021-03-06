unit fun;



interface

uses
  Windows,Forms,SysUtils,TlHelp32,ActiveX,ComObj,ShlObj;

procedure createlink;//创建快捷方式
procedure checkClient;//检查是否为客户端
procedure  Mutex;//进程互斥
implementation
uses main;

procedure createlink;
var 
tmpObject : IUnknown; 
tmpSLink : IShellLink;
tmpPFile : IPersistFile; 
PIDL : PItemIDList; 
StartupDirectory : array[0..MAX_PATH] of Char;
StartupFilename : String; 
LinkFilename : WideString;
begin
//创建快捷方式到桌面 
StartupFilename :=Application.ExeName;
tmpObject := CreateComObject(CLSID_ShellLink);//创建建立快捷方式的外壳扩展 
tmpSLink := tmpObject as IShellLink;//取得接口 
tmpPFile := tmpObject as IPersistFile;//用来储存*.lnk文件的接口 
tmpSLink.SetPath(pChar(StartupFilename));//设定所在路径 
tmpSLink.SetWorkingDirectory(pChar(ExtractFilePath(StartupFilename)));//设定工作目录
SHGetSpecialFolderLocation(0,CSIDL_DESKTOPDIRECTORY,PIDL);//获得桌面的Itemidlist 
tmpSLink.SetDescription('天堂登陆器');
tmpSLink.SetIconLocation(Pchar(StartupFilename),0);
SHGetPathFromIDList(PIDL,StartupDirectory);//获得桌面路径 
LinkFilename := StartupDirectory + string('\')+ cfg.LoginName +'.lnk';
tmpPFile.Save(pWChar(LinkFilename),FALSE);//保存*.lnk文件 
end;

procedure checkClient;
begin
  if not FileExists(ExtractFilePath(ParamStr(0))+'npkcrypt.sys') then
  begin
    Application.MessageBox('请把登陆器放到天堂游戏目录下!','提示信息',MB_ICONINFORMATION+ MB_OK);
    Application.Terminate;
    exit;
  end;
end;

procedure  Mutex;
var
 hMutex:HWND;
begin
///////////////////////////////创建互斥进程/////////////////////////////
  hMutex := CreateMutex(nil,True,'johntao');
  if hMutex <> 0 then
    if GetLastError = ERROR_ALREADY_EXISTS then
    begin
      Application.MessageBox('禁止多开登陆器!','提示信息',MB_OK);
      Application.Terminate;
    end;
///////////////////////////////end/////////////////////////////////////
end;
end.
