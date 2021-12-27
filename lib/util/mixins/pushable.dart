import 'package:bonfire/bonfire.dart';

///
/// Created by
///
/// ─▄▀─▄▀
/// ──▀──▀
/// █▀▀▀▀▀█▄
/// █░░░░░█─█
/// ▀▄▄▄▄▄▀▀
///
/// Rafaelbarbosatec
/// on 23/12/21

/// To use this mixin the Component must have a `Movement` mixin.
mixin Pushable on ObjectCollision {
  bool enablePushable = true;

  @override
  bool onCollision(GameComponent component, bool active) {
    if (enablePushable) {
      if (this is Movement) {
        if (!active && component is Movement) {
          if (!onPush(component)) {
            return super.onCollision(component, active);
          }
          Vector2 displacement = this.center - component.center;
          if (displacement.x.abs() > displacement.y.abs()) {
            if (displacement.x < 0) {
              (this as Movement).moveLeft((this as Movement).speed);
            } else {
              (this as Movement).moveRight((this as Movement).speed);
            }
          } else {
            if (displacement.y < 0) {
              (this as Movement).moveUp((this as Movement).speed);
            } else {
              (this as Movement).moveDown((this as Movement).speed);
            }
          }
        }
      } else {
        print(
            'The mixin Pushable not working in ($this) because this component don`t have the `Movement` mixin');
      }
    }
    return super.onCollision(component, active);
  }

  /// If return true this component receives a push. If false not.
  bool onPush(GameComponent component) {
    return true;
  }
}
