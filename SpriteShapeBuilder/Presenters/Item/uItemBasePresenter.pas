unit uItemBasePresenter;

interface

uses
  System.Classes, System.Types,
  uIItemPresenter, uIItemPresenterEvent, uMVPFrameWork, uIItemView, uSSBModels;

type
  TItemBasePresenter = class abstract(TPresenter, IItemPresenter, IPresenterEvent)
  protected
    FView: IItemView;
    FOnMouseDown, FOnMouseUp, FOnMouseMove: TNotifyEvent;
    procedure SetOnMouseDown(AHandler: TNotifyEvent); virtual;
    function GetOnMouseDown: TNotifyEvent; virtual;
    procedure SetOnMouseUp(AHandler: TNotifyEvent); virtual;
    function GetOnMouseUp: TNotifyEvent; virtual;
    procedure SetOnMouseMove(AHandler: TNotifyEvent); virtual;
    function GetOnMouseMove: TNotifyEvent; virtual;
    function GetRect: TRectF; virtual; abstract;
    procedure SetRect(const Value: TRectF); virtual; abstract;
  public
    property OnMouseDown: TNotifyEvent read GetOnMouseDown write SetOnMouseDown;
    property OnMouseUp: TNotifyEvent read GetOnMouseUp write SetOnMouseUp;
    property OnMouseMove: TNotifyEvent read GetOnMouseMove write SetOnMouseMove;
    property Rect: TRectF read GetRect write SetRect;
    procedure Delete; virtual; abstract;
    procedure MouseDown; virtual; abstract;
    procedure MouseUp; virtual; abstract;
    procedure MouseMove; virtual; abstract;
    constructor Create(const AItemView: IItemView); reintroduce; virtual;
  end;

implementation

{ TBaseItemPresenter }

constructor TItemBasePresenter.Create(const AItemView: IItemView);
begin
  FView := AItemView;
end;

function TItemBasePresenter.GetOnMouseDown: TNotifyEvent;
begin
  Result := FOnMouseDown;
end;

function TItemBasePresenter.GetOnMouseMove: TNotifyEvent;
begin
  Result := FOnMouseMove;
end;

function TItemBasePresenter.GetOnMouseUp: TNotifyEvent;
begin
  Result := FOnMouseUp;
end;

procedure TItemBasePresenter.SetOnMouseDown(AHandler: TNotifyEvent);
begin
  FOnMouseDown := AHandler;
end;

procedure TItemBasePresenter.SetOnMouseMove(AHandler: TNotifyEvent);
begin
  FOnMouseMove := AHandler;
end;

procedure TItemBasePresenter.SetOnMouseUp(AHandler: TNotifyEvent);
begin
  FOnMouseUp := AHandler;
end;

end.