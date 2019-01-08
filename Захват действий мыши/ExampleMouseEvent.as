package{
//Объект MouseEvent также содержит логические свойства altKey, ctrlKey и shiftKey. 
//Эти свойства можно использовать для проверки того, нажаты ли во время щелчка клавиши Alt, Ctrl или Shift.

	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class ExampleMouseEvent extends Sprite{
		
		private var square:Sprite = new Sprite();
		
		public function ExampleMouseEvent(){
			square.graphics.beginFill(0xFF0000); 
			square.graphics.drawRect(0,0,100,100); 
			square.graphics.endFill(); 
			square.addEventListener(MouseEvent.CLICK, reportClick);
			square.x = 50;
			square.y = 50;
			addChild(square);
		
			stage.addEventListener(MouseEvent.CLICK, reportClick)
		}
		private function reportClick(e:MouseEvent):void{
			trace(e.currentTarget.toString() + " dispatches MouseEvent. Local coords [" +
				e.localX + "," + e.localY + "] Stage coords [" + e.stageX + "," + e.stageY + "]");
		}
	}
}