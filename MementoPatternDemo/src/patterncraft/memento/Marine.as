package patterncraft.memento
{
	import flash.display.Sprite;

	public class Marine extends Sprite
	{
        public function get memento():MarineMemento
        {
            return new MarineMemento(this.x, this.y);
        }

        public function set memento(value:MarineMemento):void
        {
            this.x = value.x;
            this.y = value.y;
        }
        
        
		public function Marine()
		{
			graphics.beginFill(0xcc0000);
			graphics.drawCircle(0, 0, 20);
			graphics.endFill();
		}
	}
}