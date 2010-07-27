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
			textSubmitted.mapTo(function():String{return input.text});
			
		}
	}
}