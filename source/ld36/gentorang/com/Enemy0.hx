package ld36.gentorang.com;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.group.FlxGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxEase.EaseFunction;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxTween.TweenOptions;

/**
 * ...
 * @author idovoodoo
 */
class Enemy0 extends FlxSprite
{
	//public vars
	public var speed:Float = 75;

	//private vars
	
	
	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		
		//place holder graphic
		//this.makeGraphic(64, 64, FlxColor.BLUE);
		
		this.loadGraphic(AssetPaths.enemy0__png, true, 64, 93);
		//this.animation.add("move", [0, 1], 6, false);
		
	}
	
	/**
	 * Update
	 * @param	elapsed
	 */
	override public function update(elapsed:Float):Void
	{
		//this.animation.play("move");
		movement();
		
		super.update(elapsed);
	}
	
	private function movement():Void
	{
		velocity.x = -speed;
		velocity.y = Math.sin(this.x / 30) * 128;
	}
}