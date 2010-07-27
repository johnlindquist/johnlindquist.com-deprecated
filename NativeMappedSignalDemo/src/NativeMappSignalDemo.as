package
{
	import com.flashartofwar.camo.components.TextArea;
	import com.flashartofwar.camo.managers.SingletonManager;
	import com.flashartofwar.fcss.stylesheets.StyleSheetCollection;

	import flash.display.Sprite;

	import johnlindquist.ViewComponent;

	public class NativeMappSignalDemo extends Sprite
	{
		[Embed(source="styles.css",mimeType="application/octet-stream")]
		protected var styles:Class;

		protected var display:TextArea;

		public function NativeMappSignalDemo()
		{
			var styleSheet:StyleSheetCollection = SingletonManager.getClassReference(StyleSheetCollection);
			styleSheet.parseCSS(new styles().toString());

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
