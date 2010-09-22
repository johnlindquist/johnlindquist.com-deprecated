package
{
    import flash.display.Sprite;

    import m.StatsModel;

    public class MoneyDemo extends Sprite
    {
        public function MoneyDemo()
        {
            $(StatsModel).put();
            $(Sprite, this).put();
        }
    }
}
