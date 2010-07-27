package
{
	import com.flashartofwar.camo.components.TextArea;

	import flash.display.Sprite;

	import johnlindquist.ViewComponent;

	public class NativeMappSignalDemo extends Sprite
	{
		protected var display:TextArea;

		public function NativeMappSignalDemo()
		{
			include "styles.css"

			var viewComponent:ViewComponent = new ViewComponent();
			addChild(viewComponent);

			viewComponent.textSubmitted.add(onTextSubmitted);

			display = new TextArea("display");
			addChild(display);
		}

		private function onTextSubmitted(submittedText:String):void
		{
			display.text = submittedText;			
		}
	}
}
