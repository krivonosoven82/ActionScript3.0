package{
	import flash.display.Sprite;
	import flash.events.ContextMenuEvent;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	import flash.ui.Mouse;

	public class ExampleContextMenu extends Sprite{	
		private var square:Sprite = new Sprite();
		
		public function ExampleContextMenu(){
			square.graphics.beginFill(0x000000); 
			square.graphics.drawRect(0, 0, 100, 100); 
			square.graphics.endFill(); 
			addChild(square); 
			square.x = 20;
			square.y = 20;
			
			var menuItem:ContextMenuItem = new ContextMenuItem("Change Color");
			menuItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, changeColor);
			
			var customContextMenu:ContextMenu = new ContextMenu();
			customContextMenu.hideBuiltInItems();
			customContextMenu.customItems.push(menuItem);
			square.contextMenu = customContextMenu;
		}
		private function changeColor(e:ContextMenuEvent):void{
			square.transform.colorTransform = getRandomColor();
		}
		
		private function getRandomColor():ColorTransform{
			return new ColorTransform(Math.random(), Math.random(), Math.random(), 1, (Math.random()*512)-255, 
				(Math.random()*512)-255, (Math.random()*512)-255, 0);
		}
	}
}