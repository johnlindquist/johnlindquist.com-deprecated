/**
 * User: John Lindquist
 * Date: 10/13/10
 * Time: 1:35 AM
 */
package johnlindquist
{
    import flash.display.Sprite;

    public class ClearButton extends Sprite
    {
        public function ClearButton()
        {
            disable();
        }

        public function enable():void
        {
            graphics.clear();
            graphics.beginFill(0xcc0000);
            graphics.drawRect(0, 0, 100, 25);
            graphics.endFill();
        }
        
        public function disable():void
        {
            graphics.clear();
            graphics.beginFill(0xaaaaaa);
            graphics.drawRect(0, 0, 100, 25);
            graphics.endFill();
        }
    }
}