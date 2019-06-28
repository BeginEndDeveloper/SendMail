unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdAttachmentFile, IdText,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    mLog: TMemo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    eName: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    mBody1: TMemo;
    btSend1: TButton;
    eSubject1: TEdit;
    eFrom1: TEdit;
    eFor1: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    btSend2: TButton;
    eSubject2: TEdit;
    mBody2: TMemo;
    eFrom2: TEdit;
    eFor2: TEdit;
    eFileName2: TEdit;
    Button1: TButton;
    Label11: TLabel;
    Label13: TLabel;
    Button3: TButton;
    eSubject3: TEdit;
    eFrom3: TEdit;
    eFor3: TEdit;
    Label14: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Button2: TButton;
    eSubject4: TEdit;
    eFrom4: TEdit;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    cdsClients: TClientDataSet;
    cdsClientsFirstName: TStringField;
    cdsClientsMiddleName: TStringField;
    cdsClientsLastName: TStringField;
    cdsClientsMail: TStringField;
    cdsClientsSendStatus: TBooleanField;
    dsClients: TDataSource;
    procedure btSend1Click(Sender: TObject);
    procedure btSend2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    function SendMail(aName, aSubject, aAddress, aMailAddresses, aBody: string; aMesgFileName: string = ''): Boolean;
    function SendMailAnket(aLastName, aFirstName, aMiddleName, aMailAddresses: string): Boolean;
    Procedure LoadData;
  public
    { Public declarations }
  end;

const
  pass: string = 'Developer2018';
  uname: string = 'beginendtest1@mail.ru';

var
  frmMain: TfrmMain;

procedure GetSMTPOptionsMAIL(aIdSMTP: TIdSMTP);

implementation

{$R *.dfm}

procedure GetSMTPOptionsMAIL(aIdSMTP: TIdSMTP);
var
  IdSSLIOH: TIdSSLIOHandlerSocketOpenSSL;
begin
  IdSSLIOH := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  aIdSMTP.Host := 'smtp.mail.ru';
  aIdSMTP.Port := 587;
  aIdSMTP.Password := pass;
  aIdSMTP.Username := uname;
  aIdSMTP.IOHandler := IdSSLIOH;
  aIdSMTP.UseTLS := utUseExplicitTLS;
  aIdSMTP.ReadTimeout := 15000;
end;


procedure TfrmMain.btSend1Click(Sender: TObject);
begin
  btSend1.Enabled := False;
  try
    // mLog.Lines.Add('');
    mLog.Lines.Add('Старт отправки');
    if not SendMail(eName.Text, eSubject1.Text, eFrom1.Text, eFor1.Text, mBody1.Text) then
      ShowMessage('Ошибонька отправки!');
    mLog.Lines.Add('Конец отправки');
  finally
    btSend1.Enabled := True;
  end;
end;

procedure TfrmMain.btSend2Click(Sender: TObject);
begin
  btSend2.Enabled := False;
  try
    // mLog.Lines.Add('');
    mLog.Lines.Add('Старт отправки');
    if not SendMail(eName.Text, eSubject2.Text, eFrom2.Text, eFor2.Text, mBody2.Text, eFileName2.Text) then
      ShowMessage('Ошибонька отправки!');
    mLog.Lines.Add('Конец отправки');
  finally
    btSend2.Enabled := True;
  end;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
var
  OpenDialog: TOpenDialog;
begin
  OpenDialog := TOpenDialog.Create(nil);
  try
    if OpenDialog.Execute then
      eFileName2.Text := OpenDialog.FileName;
  finally
    OpenDialog.Free;
  end;

end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  with cdsClients do
  begin
    Button2.Enabled := False;
    DisableControls;
    try
      First;
      while not Eof do
      begin
        if SendMailAnket(FieldByName('LastName').AsString, FieldByName('FirstName').AsString, FieldByName('MiddleName').AsString, FieldByName('Mail').AsString) then
        begin
          Edit;
          FieldByName('SendStatus').AsBoolean := True;
          Post;
        end;
        Next;
      end;
    finally
      EnableControls;
      Button2.Enabled := True;
    end;
  end;
end;

procedure TfrmMain.Button3Click(Sender: TObject);
var
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
  FAttach, FAttachTBG, FAttachFooter, FAttachRBG, FAttachLBG: TIdAttachmentFile;
  txtpart, htmpart: TIdText;
begin
  IdSMTP := TIdSMTP.Create(nil);
  IdMessage := TIdMessage.Create(nil);
  try
    try
      // Заполняем настройки СМТП
      GetSMTPOptionsMAIL(IdSMTP);
      // Коннектимся
      mLog.Lines.Add('Коннект СМТП');
      IdSMTP.Connect();
    except
      Exit;
    end;
    //
    if IdSMTP.Connected then
    begin
      try
        // ----------------// Настройки почты //----------------//
        with IdMessage do
        begin
          Clear;
          AttachmentEncoding;
          Body.Clear;
          ContentType := 'multipart/alternative; CharSet=Windows-1251';
          ContentTransferEncoding := '8bit';
          Subject := eSubject3.Text;
          From.Name := eName.Text;
          From.Address := eFrom3.Text;
          Recipients.EMailAddresses := eFor3.Text;
        end;
        // Настройка текстового компонента //
        txtpart := TIdText.Create(IdMessage.MessageParts);
        txtpart.ContentType := 'text/plain';
        txtpart := TIdText.Create(IdMessage.MessageParts);
        txtpart.ContentType := 'multipart/related; type="text/html"';
        // Настройка текстового компонента с телом сообщения в HTML //
        htmpart := TIdText.Create(IdMessage.MessageParts, nil);
        with htmpart do
        begin
          ContentType := 'text/html; charset=UTF-8'; // Не забываем кодировку!!! Иначе получишь вопросики
          Body.Add('<html>');
          Body.Add('<head>');
          Body.Add('<title>Seasons Greetings</title>');
          Body.Add('</head>');
          Body.Add('<body bgcolor="#000000">');
          Body.Add('<center>');
          Body.Add('<table cellpadding="0" cellspacing="0" border="0" bgcolor="#8c0000" width="700" style="text-align:left;">');
          Body.Add('<tr>	<td height="147"  width="700" background="cid:header.jpg">	&nbsp;	</td></tr>');
          Body.Add('<tr>    <td width="700">        <table cellpadding="0" cellspacing="0" border="0" width="700">        <tr>');
          Body.Add('        	<td width="75" background="cid:left-bg.gif" valign="top">            &nbsp;            </td>');
          Body.Add('            <td width="238" background="cid:text-bg.jpg" valign="top" style="font-family:Times, Verdana, Arial, sans-serif; color:#FFFFFF; font-size:15px;">');
          Body.Add('            <span style="color:#efc15d; font-size:30px;">Happy Holidays!</span>');
          Body.Add('<br/><br/>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ipsum turpis, varius id placerat nec, congue a risus. Vivamus ac quam ac nunc tincidunt accumsan sed eget nunc. Duis fringilla nulla sed justo');
          Body.Add('feugiat laoreet. Nullam in mollis metus. Mauris euismod sem mattis odio ultrices accumsan. Nam vulputate ligula porta dolor pulvinar pharetra. Donec id nulla metus.');
          Body.Add('Nunc molestie ante id nunc vestibulum eget gravida nibh tincidunt. Maecenas ut risus quis diam fermentum volutpat. Sed at auctor urna.');
          Body.Add('            <br/>            <br/>- Joseph Ducci            <br/>            <br/>            <br/>            <br/>            <br/>            <br/>');
          Body.Add('            <br/>            </td>            <td width="387" background="cid:right-bg.jpg" valign="top">            &nbsp;');
          Body.Add('            </td>        </tr>        </table>    </td></tr><tr>    <td width="700" height="70" background="cid:footer.jpg">');
          Body.Add('    &nbsp;    </td></tr></table><br/></center></body>');
          Body.Add('</html>');
          ParentPart := 1;
        end;
        // Добавление и настройка картинки //
        try
          FAttach := TIdAttachmentFile.Create(IdMessage.MessageParts, 'images/header.jpg');
          with FAttach do
          begin
            ContentType := 'image/jpeg';
            ContentDisposition := 'inline';
            ContentID := 'header.jpg';
            DisplayName := 'header.jpg';
            ParentPart := 1;
          end;
          FAttachTBG := TIdAttachmentFile.Create(IdMessage.MessageParts, 'images/text-bg.jpg');
          with FAttachTBG do
          begin
            ContentType := 'image/jpeg';
            ContentDisposition := 'inline';
            ContentID := 'text-bg.jpg';
            DisplayName := 'text-bg.jpg';
            ParentPart := 1;
          end;
          FAttachFooter := TIdAttachmentFile.Create(IdMessage.MessageParts, 'images/footer.jpg');
          with FAttachFooter do
          begin
            ContentType := 'image/jpeg';
            ContentDisposition := 'inline';
            ContentID := 'footer.jpg';
            DisplayName := 'footer.jpg';
            ParentPart := 1;
          end;
          FAttachRBG := TIdAttachmentFile.Create(IdMessage.MessageParts, 'images/right-bg.jpg');
          with FAttachRBG do
          begin
            ContentType := 'image/jpeg';
            ContentDisposition := 'inline';
            ContentID := 'right-bg.jpg';
            DisplayName := 'right-bg.jpg';
            ParentPart := 1;
          end;
          FAttachLBG := TIdAttachmentFile.Create(IdMessage.MessageParts, 'images/left-bg.gif');
          with FAttachLBG do
          begin
            ContentType := 'image/jpeg';
            ContentDisposition := 'inline';
            ContentID := 'left-bg.gif';
            DisplayName := 'left-bg.gif';
            ParentPart := 1;
          end;
        except
          Exit;
        end;
        mLog.Lines.Add('Отправляю!');
        IdSMTP.Send(IdMessage);
        mLog.Lines.Add('Сообщение ушло!!');
      finally
        IdSMTP.Disconnect;
        txtpart.Free;
        htmpart.Free;
        FAttach.Free;
        FAttachRBG.Free;
        FAttachFooter.Free;
        FAttachTBG.Free;
        FAttachLBG.Free;
      end;
    end
  finally
    IdSMTP.Free;
    IdMessage.Free;
  end;

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  mLog.Clear;
  cdsClients.CreateDataSet;
  // Грузим данные
  LoadData;
end;

procedure TfrmMain.LoadData;
begin
  cdsClients.EmptyDataSet;
  cdsClients.Append;
  cdsClients.FieldByName('FirstName').Value := 'Иван';
  cdsClients.FieldByName('MiddleName').Value := 'Иванович';
  cdsClients.FieldByName('LastName').Value := 'Иванов';
  cdsClients.FieldByName('Mail').Value := 'beginendtest1@mail.ru';
  cdsClients.Post;
  cdsClients.Append;
  cdsClients.FieldByName('FirstName').Value := 'Мария';
  cdsClients.FieldByName('MiddleName').Value := 'Эмбаркадеровна';
  cdsClients.FieldByName('LastName').Value := 'Делфи';
  cdsClients.FieldByName('Mail').Value := 'beginendtest1@mail.ru';
  cdsClients.Post;
  cdsClients.Append;
  cdsClients.FieldByName('FirstName').Value := 'Пупкин';
  cdsClients.FieldByName('MiddleName').Value := 'Ногович';
  cdsClients.FieldByName('LastName').Value := 'Рукав';
  cdsClients.FieldByName('Mail').Value := 'beginendtest1@mail.ru';
  cdsClients.Post;
  cdsClients.Append;
  cdsClients.FieldByName('FirstName').Value := 'Габен';
  cdsClients.FieldByName('MiddleName').Value := 'Вальвович';
  cdsClients.FieldByName('LastName').Value := 'Вальве';
  cdsClients.FieldByName('Mail').Value := 'beginendtest1@mail.ru';
  cdsClients.Post;
end;

function TfrmMain.SendMail(aName, aSubject, aAddress, aMailAddresses, aBody,
  aMesgFileName: string): Boolean;
var
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
  FAttach: TIdAttachmentFile;
begin
  Result := False;
  // Создаём
  IdSMTP := TIdSMTP.Create(nil);
  IdMessage := TIdMessage.Create(nil);
  try
    try
      // Заполняем настройки СМТП
      GetSMTPOptionsMAIL(IdSMTP);
      // Коннектимся
      mLog.Lines.Add('Коннект СМТП');
      IdSMTP.Connect();
    except
      MessageDlg('Нет соединения с почтой!' + #13 + 'Сообщите программистам!', mtWarning, [mbOk], 0);
      mLog.Lines.Add('Нет соединения! Выходим');
      IdSMTP.Disconnect;
      Exit;
    end;

    try
      if aMesgFileName = '' then
        IdMessage.ContentType := 'text/plain; charset=windows-1251'
      else
      begin
        IdMessage.ContentType := 'multipart/alternative; CharSet=Windows-1251';
        IdMessage.AttachmentEncoding;
      end;
      IdMessage.ContentTransferEncoding := '8bit';
      IdMessage.Subject := aSubject;
      IdMessage.From.Address := aAddress;
      IdMessage.From.Name := aName;
      IdMessage.Recipients.EMailAddresses := aMailAddresses;
      // IdMessage.Encoding := meMIME;
      // IdMessage.CharSet := 'us-ascii';
      IdMessage.Body.Clear;
      IdMessage.Body.Add(aBody);
      mLog.Lines.Add('Заполнили сообщение');
      // Создаём вложенрие
      if aMesgFileName <> '' then
        FAttach := TIdAttachmentFile.Create(IdMessage.MessageParts, aMesgFileName);
      // Отправляем письмо
      mLog.Lines.Add('Отправляю!');
      IdSMTP.Send(IdMessage);
      mLog.Lines.Add('Сообщение ушло!!');
      Result := True;
    except
      mLog.Lines.Add('Сообщение не ушло...');
      ShowMessage('Не удалось отправить сообщение');
    end;
  finally
    if aMesgFileName <> '' then
      FAttach.Free;
    IdMessage.Free;
    IdSMTP.Disconnect;
    IdSMTP.Free;
  end;

end;

function TfrmMain.SendMailAnket(aLastName, aFirstName, aMiddleName,
  aMailAddresses: string): Boolean;
var
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
  FAttach: TIdAttachmentFile;
  txtpart, htmpart: TIdText;
  messtext: string;
  StatusMail: integer;
  DateADD: TDateTime;
begin
  Result := False;
  IdSMTP := TIdSMTP.Create(nil);
  IdMessage := TIdMessage.Create(nil);
  try
    try
      // Заполняем настройки СМТП
      GetSMTPOptionsMAIL(IdSMTP);
      // Коннектимся
      mLog.Lines.Add('Коннект СМТП');
      IdSMTP.Connect();
    except
      Exit;
    end;
    //
    if IdSMTP.Connected then
    begin
      DateADD := Now;
      StatusMail := 1;
      try
        // ----------------// Настройки почты //----------------//
        with IdMessage do
        begin
          Clear;
          AttachmentEncoding;
          Body.Clear;
          ContentType := 'multipart/alternative; CharSet=Windows-1251';
          ContentTransferEncoding := '8bit';
          Subject := eSubject4.Text;
          From.Name := eName.Text;
          From.Address := eFrom4.Text;
          Recipients.EMailAddresses := aMailAddresses;
        end;
        // Настройка текстового компонента, хз зачем, но надо //
        txtpart := TIdText.Create(IdMessage.MessageParts);
        txtpart.ContentType := 'text/plain';
        txtpart := TIdText.Create(IdMessage.MessageParts);
        txtpart.ContentType := 'multipart/related; type="text/html"';
        // Настройка текстового компонента с телом сообщения в HTML //
        htmpart := TIdText.Create(IdMessage.MessageParts, nil);
        with htmpart do
        begin
          case StatusMail of
            0:
              messtext := 'следующих пяти дней';
            1:
              messtext := 'следующих трех дней';
            3:
              messtext := 'следующего дня';
          end;
          ContentType := 'text/html; charset=UTF-8'; // Не забываем кодировку!!! Иначе получишь вопросики
          Body.Add('<html>');
          Body.Add('<head></head>');
          Body.Add('<body>'); // <h1>Заголовок</h1>');
          Body.Add('<img src="cid:header.jpg" /><br>');
          Body.Add('Уважаемый(ая) ' + aLastName + ' ' + aFirstName + ' ' + aMiddleName + ', <br><br>' + 'Благодарим Вас за выбор сервиса "BeginEndDeveloper". <br><br>' +
            'Для нас чрезвычайно важно Ваше мнение о качестве нашей работы. Будем признательны, если Вы найдете время, чтобы рассказать нам о Вашем впечатлении от посещения нашего сервиса '
            + DateToStr(DateADD) + ', чтобы мы могли в будущем улучшить качество наших услуг для Вашего полного удовлетворения. <br><br>' +
            'Пожалуйста, пройдите опрос по <a href="https://vk.com/bedevel" title="ВК">ссылке</a>. <br><br>' + 'Опрос займёт не более 5 минут и будет доступен для вас в течение ' +
            messtext + '.<br><br>' + 'Заранее благодарим Вас за уделенное нам время.<br><br><br>' + 'С уважением,<br>' + 'Служба по работе с клиентами.</body>');
          Body.Add('</html>');
          ParentPart := 1;
        end;
        // Добавление и настройка картинки //
        try
          FAttach := TIdAttachmentFile.Create(IdMessage.MessageParts, 'header.jpg');
          with FAttach do
          begin
            ContentType := 'image/jpeg';
            ContentDisposition := 'inline';
            ContentID := 'header.jpg';
            DisplayName := 'header.jpg';
            ParentPart := 1;
          end;
        except
          Exit;
        end;
        mLog.Lines.Add('Отправляю!' + aLastName + ' ' + aFirstName + ' ' + aMiddleName);
        IdSMTP.Send(IdMessage);
        mLog.Lines.Add('Сообщение ушло!!');
        Result := True;
      finally
        IdSMTP.Disconnect;
        Button2.Enabled := True;
        txtpart.Free;
        htmpart.Free;
        FAttach.Free;
      end;
    end;
  finally
    IdSMTP.Free;
    IdMessage.Free;
  end;

end;

end.
