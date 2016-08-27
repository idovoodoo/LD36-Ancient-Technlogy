package ld36.gentorang.com;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author idovoodoo
 */
class Player extends FlxSprite
{
	//public vars
	public var speed:Float = 150;
	
	//private vars
	

	/**
	 * Constructor!!
	 * @param	X start pos
	 * @param	Y start pos
	 */
	public function new(X:Float = 0, Y:Float = 0) 
	{
		super(X, Y);
		
		//place holder graphic
		this.makeGraphic(64, 64, FlxColor.BLUE);
	}
	
	/**
	 * Update
	 * @param	elapsed
	 */
	override public function update(elapsed:Float):Void
	{
		this.drag.x = this.drag.y = 1200;
		movement();
		
		super.update(elapsed);
	}
	
	/**
	 * Moves the player based on user input
	 */
	private function movement():Void
	{
		var _up:Bool = false;
		var _down:Bool = false;
		var _left:Bool = false;
		var _right:Bool = false;
		
		//key listeners
		_up 	= FlxG.keys.anyPressed([UP, W]);
		_down	= FlxG.keys.anyPressed([DOWN, S]);
		_left 	= FlxG.keys.anyPressed([LEFT, A]);
		_right 	= FlxG.keys.anyPressed([RIGHT, D]);
		
		//cancel opposing directions
		if (_up && _down)
			_up = _down = false;
		if (_left && _right)
			_left = _right = false;
			
		//check and move the player
		if (_up || _down || _left || _right)
		{		
			//set player direction
			var pAngle:Float = 0;
			if (_up)
			{
				pAngle = -90;
				if (_left) 			pAngle -= 45;
				else if (_right) 	pAngle += 45;
				
				this.facing = FlxObject.UP;
			}
			else if (_down)
			{
				pAngle = 90;
				if (_left) 			pAngle += 45;
				else if (_right) 	pAngle -= 45;
				
				this.facing = FlxObject.DOWN;
			}
			else if (_left) 
			{
				pAngle = 180;
				
				this.facing = FlxObject.LEFT;
			}
			else if (_right) 
			{
				pAngle = 0;
				
				this.facing = FlxObject.RIGHT;
			}
			
			//set player velocity and angle
			this.velocity.set(speed, 0);
			this.velocity.rotate(FlxPoint.weak(0, 0), pAngle);
			
		}
	}
	
}