part of 'magnification_cubit.dart';

typedef OnMagnificationState<T, S extends MagnificationState> = T Function(S);

@immutable
abstract class MagnificationState {
  final Offset magnificationPosition;

  const MagnificationState(this.magnificationPosition);

  T? on<T>({
    OnMagnificationState<T, NewPositionMagnificationState>? onPosition,
  }) {
    if (this is NewPositionMagnificationState) {
      return onPosition!(this as NewPositionMagnificationState);
    }

    return null;
  }
}

class NewPositionMagnificationState extends MagnificationState {
  const NewPositionMagnificationState(super.magnificationPosition);
}

class RenderableRegionMagificationState extends MagnificationState {
  const RenderableRegionMagificationState(super.magnificationPosition);
}

class GotPaintableImageMagnificationState extends MagnificationState {
  final ui.Image image;

  const GotPaintableImageMagnificationState(
      super.magnificationPosition, this.image);
}
