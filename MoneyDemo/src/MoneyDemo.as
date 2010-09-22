package
{
    import controller.StartupCommand;

    import flash.display.Sprite;

    public class MoneyDemo extends Sprite
    {
        //This demo duplicates the functionality of the Robotlegs "Hello Flash" demo
        
        public function MoneyDemo()
        {
            $(Sprite, this).set();
            $(StartupCommand).run();
        }
    }
}
