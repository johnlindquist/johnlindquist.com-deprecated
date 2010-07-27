package johnlindquist
{
	import com.flashartofwar.camo.components.LabelButton;
	import com.flashartofwar.camo.components.TextInputLabel;

	import flash.display.Sprite;

	import flash.events.MouseEvent;

	import org.osflash.signals.natives.NativeMappedSignal;

	public class ViewComponent extends Sprite
	{

		public var textSubmitted:NativeMappedSignal;

		public function ViewComponent()
		{
			var input:TextInputLabel = new TextInputLabel("input");
			addChild(input);

			var button:LabelButton = new LabelButton("button");
			addChild(button);

			textSubmitted = new NativeMappedSignal(button, MouseEvent.CLICK);

			//option #1 - properties
//			textSubmitted.mapTo(input.text);

			//option #2 - function
			textSubmitted.mapTo(function():String
			{
				return input.text
			});

			//option #3 - event
//			textSubmitted.mapTo(function(event:MouseEvent):String
//			{
//				return event.toString();
//			});
		}
	}
}