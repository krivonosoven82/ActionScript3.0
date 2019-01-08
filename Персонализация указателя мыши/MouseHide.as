package{

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;

	public class MouseHide extends Sprite{	
		private var cursor:Sprite = new Sprite();
		
		public function MouseHide(){
			cursor.graphics.beginFill(0x000000); 
			cursor.graphics.drawCircle(0,0,20); 
			cursor.graphics.endFill(); 
			addChild(cursor); 
			cursor.x = 20;
			cursor.y = 20;
			
			stage.addEventListener(MouseEvent.MOUSE_MOVE, redrawCursor);
			Mouse.hide();
		}
		private function redrawCursor(e:MouseEvent):void{
			cursor.x = e.stageX;
			cursor.y = e.stageY;
		}
	}
}