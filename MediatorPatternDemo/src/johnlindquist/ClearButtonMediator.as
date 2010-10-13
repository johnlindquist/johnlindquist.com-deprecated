package johnlindquist
{
    import flash.events.MouseEvent;

    import org.robotlegs.mvcs.Mediator;

    public class ClearButtonMediator extends Mediator
    {
        [Inject]
        public var clearButton:ClearButton;

        override public function onRegister():void
        {
            clearButton.addEventListener(MouseEvent.CLICK, onClick);
            
            eventDispatcher.addEventListener(FormEvent.TEXT_BLANK, onTextBlank)
            eventDispatcher.addEventListener(FormEvent.TEXT_READY, onTextReady)
        }

        private function onTextReady(event:FormEvent):void
        {
            clearButton.enable();
        }

        private function onTextBlank(event:FormEvent):void
        {
            clearButton.disable();
        }

        private function onClick(event:MouseEvent):void
        {
            eventDispatcher.dispatchEvent(new FormEvent(FormEvent.CLEAR));
        }
    }
}