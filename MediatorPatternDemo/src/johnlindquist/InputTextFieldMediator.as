package johnlindquist
{
    import flash.events.Event;

    import org.robotlegs.mvcs.Mediator;

    public class InputTextFieldMediator extends Mediator
    {
        [Inject]
        public var inputTextField:InputTextField;

        override public function onRegister():void
        {
            inputTextField.addEventListener(Event.CHANGE, onChange);
            
            eventDispatcher.addEventListener(FormEvent.CLEAR, onClear)
            eventDispatcher.addEventListener(FormEvent.SUBMIT, onSubmit)
        }

        private function onSubmit(event:FormEvent):void
        {
            inputTextField.text = "Submitted!";
        }

        private function onClear(event:FormEvent):void
        {
            inputTextField.text = ""
        }

        private function onChange(event:Event):void
        {
            if(inputTextField.text.length == 0)
            {
                eventDispatcher.dispatchEvent(new FormEvent(FormEvent.TEXT_BLANK));
            }
            else
            {
                eventDispatcher.dispatchEvent(new FormEvent(FormEvent.TEXT_READY));
            }
        }
    }
}