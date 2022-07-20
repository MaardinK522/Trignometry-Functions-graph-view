enum Function {
  Sine("Sine"),
    Cosine("Cosine"),
    Tangant("Tangant"),
    Cosecant("Cosecant"),
    Secant("Secant"),
    Cotangant("Cotangant");
  String string;
  Function(String string) {
    this.string = string;
  }
  public String toString() {
    return this.string;
  }
}
