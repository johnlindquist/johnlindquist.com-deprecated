package johnlindquist
{
    import flash.events.Event;

    public class FormEvent extends Event
    {
        public static const TEXT_BLANK:String = "textBlank";
        public static const TEXT_READY:String = "textReady";
        public static const CLEAR:String = "clear";
        public static const SUBMIT:String = "submit";


        public function FormEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
        {
            super(type, bubbles, cancelable);
        }

        override public function clone():Event
        {
            return new FormEvent(type, bubbles, cancelable);
        }
    }
}
