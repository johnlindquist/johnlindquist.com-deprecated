/**
 * User: John Lindquist
 * Date: Sep 21, 2010
 * Time: 11:46:16 PM
 */
package v
{
    import flash.display.Sprite;
    import flash.text.TextField;

    public class Readout extends Sprite
    {
        protected var textField:TextField;

        public function Readout()
        {
            textField = new TextField()
            addChild(textField);
        }

        public function setText(str:String):void
        {
            textField.text = str;
        }
    }
}