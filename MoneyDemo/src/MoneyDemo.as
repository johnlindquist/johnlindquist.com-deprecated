package
{
    import controller.StartupCommand;

    import flash.display.Sprite;

    public class MoneyDemo extends Sprite
    {
        public function MoneyDemo()
        {
            $(Sprite, this).set();
            $(StartupCommand).run();
        }
    }
}
