 class GenericUpdateState<T> {

   final T? data;
  GenericUpdateState(this.data);
}
class GenericInitial<T> extends GenericUpdateState<T>{
  GenericInitial(super.data);}


