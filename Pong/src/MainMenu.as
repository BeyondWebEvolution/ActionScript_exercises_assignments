package 
{
	import flash.display.Sprite;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.SoftKeyboardEvent;
	import flash.events.MouseEvent;
	
	public class MainMenu extends Sprite implements IState{
		
		private var _lblPong:Label;
		private var _btnStart:SimpleButton;
		private var _document:Document;
		
		public function MainMenu(document:Document){
			super();	
			_document = document;	
			_lblPong = new Label("THIS IS MY PONG GAME!", 92, Config.WHITE, "Ostrich", true);
			_lblPong.x = Config.WORLD_CENTER_X - _lblPong.textWidth * 0.5;
			_lblPong.y = 150;
			addChild(_lblPong);
			
			_btnStart = new SimpleButton(Assets.getImage("btnNormal"),
										Assets.getImage("btnHover"),
										Assets.getImage("btnClick"),
										Assets.getImage("btnNormal"));
										
			_btnStart.x = Config.WORLD_CENTER_X - _btnStart.width * 0.5;
			_btnStart.y = 300;
			addChild(_btnStart);
			addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
		}
		
		private function onClick(e:Event):void{
			_document.changeState(Config.GAME_STATE_INSTRUCTIONS);
		}
		
		public function destroy():void {
			removeEventListener(MouseEvent.CLICK, onClick);
			removeChild(_lblPong);
			_lblPong = null;
			
			removeChild(_btnStart);
			_btnStart = null;
			
			_document = null;
		}
		
		public function update():void {}
		
	}

}