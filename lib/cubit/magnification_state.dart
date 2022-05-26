part of 'magnification_cubit.dart';

typedef OnMagnificationState<T, S extends MagnificationState> = T Function(S);

@immutable
abstract class MagnificationState {
  final Offset magnificationPosition;

  const MagnificationState(this.magnificationPosition);

  T? on<T>(
      {OnMagnificationState<T, NewPositionMagnificationState>? onPosition,
      OnMagnificationState<T, GotPaintableImageMagnificationState>?
          onPaintable}) {
    if (this is NewPositionMagnificationState && onPosition != null) {
      return onPosition(this as NewPositionMagnificationState);
    }

    if (this is GotPaintableImageMagnificationState && onPaintable != null) {
      return onPaintable(this as GotPaintableImageMagnificationState);
    }

    return null;
  }
}

class NewPositionMagnificationState extends MagnificationState {
  const NewPositionMagnificationState(super.magnificationPosition);
}

class GotPaintableImageMagnificationState extends MagnificationState {
  final ui.Image image;

  const GotPaintableImageMagnificationState(
      super.magnificationPosition, this.image);
}
