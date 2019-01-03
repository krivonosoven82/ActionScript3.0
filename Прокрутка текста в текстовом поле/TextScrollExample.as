package{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.*;

	public class TextScrollExample extends Sprite{
		private var myTextBox:TextField = new TextField();
		private var myText:String = "Hello world and welcome to the show." +
			" It's really nice to meet you." +
			" Take your coat off and stay a while." +
			" OK, show is over. Hope you had fun." +
			" You can go home now." +
			" Don't forget to tip your waiter." +
			" There are mints in the bowl by the door." +
			" Thank you. Please come again.";
		private var format:TextFormat = new TextFormat();
		
		public function TextScrollExample(){ 
			myTextBox.text = myText;
			myTextBox.width = 200;
			myTextBox.height = 50;
			myTextBox.multiline = true;
			myTextBox.wordWrap = true;
			myTextBox.background = true;
			myTextBox.border = true;
			
			format.font = "Verdana";
			format.color = 0xff0000;
			format.size = 10;
			
			myTextBox.defaultTextFormat = format;
			addChild(myTextBox);
			
			myTextBox.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownScroll);
		}
		private function mouseDownScroll(e:MouseEvent):void{
			myTextBox.scrollV++;
		}
	}
}