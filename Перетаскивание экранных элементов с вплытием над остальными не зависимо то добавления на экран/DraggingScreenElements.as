package
{
	//import flash.display.Shape;
	//import flash.display.Stage;
	//import flash.display.StageDisplayState;
	//import flash.display.StageScaleMode;
	//import flash.events.FullScreenEvent;	
	//import flash.geom.*;
	//import flash.text.TextField; 
	
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class DraggingScreenElements extends Sprite
	{
		private var rec1:Sprite = new Sprite();
		private var rec2:Sprite = new Sprite();
		private var rec1PosX:Number = 10;
		private var rec1PosY:Number = 10;
		private var rec2PosX:Number = 100;
		private var rec2PosY:Number = 10;
		private var widthRec:Number = 50;
		private var heightRec:Number = 50;
		
		
		private var offsetX:Number;
		private var offsetY:Number;
		private var draggedObject:DisplayObject;
		
		public function DraggingScreenElements()
		{  
			rec1.graphics.lineStyle(1, 0x0000ff);
			rec1.graphics.beginFill(0x00ff00, 1);
			//Если x=10, y=10, то на холсте они отобразятся x==10, y==10. Но при вызове свойства
			//rec1.x, rec1.y покажет rec1.x==0, rec1.y==0; 
			rec1.graphics.drawRect(0, 0, widthRec, heightRec);
			rec1.graphics.endFill();
			stage.addChild(rec1);
			//задаем координаты по x, y. Иначе они будут == 0 вне зависимости от координат в конструкторе
			rec1.x = rec1PosX;
			rec1.y = rec1PosY;
			
			rec2.graphics.lineStyle(1, 0xff0000);
			rec2.graphics.beginFill(0x00ff00, 1);
			rec2.graphics.drawRect(0, 0, widthRec, heightRec);
			rec2.graphics.endFill();
			stage.addChild(rec2);
			rec2.x = rec2PosX;
			rec2.y = rec2PosY;
			
			rec1.addEventListener(MouseEvent.MOUSE_DOWN, startDragging);
			rec1.addEventListener(MouseEvent.MOUSE_UP, stopDragging);
			rec2.addEventListener(MouseEvent.MOUSE_DOWN, startDragging);
			rec2.addEventListener(MouseEvent.MOUSE_UP, stopDragging);	
		}
		
		
		private function startDragging(e:MouseEvent):void{
			draggedObject = DisplayObject(e.target);
			offsetX = e.stageX - draggedObject.x;
			offsetY = e.stageY - draggedObject.y;
			stage.addChild(draggedObject);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, dragObject);
		} 
		private function stopDragging(e:MouseEvent):void{
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, dragObject);
		}
		private function dragObject(e:MouseEvent):void{
			draggedObject.x = e.stageX - offsetX;
			draggedObject.y = e.stageY - offsetY;
			e.updateAfterEvent();
		}
		
	}
}