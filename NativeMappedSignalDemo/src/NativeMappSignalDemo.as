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
			//old school ;)
			include "styles.as"

			display = new TextArea("display");
			addChild(display);

			var viewComponent:ViewComponent = new ViewComponent();
			addChild(viewComponent);

			viewComponent.textSubmitted.add(onTextSubmitted)
		}

		protected function onTextSubmitted(submittedText:String):void
		{
			display.text = submittedText;
		}
	}
}
