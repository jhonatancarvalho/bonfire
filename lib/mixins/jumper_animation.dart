import 'package:bonfire/mixins/direction_animation.dart';
import 'package:bonfire/mixins/jumper.dart';
import 'package:bonfire/util/direction.dart';
import 'package:bonfire/util/direction_animations/simple_animation_enum.dart';

enum JumpAnimationsEnum {
  jumpUpRight,
  jumpUpLeft,
  jumpDownRight,
  jumpDownLeft,
}

/// Mixin used to adds animations in a Jumper.
mixin JumperAnimation on Jumper, DirectionAnimation {
  @override
  void onPlayRunDownAnimation() {
    if (jumping) {
      if (lastDirectionHorizontal == Direction.left) {
        _jumpDownLeft();
      } else {
        animation?.playOther(
          JumpAnimationsEnum.jumpDownRight,
          flipX: false,
        );
      }
    }
  }

  @override
  void onPlayRunDownRightAnimation() {
    if (jumping) {
      animation?.playOther(JumpAnimationsEnum.jumpDownRight, flipX: false);
    } else {
      super.onPlayRunDownRightAnimation();
    }
  }

  @override
  void onPlayRunDownLeftAnimation() {
    if (jumping) {
      _jumpDownLeft();
    } else {
      super.onPlayRunDownLeftAnimation();
    }
  }

  @override
  void onPlayRunUpLeftAnimation() {
    if (jumping) {
      _playJumpUpLeft();
    } else {
      super.onPlayRunUpLeftAnimation();
    }
  }

  @override
  void onPlayRunLeftAnimation() {
    if (jumping) {
      _playJumpUpLeft();
    } else {
      super.onPlayRunLeftAnimation();
    }
  }

  @override
  void onPlayRunRightAnimation() {
    if (jumping) {
      animation?.playOther(JumpAnimationsEnum.jumpUpRight, flipX: false);
    } else {
      super.onPlayRunRightAnimation();
    }
  }

  @override
  void onPlayRunUpRightAnimation() {
    if (jumping) {
      animation?.playOther(JumpAnimationsEnum.jumpUpRight, flipX: false);
    } else {
      super.onPlayRunUpRightAnimation();
    }
  }

  @override
  void onPlayRunUpAnimation() {
    if (jumping) {
      if (lastDirectionHorizontal == Direction.left) {
        _playJumpUpLeft();
      } else {
        animation?.playOther(JumpAnimationsEnum.jumpUpRight, flipX: false);
      }
    } else {
      super.onPlayRunUpAnimation();
    }
  }

  void _playJumpUpLeft() {
    if (animation?.containOther(JumpAnimationsEnum.jumpUpLeft) == true) {
      animation?.playOther(JumpAnimationsEnum.jumpUpLeft);
    } else {
      animation?.playOther(
        JumpAnimationsEnum.jumpUpRight,
        flipX: true,
      );
    }
  }

  void _jumpDownLeft() {
    
    if (animation?.containOther(JumpAnimationsEnum.jumpDownLeft) == true) {
      animation?.playOther(JumpAnimationsEnum.jumpDownLeft);
    } else {
      animation?.playOther(
        JumpAnimationsEnum.jumpDownRight,
        flipX: true,
      );
    }
  }

  @override
  void onJump(JumpingStateEnum state) {
    super.onJump(state);
    if (state == JumpingStateEnum.idle) {
      if (lastDirectionHorizontal == Direction.left) {
        animation?.play(SimpleAnimationEnum.idleLeft);
      } else {
        animation?.play(SimpleAnimationEnum.idleRight);
      }
    }
  }

  @override
  void idle() {
    if (!jumping) {
      super.idle();
    }
  }
}
