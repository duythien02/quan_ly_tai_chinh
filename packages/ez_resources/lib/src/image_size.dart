class ImageSize {
  const ImageSize(this.width, this.height);
  const ImageSize.fromHeight(final double iHeight)
      : width = null,
        height = iHeight;

  const ImageSize.fromWidth(final double iWidth)
      : width = iWidth,
        height = null;

  const ImageSize.square(final double dimension)
      : width = dimension,
        height = dimension;
  final double? width;
  final double? height;
}
