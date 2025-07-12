abstract class Storage {
  /// Delete the key from the storage.
  Future<void> delete(final String key);

  /// Check if the key is in the storage.
  Future<bool> containsKey(final String key);

  /// Return a future that will return a optional string.
  Future<String?> read(final String key);

  /// A function that returns a future that will return void.
  Future<void> write(final String key, final String value);
}
