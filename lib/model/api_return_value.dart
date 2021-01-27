// Dibuat untuk sebagai tipe kembalian dari service
// yang akan digunakan untuk 2 buah data yaitu
// berhasil mengambil data pada class T dan
// gagal mengambil data pada String message

class ApiReturnValue<T> {
  final T value;
  final String message;

  ApiReturnValue({this.value, this.message});
}
