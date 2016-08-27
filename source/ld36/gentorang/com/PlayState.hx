package ld36.gentorang.com;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.group.FlxGroup;

class PlayState extends FlxState
{
	
	//public vars
	
	//private vars
	private var _player:Player;
	private var _grpPlayerFire1:FlxTypedGroup<Projectile>;
	
	/**
	 * Constructor!
	 */
	override public function create():Void
	{
		_grpPlayerFire1 =  new FlxTypedGroup<Projectile>();
		this.add(_grpPlayerFire1);
		_player = new Player(50, 50, _grpPlayerFire1);
		this.add(_player);
		
		super.create();
	}

	/**
	 * Update
	 * @param	elapsed
	 */
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		destroyProjectiles();
	}
	
	/**
	 * Destroy any offscreen projectiles
	 */
	private function destroyProjectiles()
	{
		var proj:Projectile;
		
		for(proj in _grpPlayerFire1)
		{
			if (proj.x > FlxG.width){
				_grpPlayerFire1.remove(proj);
				proj.destroy();
			}
		}
	}
}