package johnlindquist
{
    import flash.events.MouseEvent;

    import org.robotlegs.mvcs.Mediator;

    public class SubmitButtonMediator extends Mediator
    {
        [Inject]
        public var submitButton:SubmitButton;

        override public function onRegister():void
        {
            submitButton.addEventListener(MouseEvent.CLICK, onClick)
            eventDispatcher.addEventListener(FormEvent.TEXT_BLANK, onTextBlank)
            eventDispatcher.addEventListener(FormEvent.TEXT_READY, onTextReady)
        }

        private function onTextReady(event:FormEvent):void
        {
            submitButton.enable();
        }

        private function onTextBlank(event:FormEvent):void
        {
            submitButton.disable();
        }

        private function onClick(event:MouseEvent):void
        {
            eventDispatcher.dispatchEvent(new FormEvent(FormEvent.SUBMIT));
            submitButton.disable();
        }
    }
}