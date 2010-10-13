/**
 * User: John Lindquist
 * Date: 10/13/10
 * Time: 1:35 AM
 */
package johnlindquist
{
    import flash.events.Event;
    import flash.text.TextField;
    import flash.text.TextFieldType;

    public class InputTextField extends TextField
    {
        public function InputTextField()
        {
            type = TextFieldType.INPUT;
            border = true;
        }

        override public function set text(value:String):void
        {
            super.text = value;
            dispatchEvent(new Event(Event.CHANGE));
        }
    }
}